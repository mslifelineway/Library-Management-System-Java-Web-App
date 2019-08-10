package com.cits.lms.rm;
 
import com.cits.lms.domain.IssueBooks;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

public class IssuedBooksRowMapper implements RowMapper<IssueBooks> {

    @Override
    public IssueBooks mapRow(ResultSet rs, int i) throws SQLException {
        IssueBooks ib = new IssueBooks();
        ib.setBookId(rs.getInt("book_id"));
        ib.setAdminId(rs.getInt("admin_id"));
        ib.setBookNumber(rs.getString("book_number"));
        ib.setStudentId(rs.getInt("student_id"));
        ib.setIssuedId(rs.getInt("issued_id"));
        ib.setStatus(rs.getInt("status"));
        ib.setIssuedDate(rs.getString("issued_date"));
        ib.setReturnedDate(rs.getString("returned_date"));
        return ib;
    }

}
