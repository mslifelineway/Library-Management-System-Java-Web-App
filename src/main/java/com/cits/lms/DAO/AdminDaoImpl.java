package com.cits.lms.DAO;

import com.cits.lms.domain.Admin;
import com.cits.lms.rm.AdminRowMapper;
import java.util.HashMap;
import java.util.Map;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDaoImpl extends BaseDao implements AdminDao {

    @Override
    public void insertAdmin(Admin a) {
        String sql = "INSERT INTO admin (name, email, password, username, contact_no, image)"
                + " VALUES (:name, :email, :pass, :username, :contact, :image)";
        Map m = new HashMap();
        m.put("name", a.getName());
        m.put("email", a.getEmail());
        m.put("pass", a.getPassword());
        m.put("username", a.getUsername());
        m.put("contact", a.getContactNo());
        m.put("image", a.getImage());

        KeyHolder kh = new GeneratedKeyHolder();
        SqlParameterSource ps = new MapSqlParameterSource(m);
        super.getNamedParameterJdbcTemplate().update(sql, ps, kh);
        Integer adminId = kh.getKey().intValue();
        a.setAdminId(adminId);
    }

    @Override
    public void updateAdmin(Admin a) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void deleteAdmin(Admin a) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void deleteAdmin(Integer adminId) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Admin isAdminExists(String username) {
        String sql = "SELECT * FROM admin WHERE username=:user_name";
        Map m = new HashMap();
        m.put("user_name", username);
        Admin a = getNamedParameterJdbcTemplate().queryForObject(sql, m, new AdminRowMapper());
        return a;
    }

}
