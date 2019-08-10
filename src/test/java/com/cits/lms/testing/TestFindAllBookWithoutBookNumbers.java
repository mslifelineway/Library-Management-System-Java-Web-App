package com.cits.lms.testing;

import com.cits.lms.DAO.BookDao;
import com.cits.lms.config.SpringRootConfig;
import com.cits.lms.domain.Book;
import java.util.List;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class TestFindAllBookWithoutBookNumbers {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringRootConfig.class);
        BookDao bookDao = ctx.getBean(BookDao.class);
        List<Book> books;

        books = bookDao.findAllBooks();
        if(books == null){
            System.out.println("----------------- There is no record found or No book found -----");
        }
        else{
            int x=0;
            for(Book b : books){
                System.out.println("---- book : "+ (++x) + " ----- details -----");
                System.out.println("Book Id : "+ b.getBookId());
                System.out.println("Book Name : " + b.getBookName());
                System.out.println("Author name : "+ b.getAuthorName());
                System.out.println("Admin Id : " + b.getAdminId());
                System.out.println("Edition : "+ b.getEdition());
                System.out.println("Department Name : "+ b.getDepartmentName());
                System.out.println("Uploaded Date : "+ b.getBookUploadedDate());
            }
        }

    }

}
