
package com.cits.lms.services;

import com.cits.lms.domain.BooksDetailsWithBookNumbers;
import com.cits.lms.domain.Student;
import com.cits.lms.dto.StudentLibrary;
import com.cits.lms.exceptions.StudentNotVerifiedException;
import java.util.List;

public interface StudentServices {
    
    public void registerStudent(Student s);
    /**====== THIS INFORMATION IS NOT FULL FILLED, THIS MAY CHANGE LATER ===
     * for login purpose : required fields : String admissionNo, String password.
     * In this method we will also check whether the user has verified by Librarian or not
     * @param admissionNo
     * @param password
     * @return 
     */
    
    public Student loginStudent(String admissionNo, String password);
    /** -========== THIS INFO IS NOT COMPLETE CONFIRM ===== IT MAY MODIFIY LATER ===
     * Before registering student account need to check whether the student account already exists or not
     * required fields : Student s;
     * if student will not enter the OTP no sent on his contact then his registration will be refused and data will not save. 
     * But, if he enters OTP and this process is done then one link with VAR_CODE and s_id (student id)
     * will be sent to the Admin Profile to verify student id;
     * ADMIN VERIFICATION PROCESS : he has to open on the link but after matching student data with college id
     * NOTE : student verification link will show only if student profile is unverified.
     *  
     * @param s
     * @return 
     * @throws com.cits.lms.exceptions.StudentNotVerifiedException 
     */
    public Student isStudentExists(Student s) throws StudentNotVerifiedException;
    
    /**
     *
     * @param studentId
     * @return
     */
    public Student getStudent(Integer studentId);

    /**
     *
     * @param st
     */
    public void updateStudentProfile(Student st);
    
    public List<StudentLibrary> getStudentLibrary(Integer studentId);

    public boolean updateProfileImage(String uploaded_image_name, Integer studentId);
}
