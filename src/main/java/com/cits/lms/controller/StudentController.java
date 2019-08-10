package com.cits.lms.controller;

import com.cits.lms.commands.FileUpload;
import com.cits.lms.commands.StudentLoginCommand;
import com.cits.lms.commands.StudentProfileDataCommand;
import com.cits.lms.commands.StudentRegCommand;
import com.cits.lms.domain.BookDetailsWithCountIssuedBooks;
import com.cits.lms.domain.SingleBookDetailsWithBookNumbers;
import com.cits.lms.domain.Student;
import com.cits.lms.dto.StudentLibrary;
import com.cits.lms.exceptions.StudentNotVerifiedException;
import com.cits.lms.services.AdminServices;
import com.cits.lms.services.StudentServices;
import com.cits.lms.utils.ConstantsRequired;
import com.cits.lms.utils.LmsHelperClass;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Controller
public class StudentController {

    @Autowired
    private StudentServices studentServices;
    @Autowired
    private AdminServices adminServices;

    @RequestMapping("/hello")
    public String hello() {
        return "hello"; //---- /WEB-INF/view/hello.jsp file will be return
    }

    @RequestMapping(value = {"/", "/index"})
    public String index(Model m) {
        m.addAttribute("student_login_command", new StudentLoginCommand());
        return "index"; //--- jsp page--> /WEB-INF/view/index/.jsp====> this is home page and student login page
    }

//--- student login method -> when login button click then it will call and form data will be retrieve here
    @RequestMapping(value = "/student/login")
    public String StudentLogin(@ModelAttribute("student_login_command") StudentLoginCommand cmd, Model m, HttpSession session) {
        String admission_no = cmd.getAdmissionNo();
        String password = cmd.getPassword();
        if (admission_no.trim().equals("") || password.trim().equals("")) {
            return "redirect:/index?act=fm";
        } else {
            Student student = studentServices.loginStudent(admission_no, password);
            if (student == null) {
                return "redirect:/index?act=ic";
            } else {
                this.addStudentSession(student, session);
                m.addAttribute("formUpload", new FileUpload());
                return "redirect:/student/student_dashboard";
            }

        }
    }

    //---- Redirecting directly to the Student Dashboard --//
    @RequestMapping(value = "/student/student_dashboard")
    public String studentDashboard(HttpSession session, Model m) {
        Integer studentId = (Integer) session.getAttribute("studentId");

        Student student = studentServices.getStudent(studentId);
        m.addAttribute("StudentProfile", student);
        m.addAttribute("student_profile_data_command", new StudentProfileDataCommand());
        return "student_dashboard";

    }

    //--- adding student details in session after login successfully
    private void addStudentSession(Student s, HttpSession session) {
        session.setAttribute("student", s);
        session.setAttribute("studentId", s.getStudentId());
        session.setAttribute("studentAdmissionNo", s.getAdmissionNo());
        session.setAttribute("studentName", s.getStudentName());
    }

    /*------- code for student registration goes here... ---*/
    @RequestMapping(value = "/student/registration_form")
    public String studentRegForm(Model m) {
        m.addAttribute("student_reg_command", new StudentRegCommand());
        return "student_reg_form"; //--- jsp page--> /WEB-INF/view/student_reg_form.jsp
    }

    @RequestMapping(value = "/student/register", method = RequestMethod.POST)
    public String studentRegistration(@ModelAttribute("student_reg_command") StudentRegCommand rcmd, Model m) {

        Student s = rcmd.getStudent();
        String student_name = s.getStudentName();
        String admission_no = s.getAdmissionNo();
        String contact_no = s.getContactNo();
        String password = s.getPassword();
        Integer birth_date = rcmd.getBirth_date();
        String birth_month = rcmd.getBirth_month();
        Integer birth_year = rcmd.getBirth_year();

        if (student_name.trim().equals("") || admission_no.trim().equals("") || contact_no.trim().equals("")
                || password.trim().equals("") || birth_date == 0 || birth_month.trim().equals("") || birth_year == 0) {
            return "redirect:/student/registration_form?act=fm";
        }

        if (admission_no.trim().length() > 10) {
            return "redirect:/student/registration_form?act=lg_ano";
        }

        if (!LmsHelperClass.validateContactNumber(contact_no)) {
            return "redirect:/student/registration_form?act=ic"; //-- ic--> invalid contact no
        }
        if (contact_no.trim().length() > 15) {
            return "redirect:/student/registration_form?act=lg_cno";
        }

        //--- Now checking whether the student is alreay registered or not. If yes then check his account is verifed or not.
        try {
            Student st = studentServices.isStudentExists(s);
            if (st == null) {
                //--- student has not registered yet. so Let's register his account
                //--- Now adding some more DEFAULT fields...
                //--- Birthday
                s.setBirthDate(birth_date + "/" + birth_month + "/" + birth_year);
                //-- VAR_CODE
                s.setVarCode(ConstantsRequired.getRandomKey());
                //--- ACCOUNT_STATUS ===> verified=2 or not verified=1
                s.setStatus(ConstantsRequired.NOT_VERIFIED);
                //--- profile image
                s.setProfileImage(ConstantsRequired.DEFAULT_PROFILE_IMAGE);
                s.setHallTicketNo("");
//                //-- we are going to take some values from student, later will be taken but before performing any operation by admin.
//                //---- COURSE=0 , year=0 ==> 
//                //means there is no any course specified for the student, after his verification student's remaining data will be taken
//                //and then when any operation will perform by admin to student it we will check whether these fields sholud not be zero.
                s.setCourse(0);
                s.setYear(0);
                s.setSem(0);

                studentServices.registerStudent(s);
                return "redirect:/index?act=reg";//-- reg ==> registered successfully
            } else {
                return "redirect:/student/registration_form?act=ar";//-- ar---> already registered and verified also
            }

        } catch (StudentNotVerifiedException studentNotVerifiedException) {
            return "redirect:/student/registration_form?act=nv"; //-- nv--> not verified
        }
    }

    //-------- student Logout ----------//
    @RequestMapping(value = "/student/logout")
    public String logoutStudent(HttpSession session) {
        session.invalidate();
        return "redirect:/index?act=lo";
    }

    //---------- displaying All Books (This method is Implemented in AdminServices class)----------------
    @RequestMapping(value = "/student/library/all_books")
    public String displayAllBooks(Model m) {
        List<BookDetailsWithCountIssuedBooks> allBooksWithCountIssuedBooks = adminServices.bookDetailsWithCountIssuedBooks();
        m.addAttribute("allBooksWithCountIssuedBooks", allBooksWithCountIssuedBooks);
        return "students/all_books"; //---------- all_books.jsp --> page
    }

    //------------- display list of books of a single subject of a department (This page is Implemented in AdminServices class) ----
    @RequestMapping(value = "/student/library/view_book_list")
    public String displayListBooks(@RequestParam("bookId") Integer bookId, Model m) {

        List<SingleBookDetailsWithBookNumbers> sb = adminServices.singleBookDetailsWithBookNumbers(bookId);
        m.addAttribute("SingleBookDetailsWithBookNumbers", sb);
        return "students/view_book_lists"; //--- view_book_lists.jsp page
    }

    //-------- inserting all the profile data of the student (AFTER THIS REQUEST WILL SEND TO THE ADMIN TO VERIFY STUDENT ACCOUNT) with image---
    @RequestMapping(value = "/student/submit_profile_data", method = RequestMethod.POST)
    public String upload(@ModelAttribute("student_profile_data_command") StudentProfileDataCommand cmd, Model m, HttpSession session) throws IOException {
        FileUpload fileUpload = cmd.getFileUpload();
        //// getting student by session
        Student student = (Student) session.getAttribute("student");
        ///// getting form data ////
        Student s = cmd.getStudent();
        System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ student name : "+ student.getStudentName());
        String htno = s.getHallTicketNo();
        int course = s.getCourse();
        int year = s.getYear();
        int semester = s.getSem();
        
        //// setting form data to 'student' object ////
        student.setHallTicketNo(htno);
        student.setCourse(course);
        student.setYear(year);
        student.setSem(semester);
        
        if (htno.equals("")) {
            return "redirect:/student/student_dashboard?act=htno";
        }
        CommonsMultipartFile[] commonsMultipartFiles = fileUpload.getFiles();

        if (commonsMultipartFiles[0].getOriginalFilename().equals("")) {
            return "redirect:/student/student_dashboard?act=NO image selected";//
        }
        List<String> st = LmsHelperClass.processUpload(fileUpload, (Integer) session.getAttribute("studentId"));
        //-------- after uploading student profile image set image name into the studentProfileImage --//
        student.setProfileImage(st.get(0));
        Integer studentId = (Integer) session.getAttribute("studentId");
        student.setStudentId(studentId);
        studentServices.updateStudentProfile(student);
        /////////////////-- Now again getting all the student complete details and adding to the session ////////
        Student studentDetails = studentServices.getStudent(studentId);
        this.addStudentSession(studentDetails, session);
        return "redirect:/student/student_dashboard?act=success";
    }

    /////// getting student library by student id //////
    @RequestMapping(value = "/student/student_library")
    public String studentLibrary(HttpSession session, Model m) {
        Integer studentId = (Integer) session.getAttribute("studentId");
        List<StudentLibrary> studentLibrary = studentServices.getStudentLibrary(studentId);
        m.addAttribute("StudentLibrary", studentLibrary);
        return "student_library";//--- student_library.jsp page
    }

    /////// view student profile ----> this page will access by student ////
    @RequestMapping(value = "/student/my_profile")
    public String viewMyProfile(Model m, HttpSession session) {
        Integer studentId = (Integer) session.getAttribute("studentId");
        Student student = studentServices.getStudent(studentId);
        m.addAttribute("student", student);
        return "students/student_profile";
    }

    ////////// updating student profile except profile image //////
    @RequestMapping(value = "/student/update_profile")
    public String updateProfile(Model m, HttpSession session) {
        Integer studentId = (Integer) session.getAttribute("studentId");
        Student student = studentServices.getStudent(studentId);
        session.setAttribute("studentAdmissionNo", student.getAdmissionNo());
        String str[] = student.getBirthDate().split("/");
        int date = Integer.parseInt(str[0]);
        int year = Integer.parseInt(str[2]);
        StudentRegCommand src = new StudentRegCommand();
        src.setStudent(student);
        src.setBirth_date(date);
        src.setBirth_month(str[1]);
        src.setBirth_year(year);
        m.addAttribute("student_profile_data_command", src);
        return "students/update_student_profile";
    }

    /////// confirm profile updation //////
    @RequestMapping(value = "/student/confirm_profile_updation")
    public String confirmProfileUpdation(@ModelAttribute("student_profile_data_command") StudentRegCommand cmd, Model m, HttpSession session) {
        Student s = cmd.getStudent();
        System.out.println("------- student object in updation : " + s);
        Integer studentId = (Integer) session.getAttribute("studentId");
        s.setStudentId(studentId);
        String student_name = s.getStudentName();
        String admission_no = s.getAdmissionNo();
        String contact_no = s.getContactNo();
        String hall_ticket_no = s.getHallTicketNo();
        int course = s.getCourse();
        int sem = s.getSem();
        int year = s.getYear();
        Integer birth_date = cmd.getBirth_date();
        String birth_month = cmd.getBirth_month();
        Integer birth_year = cmd.getBirth_year();
        //--- Birthday
        s.setBirthDate(birth_date + "/" + birth_month + "/" + birth_year);
        if (student_name.trim().equals("") || admission_no.trim().equals("") || contact_no.trim().equals("")
                || birth_date == 0 || birth_month.trim().equals("") || birth_year == 0 || hall_ticket_no.equals("")
                || course == 0 || sem == 0 || year == 0) {
            return "redirect:/student/update_profile?act=fm";
        }

        if (admission_no.trim().length() > 10) {
            return "redirect:/student/update_profile?act=lg_ano";
        }

        if (!LmsHelperClass.validateContactNumber(contact_no)) {
            return "redirect:/student/update_profile?act=ic"; //-- ic--> invalid contact no
        }
        if (contact_no.trim().length() > 15) {
            return "redirect:/student/update_profile?act=lg_cno";
        }

        ////// check whether the student new admission no is already in use or not ////
        Student st = null;
        try {
            if (!admission_no.trim().equals(session.getAttribute("studentAdmissionNo"))) {
                st = studentServices.isStudentExists(s);
            }
            if (st == null) {
                //--- student has not registered yet. so Let's update his account
                studentServices.updateStudentProfile(s);
                session.removeAttribute("studentAdmissionNo");
                return "redirect:/student/update_profile?act=updated";//-- reg ==> registered successfully
            } else {
                return "redirect:/student/update_profile?act=ar";//-- ar---> already registered and verified also
            }
        } catch (StudentNotVerifiedException studentNotVerifiedException) {
            return "redirect:/student/update_profile?act=nv";
        }

    }

    ////////// updating student profile image //////
    @RequestMapping(value = "/student/update_profile_image")
    public String updateProfileImage(Model m, HttpSession session) {
        Integer studentId = (Integer) session.getAttribute("studentId");
        Student student = studentServices.getStudent(studentId);
        m.addAttribute("student", student);
        m.addAttribute("student_profile_data_command", new StudentProfileDataCommand());
        return "students/update_student_profile_image";
    }

    ////////// updating student profile image //////
    @RequestMapping(value = "/student/get_cropped_image")
    @ResponseBody
    public String getCroppedImageUpload(@RequestParam("image") Object image, HttpSession session) throws IOException, Exception {
        String response = "";
        Integer studentId = (Integer) session.getAttribute("studentId");
        System.out.println("------> studentId : "+ studentId);
        System.out.println("========= image file : "+ image.toString());
        ///// image in the form of base64 encoded :  data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAADICAYAAACtWK6
        String image_name = studentId + "_" + ConstantsRequired.getRandomKey() + ".png"; // this image_name will store in database
        if(LmsHelperClass.uploadImage(image.toString(), image_name)){
            if(studentServices.updateProfileImage(image_name, studentId)){
                session.setAttribute("student", studentServices.getStudent(studentId));
              response = "SUCCESS";
            }
            else{
                response = "FAILED";
            }
        }
        else{
            response = "FAILED";
        }
        return response;
    }
    
    /////// AUTO-COMPLETE SEARCHING 
    @RequestMapping(value = "/auto_search_data/search_data")
    @ResponseBody
    public String autoCompleteSearch(@RequestParam(required = false, value = "Input") String input){
        System.out.println("--------- search input is : "+ input);
        return "hello";
    }
}
