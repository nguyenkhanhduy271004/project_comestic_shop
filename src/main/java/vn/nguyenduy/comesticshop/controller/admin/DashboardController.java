package vn.nguyenduy.comesticshop.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import vn.nguyenduy.comesticshop.service.impl.UserServiceImpl;

@Controller
public class DashboardController {

    @Autowired
    private UserServiceImpl userServiceImpl;

    @GetMapping("/admin")
    public String getDashboard(Model model) {
        model.addAttribute("countUsers", this.userServiceImpl.countUsers());
        model.addAttribute("countProducts", this.userServiceImpl.countProducts());
        model.addAttribute("countOrders", this.userServiceImpl.countOrders());
        return "admin/dashboard/show";
    }
}
