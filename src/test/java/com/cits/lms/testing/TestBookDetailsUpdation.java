package com.cits.lms.testing;

import com.cits.lms.DAO.BookDao;
import com.cits.lms.config.SpringRootConfig;
import com.cits.lms.domain.Book;
import com.cits.lms.utils.ConstantsRequired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class TestBookDetailsUpdation {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringRootConfig.class);
        BookDao bookDao = ctx.getBean(BookDao.class);
        Book b = new Book();

        b.setAdminId(2);
        b.setBookId(4); //--- updating record of book_id=4
        b.setBookName("Head First C");
        b.setAuthorName("B. Mathur");
        b.setDepartmentName(ConstantsRequired.ME_COURSE);
        b.setEdition(4);

        bookDao.updateBook(b);
        System.out.println("----------------- book_id: 4 updated successfully ------");

    }

}
