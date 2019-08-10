package com.cits.lms.rm;

import com.cits.lms.domain.Book;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

public class BookRowMapper implements RowMapper<Book> {

    @Override
    public Book mapRow(ResultSet rs, int i) throws SQLException {
        Book b = new Book();
        b.setBookId(rs.getInt("book_id"));
        b.setAdminId(rs.getInt("admin_id"));
        b.setBookName(rs.getString("book_name"));
        b.setAuthorName(rs.getString("author_name"));
        b.setEdition(rs.getInt("edition"));
        b.setDepartmentName(rs.getInt("department_name"));
        b.setBookUploadedDate(rs.getString("book_added_date"));
        b.setTotalBooks(rs.getInt("total_books"));
        return b;
    }

}
