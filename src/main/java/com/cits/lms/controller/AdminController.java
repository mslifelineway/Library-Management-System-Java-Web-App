
package com.cits.lms.controller;

import com.cits.lms.commands.AddBooksCommand;
import com.cits.lms.commands.AdminLoginCommand;
import com.cits.lms.domain.Admin;
import com.cits.lms.domain.Book;
import com.cits.lms.domain.BookDetailsWithCountIssuedBooks;
import com.cits.lms.domain.BookNumbers;
import com.cits.lms.domain.IssueBooks;
import com.cits.lms.domain.SingleBookDetailsWithBookNumbers;
import com.cits.lms.domain.Student;
import com.cits.lms.exceptions.StudentHaveThisBookAlreadyException;
import com.cits.lms.services.AdminServices;
import com.cits.lms.services.StudentServices;
import com.cits.lms.utils.ConstantsRequired;
import com.cits.lms.utils.StringUtil;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
    @Autowired
    private AdminServices adminServices;
    @Autowired
    private StudentServices studentServices;
    
    @RequestMapping(value = "/admin/hi")
    public String hello() {
        return "redirect:/hi"; //---- /WEB-INF/view/hello.jsp file will be return
    }
     @RequestMapping(value = "/hi")
    public String hi() {
        return "redirect:hello"; //---- /WEB-INF/view/hello.jsp file will be return
    }
    
    @RequestMapping(value = "/admin/login_form")
    public String adminLoginPage(Model m){
        m.addAttribute("admin_login_command", new AdminLoginCommand());
        return "admin_login"; 
    }
   
    @RequestMapping(value = "/admin/admin_dashboard")
    public String adminLogin(@ModelAttribute("admin_login_command") AdminLoginCommand lcmd, Model m, HttpSession session){
        
        String username = lcmd.getUsername().trim();
        String password = lcmd.getPassword().trim();
        if(username.equals("") || password.equals("")){
            return "redirect:/admin/login_form?act=fm"; //--- fm --> fields missing or empty fields
        }
        Admin a = adminServices.loginAdmin(username, password);
        if(a == null){
            return "redirect:/admin/login_form?act=ic";// ic ==> invalid credentials
        }
        else{
            this.addAdminToSession(a, session);
            return "redirect:/admin/dashboard"; //--- /WEB-INF/view/admin_dashboard.jsp page
        }
    }
    //--- this is used to redirecting to the admin_dasboard.jsp page through it's link
    @RequestMapping(value = "/admin/dashboard")
    public String adminDashboarePage(Model m){
        return "admin_dashboard"; 
    }
    //--- adding Admin to the session
    private void addAdminToSession(Admin a, HttpSession session){
        session.setAttribute("adminId", a.getAdminId());
        session.setAttribute("adminName", a.getName());
        session.setAttribute("adminUsername", a.getUsername());
    }
   
    //------- validating or checking all the bookNumbers which are going to store into database that it is already stored or not
    
//--- Adding Books By Admin ---> form page
    @RequestMapping(value = "/admin/add_books_page")
    public String addBooksPage(Model m){
        m.addAttribute("add_books_command", new AddBooksCommand());//-- command for add books form
      return "add_books"; //-- add_books.jsp page
    }
    
    @RequestMapping("admin/check_book_numbers")
    @ResponseBody
    public String checkBookNumbers(@RequestParam(required=false,value="bookNumbers[]") String[] bookNumbers){
        
      List<BookNumbers> bn = adminServices.isBookNumbersExists(bookNumbers);
     
      if(bn.isEmpty()){
          return "verified";
      }
      else{
          String[] existing_numbers = new String[bn.size()];
          for(int i=0 ; i<bn.size() ; i++){
              System.out.println("number : "+bn.get(i).getBookNumber());
              existing_numbers[i]= bn.get(i).getBookNumber();
          }
          return "Error : Failed due to existing Book Numbers : "+ StringUtil.toCommaSeperatedString(existing_numbers);
      }
    }
    
    //---- inserting or storing book details data of add_books.jsp page
    @RequestMapping(value = "admin/store_book_details")
    public String storeBookDetails(@ModelAttribute("add_books_command") AddBooksCommand abc, Model m,HttpSession session){
        String[] bookNo = abc.getBookNumbers();
        System.out.println("--- string array size: "+ bookNo.length);
        int totalBook=0;
        for (String bookNo1 : bookNo) {
            if(!bookNo1.equals(""))
                totalBook = totalBook+1;
        }
        Book b = new Book();
        b.setBookName(abc.getBookName());
        b.setAuthorName(abc.getAuthorName());
        b.setEdition(Integer.parseInt(abc.getEdition()));
        b.setDepartmentName(abc.getDeptName());
        b.setTotalBooks(totalBook);
        Integer adminId = (Integer) session.getAttribute("adminId");
        b.setAdminId(adminId);
        //--------- inserting book details only excepting bookNumbers
        Integer bookId= adminServices.insertBooksExceptBookNumbers(b);
        if(bookId==null){
            return "redirect:/admin/add_books_page?act=failed";
        }
        b.setBookId(bookId);
//        ------- Now Inserting bookNumbers in bookNumbers table
        adminServices.insertBookNumbers(bookNo,adminId,bookId);
        return "redirect:/admin/add_books_page?act=success";
        
    }
    
    //---------- displaying All Books ----------------
    @RequestMapping(value="/admin/library/all_books")
    public String displayAllBooks(Model m){
        /*--- retrieving all book details with book numbers --*/ 
        List<BookDetailsWithCountIssuedBooks> allBooksWithCountIssuedBooks = adminServices.bookDetailsWithCountIssuedBooks();
        m.addAttribute("allBooksWithCountIssuedBooks", allBooksWithCountIssuedBooks);
        return "all_books"; //---------- all_books.jsp --> page
    }
    
    //------------- display list of books of a single subject of a department ----
    @RequestMapping(value="/admin/library/view_book_list")
    public String displayListBooks(@RequestParam("bookId") Integer bookId, Model m){
        
        List<SingleBookDetailsWithBookNumbers> sb = adminServices.singleBookDetailsWithBookNumbers(bookId);
        m.addAttribute("SingleBookDetailsWithBookNumbers", sb);
        return "view_book_lists"; //--- view_book_lists.jsp page
    }
    
    //--- Admin logout ---//
    @RequestMapping(value = "/admin/logout")
    public String logoutAdmin(HttpSession session){
        session.invalidate();
        return "redirect:/admin/login_form?act=lo";
    }
    //---- getting all pending students for verify their accounts --//
    @RequestMapping(value="/students/pending_students")
    public String pendingStudents(Model m){
       List<Student> students =  adminServices.findAllPendingStudents();
       m.addAttribute("AllPendingStudents", students);
       return "all_pending_students"; //--- /WEB-INF/view/all_pending_students.jsp page
    }
    
    @RequestMapping(value = "/penging_students/verify")
    public String verifyPendingStudent(@RequestParam("student_id") Integer sId){
        System.out.println("----------------- student id : "+ sId);
        adminServices.verifyStudent(sId,ConstantsRequired.VERIFIED);
        return "redirect:/students/pending_students?act=v"; //--- verified
    }
    @RequestMapping(value = "/all_books/issue_book")
    public String issueBookPage(@RequestParam("bookId") Integer bookId,@RequestParam("bookNumber") Integer bookNumber,Model m){
       SingleBookDetailsWithBookNumbers singleBookDetailsWithBookNumbers = adminServices.singleBookDetails(bookId, bookNumber);
        m.addAttribute("singleBookDetailsWithBookNumbers", singleBookDetailsWithBookNumbers);
       return "issue_book_page";
    }

    //---------- finding student by student admission no or hall ticket no ----
    @RequestMapping(value = "/all_books/find_student")
    @ResponseBody
    public ModelAndView findStudent(@RequestParam("searchText") String searchText,@RequestParam("bookId") Integer bookId,@RequestParam("bookNumber")String bookNumber,Model m){
        System.out.println("------ search text---> "+ searchText);
        Student student = adminServices.findStudent(searchText);
        //--- check whether the bookNumber exists or not if not then only student can issue this book ---
        IssueBooks issueBooks = adminServices.findBookByBookNumber(bookNumber, ConstantsRequired.ISSUED);
        //-- COUNTING total books issued by a student ---
        Integer totalIssuedBooks = adminServices.countTotalIssuedBookByStudent(student.getStudentId(), ConstantsRequired.ISSUED);
        
        m.addAttribute("student", student);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("student_view");
        mav.addObject("student", student);
        mav.addObject("bookId", bookId);
        mav.addObject("bookNumber", bookNumber);
        mav.addObject("totalIssuedBooks", totalIssuedBooks);
        mav.addObject("issueBooks", issueBooks);
    return mav;     
//        return "Hello";
    }
    
    @RequestMapping(value = "/admin/issue_books/confirm")
    public String confirmIssueBook(@RequestParam("bookId")Integer bookId,@RequestParam("bookNumber") String bookNo,@RequestParam("studentId") Integer sId,HttpSession session,Model m){
        //---- Now inserting the data into issue_books table--//
        /**
         * if student has taken this book then StudentHaveThisBookAlreadyException will through and student will not able take this book
         * but if he had return this book already and again taking then he will be able to take this book
         */
        Integer adminId = (Integer)session.getAttribute("adminId");
        IssueBooks ib = new IssueBooks();
         ib.setAdminId(adminId);
         ib.setBookNumber(bookNo);
         ib.setStudentId(sId);
         ib.setBookId(bookId);
         
         try {
            adminServices.issueBook(ib,ConstantsRequired.ISSUED); //--- ISSUED=1; RETURNED=2;
            m.addAttribute("bookId", bookId);
            m.addAttribute("bookNumber", bookNo);
            return "redirect:/all_books/issue_book?act=ss";
        } catch (StudentHaveThisBookAlreadyException studentHaveThisBookAlreadyException) {
            m.addAttribute("bookId", bookId);
            m.addAttribute("bookNumber", bookNo);
            return "redirect:/all_books/issue_book?act=be";//-------- student have this subject books be==> book exists//
        }
         
    }
    
    //---- view student profile --//
    @RequestMapping(value = "/student/view_profile")
    public String viewStudentProfile(@RequestParam("studentId") Integer studentId, Model m){
       Student student= studentServices.getStudent(studentId);
       m.addAttribute("student", student);
       return "view_student_profile"; //---this jsp page will access only by admin
    }
    
    ////////--- counting all pending students and returning total count as resoponse to the ajax call --///
    @RequestMapping(value = "/admin/count_pending_students")
    @ResponseBody
    public String getCountPendingStudents(){
        int count = adminServices.getCountPendingStudents();
        String totalCount = String.valueOf(count);
        return totalCount;
    }
}
