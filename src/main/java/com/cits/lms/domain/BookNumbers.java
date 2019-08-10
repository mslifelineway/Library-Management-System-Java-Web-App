
package com.cits.lms.domain;

public class BookNumbers {
    
    private Integer bookNumberId;
    private Integer bookId;
    private Integer adminId;
    private String bookNumber;

    public BookNumbers() {
    }

    public Integer getBookNumberId() {
        return bookNumberId;
    }

    public void setBookNumberId(Integer bookNumberId) {
        this.bookNumberId = bookNumberId;
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
    
    
    
    
}
