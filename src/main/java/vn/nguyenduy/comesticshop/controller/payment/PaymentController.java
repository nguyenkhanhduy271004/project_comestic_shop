package vn.nguyenduy.comesticshop.controller.payment;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.nguyenduy.comesticshop.config.payment.VNPAYConfig;

@Controller
public class PaymentController {

    @GetMapping("/pay")
    public String getPay(HttpServletRequest request) throws UnsupportedEncodingException {
        HttpSession session = request.getSession(false);
        double totalPrice = session != null && session.getAttribute("totalPrice") != null
                ? (double) session.getAttribute("totalPrice") 
                : 1000; // Default amount in case session is not available

        long amount = (long) (totalPrice * 100); // Convert to integer cents
        String bankCode = "NCB";

        String vnp_TxnRef = VNPAYConfig.getRandomNumber(8);
        String vnp_IpAddr = "127.0.0.1"; // This should be replaced with actual IP

        String vnp_Version = "2.1.0";
        String vnp_Command = "pay";
        String orderType = "other";
        String vnp_TmnCode = VNPAYConfig.vnp_TmnCode;

        // Prepare parameters map
        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", vnp_Version);
        vnp_Params.put("vnp_Command", vnp_Command);
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(amount));
        vnp_Params.put("vnp_CurrCode", "VND");
        vnp_Params.put("vnp_BankCode", bankCode);
        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
        vnp_Params.put("vnp_OrderType", orderType);
        vnp_Params.put("vnp_Locale", "vn");
        vnp_Params.put("vnp_ReturnUrl", VNPAYConfig.vnp_ReturnUrl);
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

        // Date handling
        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

        cld.add(Calendar.MINUTE, 15); // Set expiration time
        String vnp_ExpireDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

        // Sort parameters and build query string
        List<String> fieldNames = new ArrayList<>(vnp_Params.keySet());
        Collections.sort(fieldNames);

        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();

        Iterator<String> itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = itr.next();
            String fieldValue = vnp_Params.get(fieldName);
            if (fieldValue != null && !fieldValue.isEmpty()) {
                // Append data to hashData and query
                appendToHashDataAndQuery(hashData, query, itr, fieldName, fieldValue);
            }
        }

        // Generate secure hash
        String queryUrl = query.toString();
        String vnp_SecureHash = VNPAYConfig.hmacSHA512(VNPAYConfig.secretKey, hashData.toString());
        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;

        // Generate payment URL
        String paymentUrl = VNPAYConfig.vnp_PayUrl + "?" + queryUrl;

        return "redirect:" + paymentUrl;
    }

    private void appendToHashDataAndQuery(StringBuilder hashData, StringBuilder query, Iterator<String> itr, String fieldName, String fieldValue) throws UnsupportedEncodingException {
        hashData.append(fieldName).append('=').append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
        query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()))
             .append('=')
             .append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));

        if (itr.hasNext()) {
            query.append('&');
            hashData.append('&');
        }
    }
}
