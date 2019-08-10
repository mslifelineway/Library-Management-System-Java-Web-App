package com.cits.lms.testing;

import com.cits.lms.config.SpringRootConfig;
import com.cits.lms.domain.Book;
import com.cits.lms.domain.BookNumbers;
import com.cits.lms.domain.BooksDetailsWithBookNumbers;
import com.cits.lms.domain.IssueBooks;
import com.cits.lms.dto.StudentLibrary;
import com.cits.lms.services.AdminServices;
import com.cits.lms.services.StudentServices;
import java.util.List;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class TestStudentLibrary {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringRootConfig.class);
        StudentServices ss = ctx.getBean(StudentServices.class);

        List<StudentLibrary> bb = ss.getStudentLibrary(1);
        if (bb.isEmpty()) {
            System.out.println("------------- no record found on joining ------");
        } else {
            int x = 0;
            for (StudentLibrary sl : bb) {
                System.out.println("```````````````````````````````````````````````````````````````");
                System.out.println("------student Book : " + (++x) + " complete Details--------");
                Book b = sl.getBook();
                BookNumbers bn = sl.getBookNumbers();
                IssueBooks ib = sl.getIssueBooks();
                
                System.out.println("Book Id :" + b.getBookId());
                System.out.println("Book Name : " + b.getBookName());
                System.out.println("Author name: " + b.getAuthorName());
                System.out.println("Edition : " + b.getEdition());
                System.out.println("Department name: " + b.getDepartmentName());
                System.out.println("Admin Id (From Books Table) :" + b.getAdminId());
                System.out.println("Uploaded Date :" + b.getBookUploadedDate());
                
                System.out.println(" Book Number: " + bn.getBookNumber());
                System.out.println("Issyed date: "+ ib.getIssuedDate());
                System.out.println("Issued status : "+ ib.getStatus());
                System.out.println("```````````````````````````````````````````````````````````````");
            }
        }

    }

}
