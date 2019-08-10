package com.cits.lms.DAO;

import com.cits.lms.domain.Book;
import com.cits.lms.domain.BookNumbers;
import java.util.List;

/**
 *
 * @author janeman
 */
public interface BookDao {

    /**
     * After inserting or adding book it will return bookId
     * @param b
     * @return 
     */
    public Integer addBook(Book b);

    /**
     * updating bookNumber only by admin --> table to update : book_numbers Data
     * required : BookNumbers
     *
     * @param bookNumber
     */
    public void updateBookByBookNumber(BookNumbers bookNumber);

    /**
     * updating book details except bookNumber --> table to update : books
     *
     * @param b
     */
    public void updateBook(Book b);

    public void deleteBook(Integer bookId);

    public List<Book> findAllBooks();

    public Book findBookByBookId(Integer bookId);

    public List<Book> findAllBooksByStudentId(Integer studentId);

    /**
     * searching books by a freeText or a single text vlaue
     *
     * @param searchText
     * @return
     */
    public List<Book> searchBook(String searchText);

    /**
     * Searching Books by Two attributes that is propName and propValue
     *
     * @param proName
     * @param propValue
     * @return
     */
    public List<Book> searchBook(String proName, String propValue);
}
