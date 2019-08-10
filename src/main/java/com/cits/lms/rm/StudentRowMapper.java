
package com.cits.lms.rm;

import com.cits.lms.domain.Student;
import com.cits.lms.utils.ConstantsRequired;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

public class StudentRowMapper implements RowMapper<Student>{

    @Override
    public Student mapRow(ResultSet rs, int i) throws SQLException {
        Student s = new Student();
        s.setStudentId(rs.getInt("s_id"));
        s.setStudentName(rs.getString("name"));
        s.setAdmissionNo(rs.getString("admission_no"));
        s.setHallTicketNo(rs.getString("hall_ticket_no"));
        s.setCourse(rs.getInt("course"));
        s.setYear(rs.getInt("year"));
        s.setSem(rs.getInt("sem"));
        s.setContactNo(rs.getString("contact_no"));
        s.setProfileImage(rs.getString("profile_image"));
        s.setBirthDate(rs.getString("birth_date"));
        s.setRegDate(rs.getString("reg_date"));
        s.setStatus(rs.getInt("status"));
        return s;
    }
    
    
}
