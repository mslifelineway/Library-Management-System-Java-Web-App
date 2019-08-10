package com.cits.lms.utils;

import com.cits.lms.commands.FileUpload;
import static com.cits.lms.utils.ConstantsRequired.UPLOAD_ROOT_PATH;
import java.awt.image.BufferedImage;
import java.io.BufferedWriter;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;

import java.util.Date;
import java.util.List;
import java.util.regex.Pattern;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class LmsHelperClass {

    /**
     * This method will take contactNo of String type to validate contactNo. and
     * if valid contact no ==> return true else return false
     *
     * @param contactNo
     * @return
     */
    public static boolean validateContactNumber(String contactNo) {
        return contactNo.matches("\\d{10}");
    }

    /**
     * This is method will take email of string type as input and validate it It
     * will return true only if email is valid
     *
     * @param email
     * @return
     */
    public static boolean validateEmail(String email) {
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\."
                + "[a-zA-Z0-9_+&*-]+)*@"
                + "(?:[a-zA-Z0-9-]+\\.)+[a-z"
                + "A-Z]{2,7}$";

        Pattern pat = Pattern.compile(emailRegex);
        if (email == null) {
            return false;
        }
        return pat.matcher(email).matches();
    }

    /**
     * converting Timestamp time in sql to string
     *
     * @param timestamp
     * @return
     */
    public static String timestampAsString(Timestamp timestamp) {
        System.out.println("-------- time stamp : " + timestamp);
        Date date = new Date();
        if (timestamp != null) {
            date.setTime(timestamp.getTime());
            String formattedDate = new SimpleDateFormat("dd-MM-yyyy").format(date);
            System.out.println("======== time in string : " + formattedDate);

            return formattedDate;
        } else {
            return null;
        }
    }

    public static List<String> processUpload(FileUpload files, Integer studentId) throws IOException {
        List<String> fileNames = new ArrayList<String>();

        CommonsMultipartFile[] commonsMultipartFiles = files.getFiles();

        for (CommonsMultipartFile multipartFile : commonsMultipartFiles) {
            String imgUrl = studentId + "_" + ConstantsRequired.getRandomKey() + "_" + multipartFile.getOriginalFilename();
            FileCopyUtils.copy(multipartFile.getBytes(), new File(ConstantsRequired.UPLOAD_ROOT_PATH + imgUrl));
            fileNames.add(imgUrl);
        }

        return fileNames;
    }

    /**
     * getting current date and time in format : 01/04/2019 03:06:18
     *
     * @return
     */
    public static String getCurrentDateTime() {
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        Date date = new Date();
        return formatter.format(date);
    }

    public static String uploadSingleImage(String image, Integer studentId) throws IOException {
        String imgUrl = studentId + "_" + ConstantsRequired.getRandomKey() + "_" + image + ".png";
        FileCopyUtils.copy(image.getBytes(), new File(ConstantsRequired.UPLOAD_ROOT_PATH + imgUrl));
        return imgUrl;
    }

    public static byte[] DecodeString(String input_string) {
        byte[] imageByte = null;
        if(!input_string.equals(""))
            imageByte = Base64.getDecoder().decode(input_string);
        return imageByte;
    }
   /**
    * This method will used to upload image onto a directory 
    * not is the database and it will return 'true' if uploaded else false
    * @param image
     * @param file_name
    * @return
    * @throws IOException
    * @throws Exception 
    */
    public static boolean uploadImage(String image , String file_name) throws IOException, Exception{
        boolean result = false; 
        if (!image.equals("")) {
            int comma_index = image.indexOf(',');
            int semicolon_index = image.indexOf(';');
            int colon_index = image.indexOf(':');
            String image_ext = image.substring(colon_index + 1, semicolon_index);
            //// validating image type ////
            if (image_ext.equals("image/type") || image_ext.equals("image/png") || image_ext.equals("image/jpeg")) {
                ///// generating image string for decoding because the input image is encoded
                String decodable_image = image.substring(comma_index + 1, image.length());
                ///// decoding the image string
                byte[] imageByte = LmsHelperClass.DecodeString(decodable_image);
                if (imageByte != null) {
                    System.out.println("============ img bytes : "+ imageByte);
                    // create a buffered image
                    ByteArrayInputStream bis = new ByteArrayInputStream(imageByte);
                    BufferedImage image1 = ImageIO.read(bis);
                    bis.close();
                    ////// creating a file to a specific path to upload image...
                    File outputfile = new File(UPLOAD_ROOT_PATH + file_name);
                    ///// since, file has been created so write the image onto that file (writing decoded image string onto the created file)
                    ImageIO.write(image1, "png", outputfile);
                    result = true;
                }
            } else {
                result = false;
            }
        }
        else{
            result = false;
        }
        return result;
    }
    
  
}
