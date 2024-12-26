package vn.nguyenduy.comesticshop.controller.client;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import vn.nguyenduy.comesticshop.domain.Order;
import vn.nguyenduy.comesticshop.domain.OrderDetail;
import vn.nguyenduy.comesticshop.domain.Product;
import vn.nguyenduy.comesticshop.domain.User;
import vn.nguyenduy.comesticshop.domain.dto.OtpForm;
import vn.nguyenduy.comesticshop.domain.dto.RegisterDTO;
import vn.nguyenduy.comesticshop.domain.dto.VerifyRegisterDTO;
import vn.nguyenduy.comesticshop.service.impl.EmailServiceImpl;
import vn.nguyenduy.comesticshop.service.impl.OrderServiceImpl;
import vn.nguyenduy.comesticshop.service.impl.ProductServiceImpl;
import vn.nguyenduy.comesticshop.service.impl.UserServiceImpl;

@Controller
public class HomePageController {

    @Autowired
    private ProductServiceImpl productServiceImpl;
    @Autowired
    private UserServiceImpl userServiceImpl;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private OrderServiceImpl orderServiceImpl;
    @Autowired
    private EmailServiceImpl emailServiceImpl;

    @GetMapping("/")
    public String getHomePage(Model model) {
        Pageable pageable = PageRequest.of(0, 10);
        Page<Product> prs = this.productServiceImpl.fetchProducts(pageable);
        List<Product> products = prs.getContent();
        List<Product> topSellingProducts = this.productServiceImpl.fetchTopSellingProducts(0, 10);
        model.addAttribute("topSellingProducts", topSellingProducts);
        model.addAttribute("products", products);
        return "client/homepage/show";
    }

    @GetMapping("/order-history")
    public String getOrderHistoryPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("id") == null) {
            return "redirect:/login";
        }
        long id = (long) session.getAttribute("id");
        Optional<User> userOptional = this.userServiceImpl.getUserById(id);
        if (!userOptional.isPresent()) {
            return "redirect:/login";
        }

        List<Order> orders = this.orderServiceImpl.fetchOrderByUser(userOptional.get());

        Map<String, List<OrderDetail>> groupedOrderDetails = new HashMap<>();
        for (Order order : orders) {
            for (OrderDetail orderDetail : order.getOrderDetails()) {
                String shopName = orderDetail.getProduct().getShop().getName();
                groupedOrderDetails.computeIfAbsent(shopName, k -> new ArrayList<>()).add(orderDetail);
            }
        }

        Map<Long, Boolean> orderPendingStatus = new HashMap<>();
        for (Order order : orders) {
            boolean hasPendingStatus = true;
            for (OrderDetail orderDetail : order.getOrderDetails()) {
                if (!"PENDING".equals(orderDetail.getStatus())) {
                    hasPendingStatus = false;
                    break;
                }
            }
            orderPendingStatus.put(order.getId(), hasPendingStatus);
            hasPendingStatus = true;
        }

        model.addAttribute("orderPendingStatus", orderPendingStatus);
        model.addAttribute("groupedOrderDetails", groupedOrderDetails);
        model.addAttribute("orders", orders);

        return "client/cart/order-history";
    }

    @GetMapping("/search")
    public String searchProducts(
            @RequestParam("query") String query,
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "criteria", required = false) String criteria,
            @RequestParam(value = "factory", required = false) List<String> factories,
            @RequestParam(value = "target", required = false) List<String> targets,
            @RequestParam(value = "price", required = false) List<String> priceRange,
            @RequestParam(value = "sort", defaultValue = "gia-nothing") String sort,
            Model model) {

        int size = 10;

        List<Product> products = productServiceImpl.searchProducts(query, page, size, criteria, factories, targets,
                priceRange, sort);

        model.addAttribute("products", products);
        model.addAttribute("query", query);
        model.addAttribute("criteria", criteria);
        model.addAttribute("factories", factories);
        model.addAttribute("targets", targets);
        model.addAttribute("priceRange", priceRange);
        model.addAttribute("sort", sort);

        return "client/product/show";
    }

    @GetMapping("/profile")
    public String getInfoUserPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("id") == null) {
            return "redirect:/login";
        }
        long id = (long) session.getAttribute("id");
        Optional<User> userOptional = this.userServiceImpl.getUserById(id);

        if (userOptional.isPresent()) {
            model.addAttribute("user", userOptional.get());
        } else {
            model.addAttribute("error", "User not found");
        }
        return "client/infor/profile";
    }

    @GetMapping("/about")
    public String getAboutPage() {
        return "client/about/show";
    }

    @GetMapping("/contact")
    public String getContactPage() {
        return "client/contact/show";
    }

    @GetMapping("/shop/register")
    public String getRegisterShopPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("id") == null) {
            return "redirect:/login";
        }

        return "client/shop/register";

    }

    @GetMapping("/payment")
    public String handlePaymentResponse(HttpServletRequest request, Model model) {
        String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");
        String message = "00".equals(vnp_ResponseCode) ? "Thanh toán thành công!" : "Thanh toán thất bại!";

        model.addAttribute("message", message);
        model.addAttribute("vnp_Amount", request.getParameter("vnp_Amount"));
        model.addAttribute("vnp_OrderInfo", request.getParameter("vnp_OrderInfo"));
        model.addAttribute("vnp_TxnRef", request.getParameter("vnp_TxnRef"));
        model.addAttribute("vnp_TransactionNo", request.getParameter("vnp_TransactionNo"));
        model.addAttribute("vnp_ResponseCode", vnp_ResponseCode);

        return "client/payment/payment-result";
    }

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        model.addAttribute("registerUser", new RegisterDTO());
        return "client/auth/register";
    }

    @PostMapping("/register")
    public String handleRegister(
            @ModelAttribute("registerUser") @Valid RegisterDTO registerDTO,
            BindingResult bindingResult, Model model, HttpServletRequest request) {

        if (bindingResult.hasErrors()) {
            return "client/auth/register";
        }

        User user = this.userServiceImpl.registerDTOtoUser(registerDTO);

        String hashPassword = this.passwordEncoder.encode(user.getPassword());
        user.setPassword(hashPassword);
        user.setRole(this.userServiceImpl.getRoleByName("USER"));

        String otp = this.userServiceImpl.generateOTP();
        this.emailServiceImpl.sendOtpEmail(user.getEmail(), otp);

        HttpSession session = request.getSession();
        session.setAttribute("otp", otp);
        session.setAttribute("user", user);
        session.setAttribute("otp_expiration_time", System.currentTimeMillis() + (3 * 60 * 1000));

        this.userServiceImpl.handleSaveUser(user);

        System.out.println("Redirecting to /verify-otp");

        return "redirect:/verify-otp";
    }

    @GetMapping("/verify-otp")
    public String getVerifyPage(Model model) {
        model.addAttribute("otpForm", new OtpForm());
        // model.addAttribute("otpForm", new VerifyRegisterDTO());
        return "client/auth/verify";
    }

    @PostMapping("/resend-otp")
    public String resendOtp(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");

        if (user != null) {
            String newOtp = userServiceImpl.generateOTP();

            session.setAttribute("otp", newOtp);
            session.setAttribute("otp_expiration_time", System.currentTimeMillis() + (3 * 60 * 1000));

            emailServiceImpl.sendOtpEmail(user.getEmail(), newOtp);

            model.addAttribute("message", "OTP mới đã được gửi đến email của bạn.");
        } else {
            model.addAttribute("error", "Không tìm thấy email trong session.");
        }

        return "client/auth/verify";
    }

    @PostMapping("/verify-otp")
    public String verifyOtp(
            @ModelAttribute("otpForm") @Valid VerifyRegisterDTO otpForm,
            BindingResult bindingResult,
            HttpServletRequest request) {

        if (bindingResult.hasErrors()) {
            return "client/auth/verify";
        }

        HttpSession session = request.getSession();
        String sessionOtp = (String) session.getAttribute("otp");
        Long otpExpirationTime = (Long) session.getAttribute("otp_expiration_time");

        if (otpExpirationTime != null && System.currentTimeMillis() > otpExpirationTime) {
            return "client/auth/verify-otp-expired";
        }

        if (sessionOtp != null && otpForm.getOtp() != null && otpForm.getOtp().equals(sessionOtp)) {
            User user = (User) session.getAttribute("user");
            if (user != null) {
                user.setActive(true);
                this.userServiceImpl.handleSaveUser(user);
                session.removeAttribute("otp");
                session.removeAttribute("user");
                session.setAttribute("isLogin", true);
                return "redirect:/login";
            }
        }

        return "client/auth/verify-otp-error";
    }

    @GetMapping("/login")
    public String getLoginPage(Model model) {
        return "client/auth/login";
    }

    @GetMapping("/access-deny")
    public String getDenyPage(Model model) {
        return "client/auth/deny";
    }

}
