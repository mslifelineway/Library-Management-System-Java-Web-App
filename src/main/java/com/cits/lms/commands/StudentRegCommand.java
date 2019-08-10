package com.cits.lms.commands;

import com.cits.lms.domain.Student;

public class StudentRegCommand {

    private Student student;
    
    // Adding some more fields or customized fileds studentBirthDate = birth_date/birth_month/birth_year
    private Integer birth_date;
    private String birth_month;
    private Integer birth_year;

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }
    
    public Integer getBirth_date() {
        return birth_date;
    }

    public void setBirth_date(Integer birth_date) {
        this.birth_date = birth_date;
    }

    public String getBirth_month() {
        return birth_month;
    }

    public void setBirth_month(String birth_month) {
        this.birth_month = birth_month;
    }

    public Integer getBirth_year() {
        return birth_year;
    }

    public void setBirth_year(Integer birth_year) {
        this.birth_year = birth_year;
    }

}
