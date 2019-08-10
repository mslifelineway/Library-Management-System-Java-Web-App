
package com.cits.lms.domain;
/**
 *
 * @author janeman
 */
public class BooksDetailsWithBookNumbers {
    private Book book;
    private BookNumbers bookNumbers;
    
    public BooksDetailsWithBookNumbers(){
        
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
    
    
}
