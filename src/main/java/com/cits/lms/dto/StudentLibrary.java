
package com.cits.lms.dto;

import com.cits.lms.domain.*;

/**
 *
 * @author janeman
 */
public class StudentLibrary {
    private Book book;
    private BookNumbers bookNumbers;
    private IssueBooks issueBooks;
    
    public StudentLibrary(){
        
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public BookNumbers getBookNumbers() {
        return bookNumbers;
    }

    public void setBookNumbers(BookNumbers bookNumbers) {
        this.bookNumbers = bookNumbers;
    }

    public IssueBooks getIssueBooks() {
        return issueBooks;
    }

    public void setIssueBooks(IssueBooks issueBooks) {
        this.issueBooks = issueBooks;
    }
    
    
}
