package com.cits.lms.controller;

import com.cits.lms.commands.FileUpload;
import java.io.File;
import org.springframework.stereotype.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Controller
public class UploadController {

//    @RequestMapping(value = "/upload", method = RequestMethod.POST)
//    public String upload(@ModelAttribute("formUpload") FileUpload fileUpload, Model m) throws IOException {
//
//        List<String> st = this.processUpload(fileUpload);
//        m.addAttribute("ImageUrls", st);
//        return "redirect:/student/student_dashboard?act=success";
//    }
//
//    private List<String> processUpload(FileUpload files) throws IOException {
//        List<String> fileNames = new ArrayList<String>();
//
//        CommonsMultipartFile[] commonsMultipartFiles = files.getFiles();
//
//        for (CommonsMultipartFile multipartFile : commonsMultipartFiles) {
//            FileCopyUtils.copy(multipartFile.getBytes(), new File("C:\\upload\\" + multipartFile.getOriginalFilename()));
//            fileNames.add(multipartFile.getOriginalFilename());
//        }
//
//        return fileNames;
//    }

}
