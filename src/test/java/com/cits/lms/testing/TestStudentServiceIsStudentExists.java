package com.cits.lms.testing;

import com.cits.lms.DAO.StudentDAO;
import com.cits.lms.config.SpringRootConfig;
import com.cits.lms.domain.Student;
import com.cits.lms.exceptions.StudentNotVerifiedException;
import com.cits.lms.services.StudentServices;
import com.cits.lms.utils.ConstantsRequired;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class TestStudentServiceIsStudentExists {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringRootConfig.class);
        StudentServices studentServices = ctx.getBean(StudentServices.class);
        Student s = new Student();

        s.setStudentName("Mankesh Kumar");
        s.setAdmissionNo("E16356");
        s.setHallTicketNo("16443T0956");
        s.setCourse(ConstantsRequired.CSE_COURSE);
        s.setYear(ConstantsRequired.THIRD_YEAR);
        s.setSem(ConstantsRequired.SECOND_SEM);
        s.setContactNo("7015720216");
        s.setPassword("mukesh@123");
        s.setVarCode(ConstantsRequired.getRandomKey());
        s.setBirthDate("18/12/1998");
        s.setProfileImage(ConstantsRequired.DEFAULT_PROFILE_IMAGE);
        s.setStatus(ConstantsRequired.NOT_VERIFIED);
        try {
           Student student = studentServices.isStudentExists(s);
           if(student == null){
               System.out.println("---------- All Done :) student account is ready to register ------");
               
           }
           else{
               System.out.println("---------- student is already registered on this admission no-------");
           }
        } catch (StudentNotVerifiedException ex) {
            System.out.println("------------ Exception: "+ ex);
           // Logger.getLogger(TestStudentServiceIsStudentExists.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
