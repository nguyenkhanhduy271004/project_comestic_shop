package vn.nguyenduy.comesticshop.service;

import org.springframework.web.multipart.MultipartFile;

public interface UploadService {

  String handleSaveUploadFile(MultipartFile file, String targetFolder);
}
