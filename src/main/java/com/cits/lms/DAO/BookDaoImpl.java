package com.cits.lms.DAO;

import com.cits.lms.domain.Book;
import com.cits.lms.domain.BookNumbers;
import com.cits.lms.rm.BookRowMapper;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

@Repository
public class BookDaoImpl extends BaseDao implements BookDao {

    @Override
    public Integer addBook(Book b) {
        String sql = "INSERT INTO books (admin_id, book_name, author_name, edition, department_name,total_books)"
                + " VALUES (:a_id, :b_name, :a_name, :edition, :dept_name,:total)";
        Map m = new HashMap();
        m.put("a_id", b.getAdminId());
        m.put("b_name", b.getBookName());
        m.put("a_name", b.getAuthorName());
        m.put("edition", b.getEdition());
        m.put("dept_name", b.getDepartmentName());
        m.put("total", b.getTotalBooks());
        KeyHolder kh = new GeneratedKeyHolder();
        SqlParameterSource ps = new MapSqlParameterSource(m);
        super.getNamedParameterJdbcTemplate().update(sql, ps, kh);
        try {
            Integer bookId = kh.getKey().intValue();
             System.out.println("---------------- book id ---- " + bookId + "----------");
             b.setBookId(bookId);
            return bookId;
        } catch (EmptyResultDataAccessException invalidDataAccessApiUsageException) {
            return null;
        }
    }

    @Override
    public void updateBookByBookNumber(BookNumbers bn) {
        String sql = "UPDATE book_numbers SET book_number=:b_no , admin_id=:a_id WHERE book_id=:b_id";
        Map m = new HashMap();
        m.put("b_no", bn.getBookNumber());
        m.put("a_id", bn.getAdminId());
        m.put("b_id", bn.getBookId());
        getNamedParameterJdbcTemplate().update(sql, m);
        System.out.println("-------------- record updated ----------");
    }

    @Override
    public void updateBook(Book b) {
        String sql = "UPDATE books SET admin_id=:a_id, book_name=:b_name, author_name=:a_name, "
                + "edition=:edition, department_name=:dept_name WHERE book_id=:b_id";
        Map m = new HashMap();
        m.put("a_id", b.getAdminId());
        m.put("b_name", b.getBookName());
        m.put("a_name", b.getAuthorName());
        m.put("edition", b.getEdition());
        m.put("dept_name", b.getDepartmentName());
        m.put("b_id", b.getBookId());

        getNamedParameterJdbcTemplate().update(sql, m);
        System.out.println("-------------- record updated ----------");

    }

    @Override
    public void deleteBook(Integer bookId) {

    }

    /**
     * finding all the books without book numbers that is operation with only
     * table 'books'
     *
     * @return
     */
    @Override
    public List<Book> findAllBooks() {
        String sql = "SELECT * FROM books";
        try {
            List<Book> books = getNamedParameterJdbcTemplate().query(sql, new BookRowMapper());
            return books;
        } catch (EmptyResultDataAccessException emptyResultDataAccessException) {
            return null;
        }

    }

    /**
     * This Operation is based on Joining Table
     *
     * @param bookId
     * @return
     */
    @Override
    public Book findBookByBookId(Integer bookId) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Book> findAllBooksByStudentId(Integer studentId) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Book> searchBook(String searchText) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Book> searchBook(String proName, String propValue) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
