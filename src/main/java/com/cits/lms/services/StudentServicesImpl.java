package com.cits.lms.services;

import com.cits.lms.DAO.BaseDao;
import com.cits.lms.DAO.StudentDAO;
import com.cits.lms.domain.Student;
import com.cits.lms.dto.StudentLibrary;
import com.cits.lms.exceptions.StudentNotVerifiedException;
import com.cits.lms.rm.StudentLibraryRowMapper;
import com.cits.lms.rm.StudentRowMapper;
import com.cits.lms.utils.ConstantsRequired;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

@Service
public class StudentServicesImpl extends BaseDao implements StudentServices {

    @Autowired
    private StudentDAO studentDAO;

    @Override
    public void registerStudent(Student s) {
        studentDAO.insertStudent(s);
    }

    @Override
    public Student loginStudent(String admissionNo, String password) {
        String sql = "SELECT * FROM students WHERE admission_no=:adm_no AND password=:pass";
        Map m = new HashMap();
        m.put("adm_no", admissionNo);
        m.put("pass", password);
        try {
            Student student = getNamedParameterJdbcTemplate().queryForObject(sql, m, new StudentRowMapper());
            return student;
        } catch (EmptyResultDataAccessException emptyResultDataAccessException) {
            return null;
        }
    }

    @Override
    public Student isStudentExists(Student s) throws StudentNotVerifiedException {
        String sql = "SELECT * FROM students WHERE admission_no=:adm_no";
        Map m = new HashMap();
        m.put("adm_no", s.getAdmissionNo());
        try {
            Student student = getNamedParameterJdbcTemplate().queryForObject(sql, m, new StudentRowMapper());
            if (student.getStatus() == ConstantsRequired.NOT_VERIFIED) {
                //System.out.println("Your Account has not verified yet. please visit to Admin.");
                throw new StudentNotVerifiedException("Your account has not verified yet. please visit to Admin.");
            } else {
                return student;
            }
        } catch (EmptyResultDataAccessException emptyResultDataAccessException) {
            return null; /// it means account not registered on this admission no
        }
    }

    @Override
    public Student getStudent(Integer studentId) {

        Student st = studentDAO.findStudentById(studentId);
        return st;
    }

    @Override
    public void updateStudentProfile(Student st) {
        studentDAO.completeStudentProfile(st);
    }

    @Override
    public List<StudentLibrary> getStudentLibrary(Integer studentId) {
        String sql =  "SELECT issue_book.*,book_numbers.*,books.* FROM issue_book LEFT JOIN book_numbers ON issue_book.book_number=book_numbers.book_number"
                + " LEFT JOIN books ON issue_book.book_id = books.book_id WHERE issue_book.student_id = :s_id";
                
                String sql1 = "SELECT books.*,book_numbers.*,issue_book.*,students.* FROM books LEFT JOIN book_numbers ON"
                + " books.book_id=book_numbers.book_id"
                + " LEFT JOIN issue_book ON book_numbers.book_number=issue_book.book_number"
                + " LEFT JOIN students ON issue_book.student_id=students.s_id AND issue_book.status=1  WHERE books.book_id=:b_id";
         Map m = new HashMap();
        m.put("s_id", studentId);
        
//         String sql = "SELECT * FROM  books INNER JOIN book_numbers ON books.book_id=book_numbers.book_id";
        //String sql = "SELECT * FROM books INNER JOIN book_numbers ON books.book_id=book_numbers.book_id WHERE books.book_id=3";
        try {
            List<StudentLibrary> sl = getNamedParameterJdbcTemplate().query(sql,m, new StudentLibraryRowMapper());
            return sl;
        } catch (EmptyResultDataAccessException emptyResultDataAccessException) {
            return null;
        }
    }

    @Override
    public boolean updateProfileImage(String uploaded_image_name, Integer studentId) {
        boolean result = false;
        String sql = "UPDATE students SET profile_image=:image WHERE s_id=:studentId";
        Map m = new HashMap();
        m.put("image", uploaded_image_name);
        m.put("studentId", studentId);
        int update = getNamedParameterJdbcTemplate().update(sql, m);
        if(update > 0){
            result = true;
        }
        return result;
    }
}
