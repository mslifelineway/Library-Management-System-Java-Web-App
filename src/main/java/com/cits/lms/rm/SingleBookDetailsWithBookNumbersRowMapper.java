/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cits.lms.rm;

import com.cits.lms.domain.Book;
import com.cits.lms.domain.BookNumbers;
import com.cits.lms.domain.IssueBooks;
import com.cits.lms.domain.SingleBookDetailsWithBookNumbers;
import com.cits.lms.domain.Student;
import com.cits.lms.utils.LmsHelperClass;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author janeman
 */
public class SingleBookDetailsWithBookNumbersRowMapper implements RowMapper<SingleBookDetailsWithBookNumbers>{

    @Override
    public SingleBookDetailsWithBookNumbers mapRow(ResultSet rs, int i) throws SQLException {
        SingleBookDetailsWithBookNumbers sb = new SingleBookDetailsWithBookNumbers();
        Book b = new Book();
        BookNumbers bn = new BookNumbers();
        IssueBooks ib = new IssueBooks();
        Student st = new Student();
        
        b.setBookId(rs.getInt("book_id"));
        b.setBookName(rs.getString("book_name"));
        b.setAuthorName(rs.getString("author_name"));
        b.setDepartmentName(rs.getInt("department_name"));
        b.setEdition(rs.getInt("edition"));
        b.setBookUploadedDate(LmsHelperClass.timestampAsString(rs.getTimestamp("book_added_date")));
        b.setTotalBooks(rs.getInt("total_books"));
        b.setAdminId(rs.getInt("admin_id"));
        
        bn.setBookNumberId(rs.getInt("book_number_id"));
        bn.setBookNumber(rs.getString("book_number"));
//        bn.setBookId(rs.getInt("book_id"));
//        bn.setAdminId(rs.getInt("admin_id"));
        
        ib.setIssuedId(rs.getInt("issued_id"));
//        ib.setBookId(rs.getInt("book_id"));
        ib.setAdminId(rs.getInt("admin_id"));//--- Id of the admin who issue the book to the student 
//        ib.setBookNumber(rs.getString("book_number"));
//        ib.setStudentId(rs.getInt("student_id"));
        ib.setIssuedDate(rs.getString("issued_date"));
        
        st.setStudentId(rs.getInt("s_id"));
        st.setStudentName(rs.getString("name"));
        st.setAdmissionNo(rs.getString("admission_no"));
        st.setHallTicketNo(rs.getString("hall_ticket_no"));
        st.setProfileImage(rs.getString("profile_image"));
        
        sb.setBook(b);
        sb.setBookNumbers(bn);
        sb.setIssueBooks(ib);
        sb.setStudent(st);
        return sb;

    }
    
}
