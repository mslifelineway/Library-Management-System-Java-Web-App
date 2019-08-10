/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cits.lms.DAO;

import com.cits.lms.domain.Student;
import java.util.List;


/**
 *
 * @author janeman
 */
public interface StudentDAO {
    
    public void insertStudent(Student s);
    public void updateStudent(Student s);
    public void completeStudentProfile(Student s);
    public void deleteStudent(Student s);
    public void deleteStudent(Integer studentId);
    public Student findStudentById(Integer studentId);

    /**
     *
     * @return
     */
    public List<Student> findAllStudent();
    /**
     * finding list of student by property (or) attribute name and
     * property (or) attribute value
     * @param propName
     * @param propValue
     * @return 
     */
    public List<Student> findStudentByProperty(String propName, String propValue);
}
