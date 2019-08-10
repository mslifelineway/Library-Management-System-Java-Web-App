package com.cits.lms.testing;

import com.cits.lms.DAO.BookDao;
import com.cits.lms.config.SpringRootConfig;
import com.cits.lms.domain.Book;
import com.cits.lms.utils.ConstantsRequired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class TestBookDaoImpInsertion {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringRootConfig.class);
        BookDao bookDao = ctx.getBean(BookDao.class);
        Book b = new Book();
        
        b.setAdminId(2);
        b.setBookName("Ansi C");
        b.setAuthorName("Balaguruswami");
        b.setDepartmentName(ConstantsRequired.CSE_COURSE);
        b.setEdition(6);
        b.setTotalBooks(5);
        bookDao.addBook(b);
        System.out.println("-------- book id: "+ b.getBookId()+ "--------- ");
        System.out.println("----------------- book added successfully ------");

    }

}
