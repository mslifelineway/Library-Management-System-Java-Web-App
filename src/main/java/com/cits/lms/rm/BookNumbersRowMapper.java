
package com.cits.lms.rm;

import com.cits.lms.domain.BookNumbers;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

public class BookNumbersRowMapper implements RowMapper<BookNumbers>{

    @Override
    public BookNumbers mapRow(ResultSet rs, int i) throws SQLException {
        BookNumbers bn = new BookNumbers();
        bn.setAdminId(rs.getInt("admin_id"));
        bn.setBookNumberId(rs.getInt("book_number_id"));
        bn.setBookId(rs.getInt("book_id"));
        bn.setBookNumber(rs.getString("book_number"));
        return bn;
    }
    
}
