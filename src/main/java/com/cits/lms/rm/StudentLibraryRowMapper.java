
package com.cits.lms.rm;

import com.cits.lms.domain.Book;
import com.cits.lms.domain.BookNumbers;
import com.cits.lms.domain.BooksDetailsWithBookNumbers;
import com.cits.lms.domain.IssueBooks;
import com.cits.lms.dto.StudentLibrary;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author janeman
 */
public class StudentLibraryRowMapper implements RowMapper<StudentLibrary>{

    @Override
    public StudentLibrary mapRow(ResultSet rs, int i) throws SQLException {
        StudentLibrary obj = new StudentLibrary();
        Book book = new Book();
        BookNumbers bn = new BookNumbers();
        IssueBooks ib = new IssueBooks();
        
        book.setAdminId(rs.getInt("admin_id"));
        book.setAuthorName(rs.getString("author_name"));
        book.setBookId(rs.getInt("book_id"));
        book.setBookUploadedDate(rs.getString("book_added_date"));
        book.setBookName(rs.getString("book_name"));
        book.setEdition(rs.getInt("edition"));
        book.setDepartmentName(rs.getInt("department_name"));
        book.setTotalBooks(rs.getInt("total_books"));
        
        bn.setAdminId(rs.getInt("admin_id"));
        bn.setBookNumber(rs.getString("book_number"));
        bn.setBookId(rs.getInt("book_id"));
        bn.setBookNumberId(rs.getInt("book_number_id"));
        
        ib.setIssuedDate(rs.getString("issued_date"));
        ib.setStatus(rs.getInt("status"));
        ib.setReturnedDate(rs.getString("returned_date"));
        
        obj.setBook(book);
        obj.setBookNumbers(bn);
        obj.setIssueBooks(ib);
        return obj;
    }
    
}
