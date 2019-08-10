
package com.cits.lms.commands;

public class AddBooksCommand {
    
    private String bookName;
    private String authorName;
    private String edition;
    private Integer deptName;
    private String[] bookNumbers;
    
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

    public String getEdition() {
        return edition;
    }

    public void setEdition(String edition) {
        this.edition = edition;
    }

    public Integer getDeptName() {
        return deptName;
    }

    public void setDeptName(Integer deptName) {
        this.deptName = deptName;
    }

    
    
    public String[] getBookNumbers() {
        return bookNumbers;
    }

    public void setBookNumbers(String[] bookNumbers) {
        this.bookNumbers = bookNumbers;
    }

     
}
