
package com.cits.lms.exceptions;

public class StudentNotVerifiedException extends Exception{
    
     /**
     * it creates student not verified exception without error
     */
    public StudentNotVerifiedException(){
        
    }
     /**
     * it creates student not verified exception without error
     */
    public StudentNotVerifiedException(String err){
        super(err);
    }
}
