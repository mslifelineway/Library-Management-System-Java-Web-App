package com.cits.lms.testing;

import com.cits.lms.config.SpringRootConfig;
import com.cits.lms.domain.Book;
import com.cits.lms.domain.BookDetailsWithCountIssuedBooks;
import com.cits.lms.domain.BookNumbers;
import com.cits.lms.services.AdminServices;
import java.util.List;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class TestBookDetailsWithCountIssuedBooks {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringRootConfig.class);
        AdminServices as = ctx.getBean(AdminServices.class);
        Book b ;
        BookNumbers bn;
        BookDetailsWithCountIssuedBooks ib = new BookDetailsWithCountIssuedBooks();
        List<BookDetailsWithCountIssuedBooks> bi = as.bookDetailsWithCountIssuedBooks();
        if(bi==null){
            System.out.println("====================== No Data Found =================");
            
        }else{
            System.out.println("-------- size of the list : "+ bi.size());
            for(BookDetailsWithCountIssuedBooks bb : bi){
                b = bb.getBook();
                System.out.println("========== book NAME : " + b.getBookName());
                System.out.println("=============== count : "+bb.getCountIssuedBook());
                
                
                
            }
            
            
            
        }
    }

}
