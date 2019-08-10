package com.cits.lms.domain;

public class IssueBooks {

    private Integer issuedId;
    private Integer bookId;
    private Integer adminId;
    private String bookNumber;
    private Integer studentId;
    private String issuedDate;
    private String returnedDate;
    private Integer status; //======> ISSUED=1, RETURNED=2

    public Integer getIssuedId() {
        return issuedId;
    }

    public void setIssuedId(Integer issuedId) {
        this.issuedId = issuedId;
    }

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public String getBookNumber() {
        return bookNumber;
    }

    public void setBookNumber(String bookNumber) {
        this.bookNumber = bookNumber;
    }

    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    public String getIssuedDate() {
        return issuedDate;
    }

    public void setIssuedDate(String issuedDate) {
        this.issuedDate = issuedDate;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getReturnedDate() {
        return returnedDate;
    }

    public void setReturnedDate(String returnedDate) {
        this.returnedDate = returnedDate;
    }

}
