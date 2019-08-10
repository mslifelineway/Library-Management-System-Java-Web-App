package com.cits.lms.testing;

import com.cits.lms.DAO.StudentDAO;
import com.cits.lms.config.SpringRootConfig;
import com.cits.lms.domain.Student;
import com.cits.lms.services.AdminServices;
import com.cits.lms.utils.ConstantsRequired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class TestTotalIssuedBookByAStudent {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringRootConfig.class);
        AdminServices as = ctx.getBean(AdminServices.class);
        Integer count = as.countTotalIssuedBookByStudent(1, 1);
        
        System.out.println("-------**************-------- count = "+ count);

    }

}
