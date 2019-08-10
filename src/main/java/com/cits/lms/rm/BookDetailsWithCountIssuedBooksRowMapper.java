/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cits.lms.rm;

import com.cits.lms.domain.Book;
import com.cits.lms.domain.BookDetailsWithCountIssuedBooks;
import com.cits.lms.domain.BookNumbers;
import com.cits.lms.domain.IssueBooks;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author janeman
 */
public class BookDetailsWithCountIssuedBooksRowMapper implements RowMapper<BookDetailsWithCountIssuedBooks>{

    @Override
    public BookDetailsWithCountIssuedBooks mapRow(ResultSet rs, int i) throws SQLException {
        BookDetailsWithCountIssuedBooks bi = new BookDetailsWithCountIssuedBooks();
        Book book = new Book();
        IssueBooks ib = new IssueBooks();
        
        book.setAdminId(rs.getInt("admin_id"));
        book.setAuthorName(rs.getString("author_name"));
        book.setBookId(rs.getInt("book_id"));
        book.setBookUploadedDate(rs.getString("book_added_date"));
        book.setBookName(rs.getString("book_name"));
        book.setEdition(rs.getInt("edition"));
        book.setDepartmentName(rs.getInt("department_name"));
        book.setTotalBooks(rs.getInt("total_books"));
        
        bi.setBook(book);
        
//        ib.setIssuedId(rs.getInt("issued_id"));
//        ib.setBookId(rs.getInt("book_id"));
//        ib.setAdminId(rs.getInt("admin_id"));
//        ib.setBookNumber(rs.getString("book_number"));
//        ib.setStudentId(rs.getInt("student_id"));
//        ib.setIssuedDate(rs.getString("issued_date"));
        
       bi.setCountIssuedBook(rs.getInt("issued_count"));
        return bi;
    }

    
    
}
