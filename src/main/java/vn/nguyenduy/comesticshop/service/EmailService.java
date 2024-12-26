package vn.nguyenduy.comesticshop.service;


public interface EmailService {
  void sendOtpEmail(String to, String otp);
}
