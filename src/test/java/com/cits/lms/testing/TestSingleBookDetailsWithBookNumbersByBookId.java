package com.cits.lms.testing;

import com.cits.lms.config.SpringRootConfig;
import com.cits.lms.domain.Book;
import com.cits.lms.domain.BookNumbers;
import com.cits.lms.domain.IssueBooks;
import com.cits.lms.domain.SingleBookDetailsWithBookNumbers;
import com.cits.lms.domain.Student;
import com.cits.lms.services.AdminServices;
import java.util.List;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class TestSingleBookDetailsWithBookNumbersByBookId {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringRootConfig.class);
        AdminServices as = ctx.getBean(AdminServices.class);

        List<SingleBookDetailsWithBookNumbers> sb = as.singleBookDetailsWithBookNumbers(14);
        if (sb.isEmpty()) {
            System.out.println("------------- no record found on joining ------");
        } else {
            int x = 0;
            System.out.println("================= list size : "+ sb.size()+ " ==================");
            for (SingleBookDetailsWithBookNumbers bbn : sb) {
                System.out.println("=========================================");
                System.out.println("=========================================");
                
                Book b = bbn.getBook();
                IssueBooks ib = bbn.getIssueBooks();
                BookNumbers bn = bbn.getBookNumbers();
                Student st = bbn.getStudent();
                
                System.out.println("~~~~~~~~~~~~~~~~~~~~ book details ~~~~~~~~~~~~~~~~~~~~~~~~~~");
                System.out.println("book_id : "+ b.getBookId());
                System.out.println("book name : "+ b.getBookName());
                System.out.println("author name : " + b.getAuthorName());
                System.out.println("admin id : "+ b.getAdminId());
                System.out.println("uploaded date : "+ b.getBookUploadedDate());
                System.out.println("department name : "+ b.getDepartmentName());
                System.out.println("edition : " + b.getEdition());
                System.out.println("total books : "+ b.getTotalBooks());
                
                System.out.println("~~~~~~~~~~~~~~~~~~~~ Book Numbers with book id ~~~~~~~~~~~~~~~~");
//                System.out.println("book_id : "+ bn.getBookId());
                System.out.println("book number : "+ bn.getBookNumber());
//                System.out.println("admin id : "+ bn.getAdminId());
                System.out.println("book number id : "+ bn.getBookNumberId());
                
                System.out.println("~~~~~~~~~~~~~~~~~~~ Issued Book With Book Id and Book Numbers ~~~~~~~");
                System.out.println("issued id : "+ ib.getIssuedId());
//                System.out.println("book id : " + ib.getBookId());
//                System.out.println("book number : "+ ib.getBookNumber());
//                System.out.println("student id : "+ ib.getStudentId());
                   System.out.println("admin id (issued by : ) : "+ ib.getAdminId());
                System.out.println("issued date : "+ ib.getIssuedDate());
                
                System.out.println("~~~~~~~~~~~~~~~~~~~ Student Details To whom book is issued ~~~~~~~~~~~~~~");
                System.out.println("student Id : " + st.getStudentId());
                System.out.println("student name : "+ st.getStudentName());
                System.out.println("profile image : "+ st.getProfileImage());
                System.out.println("Admission No : "+ st.getAdmissionNo());
                System.out.println("Hall Ticket No : "+ st.getHallTicketNo());
                
               
            }
        }

    }

}
