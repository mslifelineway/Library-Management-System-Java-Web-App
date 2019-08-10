package com.cits.lms.services;

import com.cits.lms.DAO.AdminDao;
import com.cits.lms.DAO.BaseDao;
import com.cits.lms.DAO.BookDao;
import com.cits.lms.domain.Admin;
import com.cits.lms.domain.Book;
import com.cits.lms.domain.BookDetailsWithCountIssuedBooks;
import com.cits.lms.domain.BookNumbers;
import com.cits.lms.domain.BooksDetailsWithBookNumbers;
import com.cits.lms.domain.IssueBooks;
import com.cits.lms.domain.SingleBookDetailsWithBookNumbers;
import com.cits.lms.domain.Student;
import com.cits.lms.exceptions.StudentHaveThisBookAlreadyException;
import com.cits.lms.rm.AdminRowMapper;
import com.cits.lms.rm.BookDetailsWithCountIssuedBooksRowMapper;
import com.cits.lms.rm.BookNumbersRowMapper;
import com.cits.lms.rm.BooksDetailsWithBookNumbersRowMapper;
import com.cits.lms.rm.IssuedBooksRowMapper;
import com.cits.lms.rm.SingleBookDetailsWithBookNumbersRowMapper;
import com.cits.lms.rm.StudentRowMapper;
import com.cits.lms.utils.ConstantsRequired;
import com.cits.lms.utils.LmsHelperClass;
import com.cits.lms.utils.StringUtil;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

@Service
public class AdminServicesImpl extends BaseDao implements AdminServices {

    @Autowired
    private AdminDao adminDao;
    @Autowired
    private BookDao bookDao;

    @Override
    public void registerAdmin(Admin a) {
        adminDao.insertAdmin(a);
    }

    /**
     * If Admin exists the return object of Admin or admin else it will return
     * null
     *
     * @param username
     * @param password
     * @return
     */
    @Override
    public Admin loginAdmin(String username, String password) {
        String login = "SELECT * FROM admin WHERE username=:username AND password=:pass";
        Map m = new HashMap();
        m.put("username", username);
        m.put("pass", password);
        try {
            Admin admin = getNamedParameterJdbcTemplate().queryForObject(login, m, new AdminRowMapper());
            return admin;
        } catch (EmptyResultDataAccessException emptyResultDataAccessException) {
            return null;
        }
    }

    @Override
    public List<BooksDetailsWithBookNumbers> findBookDetailsWithBookNumbers() {

        String sql = "SELECT * FROM books INNER JOIN book_numbers ON books.book_id=book_numbers.book_id";
        //String sql = "SELECT * FROM books INNER JOIN book_numbers ON books.book_id=book_numbers.book_id WHERE books.book_id=3";
        try {
            List<BooksDetailsWithBookNumbers> bn = getJdbcTemplate().query(sql, new BooksDetailsWithBookNumbersRowMapper());
            return bn;
        } catch (EmptyResultDataAccessException emptyResultDataAccessException) {
            return null;
        }
    }

    @Override
    public List<BookNumbers> isBookNumbersExists(String[] bookNumbers) {
        String numbers = StringUtil.toCommaSeperatedString(bookNumbers);
        String sql = "SELECT * FROM book_numbers WHERE book_number IN (" + numbers + ")";
        try {
            List<BookNumbers> bn = getJdbcTemplate().query(sql, new BookNumbersRowMapper());
            return bn;
        } catch (EmptyResultDataAccessException dataAccessException) {
            return null;
        }
    }

    @Override
    public Integer insertBooksExceptBookNumbers(Book b) {
        Integer bookId = bookDao.addBook(b);
        return bookId;
    }

    @Override
    public void insertBookNumbers(String[] bookNumbers, Integer adminId, Integer bookId) {
        for (String bnum : bookNumbers) {
            if (!bnum.equals("")) {
                String sql = "INSERT INTO book_numbers (book_id, admin_id,book_number) VALUES (:b_id,:a_id,:b_no)";
                Map m = new HashMap();
                m.put("b_id", bookId);
                m.put("a_id", adminId);
                m.put("b_no", bnum);
                getNamedParameterJdbcTemplate().update(sql, m);
            }

        }
    }

    @Override
    public List<BookDetailsWithCountIssuedBooks> bookDetailsWithCountIssuedBooks() {
        //=-- STATUS ==> ISSUED=1; RETURNED=2;
        String s = "SELECT books.*, COUNT(issued_id) AS issued_count FROM books LEFT JOIN issue_book ON books.book_id = issue_book.book_id AND issue_book.status=1 GROUP BY books.book_id";
        try {
            List<BookDetailsWithCountIssuedBooks> bi = getNamedParameterJdbcTemplate().query(s, new BookDetailsWithCountIssuedBooksRowMapper());
            return bi;
        } catch (EmptyResultDataAccessException emptyResultDataAccessException) {
            return null;
        }
    }

    @Override
    public List<SingleBookDetailsWithBookNumbers> singleBookDetailsWithBookNumbers(Integer bookId) {

        String sql = "SELECT books.*,book_numbers.*,issue_book.*,students.* FROM books LEFT JOIN book_numbers ON"
                + " books.book_id=book_numbers.book_id"
                + " LEFT JOIN issue_book ON book_numbers.book_number=issue_book.book_number"
                + " LEFT JOIN students ON issue_book.student_id=students.s_id AND issue_book.status=1  WHERE books.book_id=:b_id";
        Map m = new HashMap();
        m.put("b_id", bookId);
        try {
            List<SingleBookDetailsWithBookNumbers> sb = getNamedParameterJdbcTemplate().query(sql, m, new SingleBookDetailsWithBookNumbersRowMapper());
            return sb;
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    @Override
    public SingleBookDetailsWithBookNumbers singleBookDetails(Integer bookId, Integer bookNumber) {
        String sql = "SELECT books.*,book_numbers.*,issue_book.*,students.* FROM books LEFT JOIN book_numbers ON"
                + " books.book_id=book_numbers.book_id"
                + " LEFT JOIN issue_book ON book_numbers.book_number=issue_book.book_number AND issue_book.status=1" 
                + " LEFT JOIN students ON issue_book.student_id=students.s_id  WHERE books.book_id=:b_id AND book_numbers.book_number=:book_no";
        Map m = new HashMap();
        m.put("b_id", bookId);
        m.put("book_no", bookNumber);
        try {
            SingleBookDetailsWithBookNumbers sb = getNamedParameterJdbcTemplate().queryForObject(sql, m, new SingleBookDetailsWithBookNumbersRowMapper());
            return sb;
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    @Override
    public List<Student> findAllPendingStudents() {
        String sql = "SELECT * FROM students WHERE status=?";
        try {
            return getJdbcTemplate().query(sql, new StudentRowMapper(), ConstantsRequired.PENDING);//--- PENDING=3;

        } catch (EmptyResultDataAccessException emptyResultDataAccessException) {
            return null;
        }
    }

    @Override
    public void verifyStudent(Integer studentId, Integer status) {
        String sql = "UPDATE students SET status=:status WHERE s_id=:sid";
        Map m = new HashMap();
        m.put("status", status);
        m.put("sid", studentId);
        getNamedParameterJdbcTemplate().update(sql, m);
    }

    @Override
    public void issueBook(IssueBooks ib, Integer status) throws StudentHaveThisBookAlreadyException {
        //---- checking this book is already taken by the current student 
        String check = "SELECT * FROM issue_book WHERE student_id=:s_id AND book_id=:b_id AND status=:st ORDER BY issued_id ASC LIMIT 1";
        Map mp = new HashMap();
        mp.put("s_id", ib.getStudentId());
        mp.put("b_id", ib.getBookId());
        mp.put("st", status);
        try {
            IssueBooks isb = getNamedParameterJdbcTemplate().queryForObject(check, mp, new IssuedBooksRowMapper());
            if (isb != null) {
                throw new StudentHaveThisBookAlreadyException("This book has been issued with this student.");
            }

        } catch (EmptyResultDataAccessException dataAccessException) {
            String sql = "INSERT INTO issue_book (book_id,admin_id,book_number,student_id,status,issued_date,returned_date) VALUES (:b_id,:a_id, :b_no, :s_id, :status,:idate,:rdate)";
            Map m = new HashMap();
            m.put("b_id", ib.getBookId());
            m.put("a_id", ib.getAdminId());
            m.put("b_no", ib.getBookNumber());
            m.put("s_id", ib.getStudentId());
            m.put("idate", LmsHelperClass.getCurrentDateTime());
            m.put("rdate", "");
            m.put("status", ConstantsRequired.ISSUED);//---- ISSUED=1 ; AND RETURNED=2

            getNamedParameterJdbcTemplate().update(sql, m);
        }

    }

    @Override
    public Student findStudent(String searchText) {
        String sql = "SELECT * FROM students WHERE admission_no=:ad_no OR hall_ticket_no=:ht_no";
        Map m = new HashMap();
        m.put("ad_no", searchText);
        m.put("ht_no", searchText);
        try {
            Student st = getNamedParameterJdbcTemplate().queryForObject(sql, m, new StudentRowMapper());
            return st;
        } catch (EmptyResultDataAccessException emptyResultDataAccessException) {
            return null;
        }
    }

    @Override
    public Integer countTotalIssuedBookByStudent(Integer studentId, Integer status) {
        String sql = "SELECT COUNT(*) FROM issue_book WHERE student_id=? AND status=?";
        Integer count = getJdbcTemplate().queryForObject(sql, new Object[]{studentId, status}, Integer.class);
        return count;
    }

    @Override
    public IssueBooks findBookByBookNumber(String bookNumber, Integer status) {
        String sql = "SELECT * FROM issue_book WHERE book_number=:bno AND status=:st";
        Map m = new HashMap();
        m.put("bno", bookNumber);
        m.put("st", status);
        try {
            return getNamedParameterJdbcTemplate().queryForObject(sql, m, new IssuedBooksRowMapper());
        } catch (EmptyResultDataAccessException emptyResultDataAccessException) {
            return null;
        }
    }

    @Override
    public Integer getCountPendingStudents() {
        String sql = "SELECT COUNT(s_id) FROM students WHERE status=3";
        Integer count = getJdbcTemplate().queryForObject(sql, Integer.class);
        return count;
    }

}
