package com.cits.lms.testing;

import com.cits.lms.config.SpringRootConfig;
import com.cits.lms.domain.Book;
import com.cits.lms.domain.BookNumbers;
import com.cits.lms.domain.BooksDetailsWithBookNumbers;
import com.cits.lms.services.AdminServices;
import java.util.List;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class TestBooksDetailsWithBookNumbers {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringRootConfig.class);
        AdminServices as = ctx.getBean(AdminServices.class);

        List<BooksDetailsWithBookNumbers> bb = as.findBookDetailsWithBookNumbers();
        if (bb.isEmpty()) {
            System.out.println("------------- no record found on joining ------");
        } else {
            int x = 0;
            for (BooksDetailsWithBookNumbers bbn : bb) {
                System.out.println("------ Book : " + (++x) + " complete Details--------");
                Book b = bbn.getBook();
                BookNumbers bn = bbn.getBookNumbers();
                System.out.println("Book Id (From Books Table) :" + b.getBookId());
                System.out.println("Book Id (From Book Numbers Table) :" + bn.getBookId());
                System.out.println("Admin Id (From Books Table) :" + b.getAdminId());
                System.out.println("Admin Id (Book Numbers Table) :" + bn.getAdminId());
                System.out.println("Book Number Id (Book Numbers Table) :" + bn.getBookNumberId());
                System.out.println("Book Name : " + b.getBookName());
                System.out.println("Author name: " + b.getAuthorName());
                System.out.println("Edition : " + b.getEdition());
                System.out.println("Department name: " + b.getDepartmentName());
                System.out.println(" Book Number: " + bn.getBookNumber());
                System.out.println("Uploaded Date :" + b.getBookUploadedDate());

            }
            System.out.println("--------- joined object : " + bb);
        }

    }

}
