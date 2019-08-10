
package com.cits.lms.utils;

import java.util.Random;

public class ConstantsRequired {
    
    /**
     * constants for COURSE
     */
    public static final int CSE_COURSE = 1;
    public static final int ECE_COURSE = 2;
    public static final int EEE_COURSE = 3;
    public static final int CE_COURSE = 4;
    public static final int ME_COURSE = 5;
    public static final int ALL_COURSE = 0;
    
    /**
     * constants for COURSE in String
     */
    public static final String CSE_COURSE_STRING = "CSE";
    public static final String ECE_COURSE_STRING = "ECE";
    public static final String EEE_COURSE_STRING = "EEE";
    public static final String CE_COURSE_STRING = "CIVIL";
    public static final String ME_COURSE_STRING = "MECHANICAL";
    
    
    /**
     * 
     * constants required for Academic Year
     */
    public static final int FIRST_YEAR = 1; 
    public static final int SECOND_YEAR = 2;
    public static final int THIRD_YEAR = 3;
    public static final int FOURTH_YEAR = 4;
    
    /**
     * constants required for Student Appearing Semester
     */
    public static final int FIRST_SEM = 1;
    public static final int SECOND_SEM = 2;
    
    /**
     * constants required for student verification
     * NOT_VERIFIED = 1, VERIFIED = 2;
     */
    public static final int NOT_VERIFIED = 1; 
    public static final int VERIFIED = 2;
    public static final int PENDING = 3;
    /**
     * constants for issue books ==> ISSUED=1;RETURNED=2;
     */
    public static final int ISSUED = 1;
    public static final int RETURNED = 2;
    /** 
     * constant required for student profile image
     */
    public static String DEFAULT_PROFILE_IMAGE = "default.png";
    /**
     * Path or Location of uploaded images 
     */
    public static String UPLOAD_ROOT_PATH = "G:\\NetBeans Projects\\lms\\src\\main\\webapp\\static\\user_profile_images\\";
    
    /**
     * Method to generate Random Number of 6-digits
     * @return 
     */
    public static Integer getRandomKey(){
        // create instance of Random class 
        Random rand = new Random(); 
        // Generate random integers in range 0 to 999999 --> length=6 (specified in database)
        return rand.nextInt(1000000);
    }
    
}
