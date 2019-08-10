package com.cits.lms.testing;

import com.cits.lms.DAO.StudentDAO;
import com.cits.lms.config.SpringRootConfig;
import com.cits.lms.domain.Student;
import com.cits.lms.utils.ConstantsRequired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class TestStudentDAOUpdate {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringRootConfig.class);
        StudentDAO studentDAO = ctx.getBean(StudentDAO.class);
        Student s = new Student();

        s.setStudentId(2);
        s.setStudentName("M Kumar");
        s.setAdmissionNo("E14039");
        s.setHallTicketNo("16443T0947");
        s.setCourse(ConstantsRequired.ECE_COURSE);
        s.setYear(ConstantsRequired.SECOND_YEAR);
        s.setSem(ConstantsRequired.FIRST_SEM);
        s.setContactNo("902999383");
        s.setVarCode(ConstantsRequired.getRandomKey());
        s.setBirthDate("04/06/1999");
        s.setProfileImage("updated_"+ConstantsRequired.DEFAULT_PROFILE_IMAGE);
        s.setStatus(ConstantsRequired.VERIFIED);
        studentDAO.updateStudent(s);

    }

}
