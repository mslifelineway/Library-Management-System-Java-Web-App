
package com.cits.lms.domain;


/**
 *
 * @author janeman
 */
public class BookDetailsWithCountIssuedBooks {
    
    private Book book;
    private IssueBooks issueBook;
    private Integer countIssuedBook;
    
    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public IssueBooks getIssueBook() {
        return issueBook;
    }

    public void setIssueBook(IssueBooks issueBook) {
        this.issueBook = issueBook;
    }

    public Integer getCountIssuedBook() {
        return countIssuedBook;
    }

    public void setCountIssuedBook(Integer countIssuedBook) {
        this.countIssuedBook = countIssuedBook;
    }
    
    
}
