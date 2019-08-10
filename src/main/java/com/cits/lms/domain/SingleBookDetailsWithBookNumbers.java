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
public class SingleBookDetailsWithBookNumbers {

    private Book book;
    private BookNumbers bookNumbers;
    private IssueBooks issueBooks;
    private Student student;

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

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

}
