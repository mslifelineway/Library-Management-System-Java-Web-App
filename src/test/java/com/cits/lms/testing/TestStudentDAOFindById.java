package com.cits.lms.testing;

import com.cits.lms.DAO.StudentDAO;
import com.cits.lms.config.SpringRootConfig;
import com.cits.lms.domain.Student;
import com.cits.lms.utils.ConstantsRequired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class TestStudentDAOFindById {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringRootConfig.class);
        StudentDAO studentDAO = ctx.getBean(StudentDAO.class);
        Student s = studentDAO.findStudentById(2);
        System.out.println("-------------- student details --------------");
        System.out.println("student id: "+ s.getStudentId());
        System.out.println(" name: "+ s.getStudentName());
        System.out.println(" admission no : "+ s.getAdmissionNo());
        System.out.println(" course: "+ s.getCourse());
        System.out.println(" contact no : "+ s.getContactNo());
        System.out.println(" year: "+ s.getYear());
        System.out.println(" semester : "+ s.getSem());
        System.out.println(" hall ticket no : "+ s.getHallTicketNo());
        System.out.println(" birthdate : "+ s.getBirthDate());
        System.out.println(" registration date : "+ s.getRegDate());
        System.out.println(" profile image: "+ s.getProfileImage());
        
    }

}
