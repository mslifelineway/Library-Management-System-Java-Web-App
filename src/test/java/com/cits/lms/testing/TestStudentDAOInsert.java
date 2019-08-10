package com.cits.lms.testing;

import com.cits.lms.DAO.StudentDAO;
import com.cits.lms.config.SpringRootConfig;
import com.cits.lms.domain.Student;
import com.cits.lms.utils.ConstantsRequired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class TestStudentDAOInsert {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringRootConfig.class);
        StudentDAO studentDAO = ctx.getBean(StudentDAO.class);
        Student s = new Student();

        s.setStudentName("Mankesh Kumar");
        s.setAdmissionNo("E16344");
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
        studentDAO.insertStudent(s);

    }

}
