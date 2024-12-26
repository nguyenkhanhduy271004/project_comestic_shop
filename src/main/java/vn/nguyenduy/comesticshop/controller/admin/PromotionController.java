package vn.nguyenduy.comesticshop.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import vn.nguyenduy.comesticshop.domain.Promotion;
import vn.nguyenduy.comesticshop.domain.User;
import vn.nguyenduy.comesticshop.service.impl.PromotionServiceImpl;
import vn.nguyenduy.comesticshop.service.impl.ShopServiceImpl;
import vn.nguyenduy.comesticshop.service.impl.UserServiceImpl;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import java.util.Optional;

@Controller
@RequestMapping("/admin/promotion")
public class PromotionController {

    @Autowired
    private PromotionServiceImpl promotionServiceImpl;

    @Autowired
    private ShopServiceImpl shopServiceImpl;

    @Autowired
    private UserServiceImpl userServiceImpl;

    @GetMapping
    public String listPromotions(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("id") == null) {
            return "redirect:/login";
        }

        model.addAttribute("promotions", this.promotionServiceImpl.findAll());
        return "admin/promotion/show";
    }

    @GetMapping("/add")
    public String showAddPromotionForm(Model model) {
        model.addAttribute("promotion", new Promotion());
        return "admin/promotion/create";
    }

    @PostMapping("/add")
    public String addPromotion(@ModelAttribute Promotion promotion, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("id") == null) {
            return "redirect:/login";
        }

        Long userId = (Long) session.getAttribute("id");
        Optional<User> user = this.userServiceImpl.getUserById(userId);
        if (!user.isPresent()) {
            return "redirect:/login";
        }

        // Shop shop = this.shopService.findByOwner(user.get());
        promotion.setShop(null);

        promotionServiceImpl.savePromotion(promotion);

        return "redirect:/admin/promotion";
    }

    @GetMapping("/edit/{id}")
    public String showEditPromotionForm(@PathVariable Long id, Model model) {
        Optional<Promotion> promotion = this.promotionServiceImpl.getPromotionById(id);
        if (promotion.isPresent()) {
            model.addAttribute("promotion", promotion.get());
            return "admin/promotion/create";
        }
        return "redirect:/admin/promotion";
    }

    @PostMapping("/edit")
    public String editPromotion(@ModelAttribute Promotion promotion, HttpServletRequest request) {
        Optional<Promotion> existingPromotionOpt = this.promotionServiceImpl.getPromotionById(promotion.getId());
        if (existingPromotionOpt.isPresent()) {
            Promotion existingPromotion = existingPromotionOpt.get();

            existingPromotion.setName(promotion.getName());
            existingPromotion.setDescription(promotion.getDescription());
            existingPromotion.setDiscountRate(promotion.getDiscountRate());
            existingPromotion.setStartDate(promotion.getStartDate());
            existingPromotion.setEndDate(promotion.getEndDate());

            this.promotionServiceImpl.savePromotion(existingPromotion);
        }

        return "redirect:/admin/promotion";
    }

    @GetMapping("/delete/{id}")
    public String deletePromotion(@PathVariable Long id) {
        this.promotionServiceImpl.deletePromotion(id);
        return "redirect:/admin/promotion";
    }
}
