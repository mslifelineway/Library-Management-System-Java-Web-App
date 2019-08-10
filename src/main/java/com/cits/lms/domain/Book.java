package com.cits.lms.domain;

public class Book {

    private Integer bookId;
    private Integer adminId;
    private String bookName;
    private String authorName;
    private Integer edition;
    private Integer totalBooks;
    /**
     * DepartmentName --> course : CSE_COURSE = 1; ECE_COURSE = 2; EEE_COURSE =
     * 3; CE_COURSE = 4; ME_COURSE = 5;
     */
    private Integer departmentName;
    private String bookUploadedDate;

    public Book() {
    }

    public Integer getBookId() {
        return bookId;
    }

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public Integer getEdition() {
        return edition;
    }

    public void setEdition(Integer edition) {
        this.edition = edition;
    }

    public Integer getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(Integer departmentName) {
        this.departmentName = departmentName;
    }

    public Integer getTotalBooks() {
        return totalBooks;
    }

    public void setTotalBooks(Integer totalBooks) {
        this.totalBooks = totalBooks;
    }

    public String getBookUploadedDate() {
        return bookUploadedDate;
    }

    public void setBookUploadedDate(String bookUploadedDate) {
        this.bookUploadedDate = bookUploadedDate;
    }

}
