
package com.cits.lms.rm;

import com.cits.lms.domain.Admin;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

public class AdminRowMapper implements RowMapper<Admin>{

    @Override
    public Admin mapRow(ResultSet rs, int i) throws SQLException {
        Admin a = new Admin();
        a.setAdminId(rs.getInt("admin_id"));
        a.setName(rs.getString("name"));
        a.setEmail(rs.getString("email"));
        a.setUsername(rs.getString("username"));
        a.setContactNo(rs.getString("contact_no"));
        a.setRegDate(rs.getString("reg_date"));
        a.setImage(rs.getString("image"));
        
        return a;
    }
    
}
