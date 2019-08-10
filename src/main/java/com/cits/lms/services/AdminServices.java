
package com.cits.lms.services;

import com.cits.lms.domain.Admin;
import com.cits.lms.domain.Book;
import com.cits.lms.domain.BookDetailsWithCountIssuedBooks;
import com.cits.lms.domain.BookNumbers;
import com.cits.lms.domain.BooksDetailsWithBookNumbers;
import com.cits.lms.domain.IssueBooks;
import com.cits.lms.domain.SingleBookDetailsWithBookNumbers;
import com.cits.lms.domain.Student;
import com.cits.lms.exceptions.StudentHaveThisBookAlreadyException;
import java.util.List;

public interface AdminServices {

    /**
     * Register new admin Account if required.
     * @param a
     */
    public void registerAdmin(Admin a);
    
    public Admin loginAdmin(String username, String password);
    
    /* ---- operations related to books --*/
    /**
     * This method will return List obj BookDetailsWithBookNumbers 
     * @return 
     */
    public List<BooksDetailsWithBookNumbers> findBookDetailsWithBookNumbers();
    
    /**
     * Checking the book number which is entered is already taken or not
     * @param bookNumbers
     * @return 
     */
    public List<BookNumbers> isBookNumbersExists(String[] bookNumbers);
    /**
     * inserting book details only into 'books' table
     * After inserting the book details it 'Id' will be get and then All 'bookNumbers' will be inserted into 'bookNumbers' table
     * @param b
     * @return 
     */
    public Integer insertBooksExceptBookNumbers(Book b);
    /**
     * Inserting book numbers in bookNumbers table
     * @param bookNumbers
     * @param adminId
     * @param bookId 
     */
    public void insertBookNumbers(String[]bookNumbers,Integer adminId,Integer bookId);
    
    /*-- book details with count of total issued books --*/
    public List<BookDetailsWithCountIssuedBooks> bookDetailsWithCountIssuedBooks();
    /**
     * This method will return list of BookNumbers with book details 
     * @param bookId
     * @return 
     */
    public List<SingleBookDetailsWithBookNumbers> singleBookDetailsWithBookNumbers(Integer bookId);
    /**
     * finding a single book details by book number 
     * @param bookId
     * @param bookNumber
     * @return 
     */
    public SingleBookDetailsWithBookNumbers singleBookDetails(Integer bookId,Integer bookNumber);
    /**
     * finding all the students where student's status=3 i.e. status is pending (not verified)
     * @return 
     */
    public List<Student> findAllPendingStudents();
    /**
     * verifying students accounts by studentId and status ==> status=3 ==> pending, status=1 ==> not verified 
     * status=2 ==> verified
     * @param studentId
     * @param status 
     */
    public void verifyStudent(Integer studentId,Integer status);
    /**
     * finding student by admission no or Hall Ticket no  ==> adNo=HtNo=searchText
     * @param searchText 
     * @return  
     */
    public Student findStudent(String searchText);
    
    /**
     *
     * @param ib
     * @param status
     * @throws StudentHaveThisBookAlreadyException
     */
    public void issueBook(IssueBooks ib,Integer status) throws StudentHaveThisBookAlreadyException;
    /**
     * A student can issue Maximum 5-books. If he has issued 5-books then he will not be able to issue more books.
     * To issue any books he must have to return some books first
     * @param studentId
     * @param status
     * @return 
     */
    public Integer countTotalIssuedBookByStudent(Integer studentId,Integer status); 
    
    /**
     * status--> ISSUED=1; RETURNED=2;
     * @param bookNumber
     * @param status
     * @return 
     */
    public IssueBooks findBookByBookNumber(String bookNumber, Integer status); 
    
    /**
     *This method will return count of pending students
     * @return
     */
    public Integer getCountPendingStudents();
}
