
package com.cits.lms.rm;

import com.cits.lms.domain.Book;
import com.cits.lms.domain.BookNumbers;
import com.cits.lms.domain.BooksDetailsWithBookNumbers;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author janeman
 */
public class BooksDetailsWithBookNumbersRowMapper implements RowMapper<BooksDetailsWithBookNumbers>{

    @Override
    public BooksDetailsWithBookNumbers mapRow(ResultSet rs, int i) throws SQLException {
        BooksDetailsWithBookNumbers obj = new BooksDetailsWithBookNumbers();
        Book book = new Book();
        BookNumbers bn = new BookNumbers();
                
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
        obj.setBook(book);
        obj.setBookNumbers(bn);
        return obj;
    }
    
}
