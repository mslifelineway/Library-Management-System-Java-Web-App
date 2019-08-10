package com.cits.lms.commands;

import com.cits.lms.domain.Student;

public class StudentProfileDataCommand {

    private FileUpload fileUpload;
    private Student student;

    public FileUpload getFileUpload() {
        return fileUpload;
    }

    public void setFileUpload(FileUpload fileUpload) {
        this.fileUpload = fileUpload;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

}
