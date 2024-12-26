package vn.nguyenduy.comesticshop.controller.vendor;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;
import vn.nguyenduy.comesticshop.domain.Shop;
import vn.nguyenduy.comesticshop.domain.User;
import vn.nguyenduy.comesticshop.service.impl.OrderServiceImpl;
import vn.nguyenduy.comesticshop.service.impl.ShopServiceImpl;
import vn.nguyenduy.comesticshop.service.impl.UserServiceImpl;

@Controller
public class DashboardVendorController {

    @Autowired
    private UserServiceImpl userServiceImpl;

    @Autowired
    private OrderServiceImpl orderServiceImpl;

    @Autowired
    private ShopServiceImpl shopServiceImpl;

    @GetMapping("/vendor")
    public String getDashboard(Model model, HttpSession session) {
        Long userId = (Long) session.getAttribute("id");
        Optional<User> user = userServiceImpl.getUserById(userId);
        if (!user.isPresent()) {
            return "redirect:/login";
        }

        Shop shop = shopServiceImpl.findByOwner(user.get());
        long shopId = shop.getId();
        int year = 2024;
        List<Object[]> monthlyRevenue = orderServiceImpl.getMonthlyRevenue(shopId, year);
        model.addAttribute("monthlyRevenue", monthlyRevenue);
        model.addAttribute("countUsers", this.userServiceImpl.countUsers());
        model.addAttribute("countProducts", this.userServiceImpl.countProducts());
        model.addAttribute("countOrders", this.userServiceImpl.countOrders());
        return "vendor/dashboard/show";
    }
}
