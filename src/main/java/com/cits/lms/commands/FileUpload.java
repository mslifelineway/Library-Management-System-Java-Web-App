/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cits.lms.commands;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

/**
 *
 * @author janeman
 */
public class FileUpload {
    private CommonsMultipartFile[] files;

 public CommonsMultipartFile[] getFiles() {
  return files;
 }

 public void setFiles(CommonsMultipartFile[] files) {
  this.files = files;
 }
}
