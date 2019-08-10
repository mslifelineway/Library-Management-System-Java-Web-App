package com.cits.lms.testing;

import com.cits.lms.config.SpringRootConfig;
import com.cits.lms.domain.Admin;
import com.cits.lms.domain.Student;
import com.cits.lms.exceptions.StudentNotVerifiedException;
import com.cits.lms.services.AdminServices;
import com.cits.lms.services.StudentServices;
import com.cits.lms.utils.ConstantsRequired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class TestAdminServicesAdminExists {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringRootConfig.class);
        AdminServices as = ctx.getBean(AdminServices.class);
        Admin a = new Admin();

        Admin ad = as.loginAdmin("mankesh", "mankesh@123");
        if (ad == null) {
            System.out.println("---------- Admin does not exists------");

        } else {
            System.out.println("---------- admin exists ------");
        }
    }

}
