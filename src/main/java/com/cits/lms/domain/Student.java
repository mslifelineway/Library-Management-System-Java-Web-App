/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cits.lms.domain;

/**
 *
 * @author janeman
 */
public class Student {

    private Integer studentId;
    private String studentName;
    private String admissionNo;
    private String hallTicketNo;
    /**
     * COURSES : CSE_COURSE = 1; ECE_COURSE = 2; EEE_COURSE = 3; CE_COURSE = 4; ME_COURSE = 5;
     */
    private Integer course;
    /**
     * Year : FIRST_YEAR = 1; SECOND_YEAR = 2; THIRD_YEAR = 3; FOURTH_YEAR = 4;
     */
    private Integer year;
    /**
     * Semester :  FIRST_SEM = 1; SECOND_SEM = 2;
     */
    private Integer sem;
    private String contactNo;
    private String password;
    private String profileImage;
    private String birthDate;
    private String regDate;
    /** 
     * VAR_CODE : it is a random key
     */
    private Integer varCode;
    /**
     * status means student is verified or not
     *Values : VERIFIED = 2 ; NOT_VERIFIED = 1;
     */
    private Integer status;
    
     public Student() {
    }
     
    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getAdmissionNo() {
        return admissionNo;
    }

    public void setAdmissionNo(String admissionNo) {
        this.admissionNo = admissionNo;
    }

    public String getHallTicketNo() {
        return hallTicketNo;
    }

    public void setHallTicketNo(String hallTicketNo) {
        this.hallTicketNo = hallTicketNo;
    }

    public Integer getCourse() {
        return course;
    }

    public void setCourse(Integer course) {
        this.course = course;
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    public Integer getSem() {
        return sem;
    }

    public void setSem(Integer sem) {
        this.sem = sem;
    }

    public String getContactNo() {
        return contactNo;
    }

    public void setContactNo(String contactNo) {
        this.contactNo = contactNo;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getProfileImage() {
        return profileImage;
    }

    public void setProfileImage(String profileImage) {
        this.profileImage = profileImage;
    }

    public String getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }

    public String getRegDate() {
        return regDate;
    }

    public void setRegDate(String regDate) {
        this.regDate = regDate;
    }

    public Integer getVarCode() {
        return varCode;
    }

    public void setVarCode(Integer varCode) {
        this.varCode = varCode;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

}
