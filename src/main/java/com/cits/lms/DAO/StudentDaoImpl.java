package com.cits.lms.DAO;

import com.cits.lms.domain.Student;
import com.cits.lms.rm.StudentRowMapper;
import com.cits.lms.utils.ConstantsRequired;
import com.cits.lms.utils.LmsHelperClass;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

@Repository
public class StudentDaoImpl extends BaseDao implements StudentDAO {

    @Override
    public void insertStudent(Student s) {
        String sql = "INSERT INTO students "
                + "(name,admission_no,hall_ticket_no,course,year,sem,contact_no,password,var_code,status,profile_image,birth_date)"
                + " VALUES (:name, :adm_no, :ht_no, :course, :year, :sem, :c_no, :pass, :v_code, :status, :image, :bday)";
        Map m = new HashMap();
        m.put("name", s.getStudentName());
        m.put("adm_no", s.getAdmissionNo());
        m.put("ht_no", s.getHallTicketNo());
        m.put("course", s.getCourse());
        m.put("year", s.getYear());
        m.put("sem", s.getSem());
        m.put("c_no", s.getContactNo());
        m.put("pass", s.getPassword());
        m.put("v_code", s.getVarCode());
        m.put("status", s.getStatus());
        m.put("image", s.getProfileImage());
        m.put("bday", s.getBirthDate());

        KeyHolder kh = new GeneratedKeyHolder();
        SqlParameterSource ps = new MapSqlParameterSource(m);
        super.getNamedParameterJdbcTemplate().update(sql, ps, kh);
        Integer studentId = kh.getKey().intValue();
        s.setStudentId(studentId);
    }

    @Override
    public void updateStudent(Student s) {
        String sql = "UPDATE students SET name=:name , admission_no=:adm_no , hall_ticket_no=:ht_no , course=:course , year=:year ,"
                + " sem=:sem , contact_no=:c_no , var_code=:v_code, status=:status, profile_image=:image,"
                + " birth_date=:bday WHERE s_id=:studentId";
        Map m = new HashMap();
        m.put("name", s.getStudentName());
        m.put("adm_no", s.getAdmissionNo());
        m.put("ht_no", s.getHallTicketNo());
        m.put("course", s.getCourse());
        m.put("year", s.getYear());
        m.put("sem", s.getSem());
        m.put("c_no", s.getContactNo());
        m.put("v_code", s.getVarCode());
        m.put("status", s.getStatus());
        m.put("image", s.getProfileImage());
        m.put("bday", s.getBirthDate());
        m.put("studentId", s.getStudentId());

        getNamedParameterJdbcTemplate().update(sql, m);
        System.out.println("-------- student data updated ----------");

    }

    @Override
    public void deleteStudent(Student s) {
        this.deleteStudent(s.getStudentId());
    }

    @Override
    public void deleteStudent(Integer studentId) {
        String sql = "DELETE FROM students WHERE s_id=?";
        getJdbcTemplate().update(sql, studentId);

    }

    @Override
    public Student findStudentById(Integer studentId) {
        String sql = "SELECT * FROM students WHERE s_id=?";
        try {
            Student student = getJdbcTemplate().queryForObject(sql, new StudentRowMapper(), studentId);
            return student;
        } catch (EmptyResultDataAccessException dataAccessException) {
            return null;
        }
    }

    @Override
    public List<Student> findAllStudent() {
        String sql = "SELECT * FROM students";
        return getJdbcTemplate().query(sql, new StudentRowMapper());
    }

    @Override
    public List<Student> findStudentByProperty(String propName, String propValue) {
        String sql = "SELECT * FROM students WHERE " + propName + "=?";
        return getJdbcTemplate().query(sql, new StudentRowMapper());
    }

    @Override
    public void completeStudentProfile(Student s) {
        String sql = "UPDATE students SET name=:name, admission_no=:ad_no, hall_ticket_no=:ht_no , course=:course , year=:year ,"
                + " sem=:sem , status=:status, contact_no=:cno, birth_date=:bday WHERE s_id=:studentId";
        Map m = new HashMap();
        m.put("name", s.getStudentName());
        m.put("ad_no", s.getAdmissionNo());
        m.put("ht_no", s.getHallTicketNo());
        m.put("course", s.getCourse());
        m.put("year", s.getYear());
        m.put("sem", s.getSem());
        m.put("status", ConstantsRequired.PENDING);
        m.put("cno", s.getContactNo());
        m.put("studentId", s.getStudentId());
        m.put("bday", s.getBirthDate());
        getNamedParameterJdbcTemplate().update(sql, m);
    }

}
