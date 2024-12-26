package vn.nguyenduy.comesticshop.controller.vendor;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.nguyenduy.comesticshop.domain.Order;
import vn.nguyenduy.comesticshop.domain.OrderDetail;
import vn.nguyenduy.comesticshop.domain.Shop;
import vn.nguyenduy.comesticshop.domain.User;
import vn.nguyenduy.comesticshop.service.impl.OrderServiceImpl;
import vn.nguyenduy.comesticshop.service.impl.ShopServiceImpl;
import vn.nguyenduy.comesticshop.service.impl.UserServiceImpl;

@Controller
public class OrderVendorController {

    private final OrderServiceImpl orderServiceImpl;
    private final UserServiceImpl userServiceImpl;
    private final ShopServiceImpl shopServiceImpl;

    public OrderVendorController(OrderServiceImpl orderServiceImpl, UserServiceImpl userServiceImpl, ShopServiceImpl shopServiceImpl) {
        this.orderServiceImpl = orderServiceImpl;
        this.userServiceImpl = userServiceImpl;
        this.shopServiceImpl = shopServiceImpl;
    }

    @GetMapping("/vendor/order")
    public String getDashboard(Model model, @RequestParam("page") Optional<Integer> pageOptional,
            HttpServletRequest request) {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("id") == null) {
            return "redirect:/login";
        }

        Long userId = (Long) session.getAttribute("id");
        Optional<User> user = this.userServiceImpl.getUserById(userId);
        if (!user.isPresent()) {
            return "redirect:/login";
        }

        Shop shop = this.shopServiceImpl.findByOwner(user.get());
        if (shop == null) {
            model.addAttribute("error", "User không sở hữu shop nào.");
            return "vendor/order/show";
        }

        Long shopId = shop.getId();
        int page = pageOptional.orElse(1) - 1;
        Pageable pageable = PageRequest.of(page, 10);

        Page<OrderDetail> orderDetails = this.orderServiceImpl.fetchOrdersByShopId(shopId, pageable);

        Page<Order> order = this.orderServiceImpl.fetchAllOrders(pageable);

        model.addAttribute("shopId", shopId);
        model.addAttribute("orderDetails", orderDetails.getContent());
        model.addAttribute("orders", order.getContent());
        model.addAttribute("currentPage", page + 1);
        model.addAttribute("totalPages", orderDetails.getTotalPages());
        return "vendor/order/show";
    }

    @GetMapping("/vendor/order/{id}")
    public String getOrderDetailPage(Model model, @PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("id") == null) {
            return "redirect:/login";
        }

        Long userId = (Long) session.getAttribute("id");
        Optional<User> user = this.userServiceImpl.getUserById(userId);
        if (!user.isPresent()) {
            return "redirect:/login";
        }

        Shop shop = this.shopServiceImpl.findByOwner(user.get());
        if (shop == null) {
            model.addAttribute("error", "User không sở hữu shop nào.");
            return "vendor/order/show";
        }

        Long shopId = shop.getId();
        List<OrderDetail> orderDetails = this.orderServiceImpl.findByOrderId(id);
        model.addAttribute("shopId", shopId);
        model.addAttribute("orderDetails", orderDetails);
        return "vendor/order/detail";
    }

    @GetMapping("/vendor/order/delete/{id}")
    public String getDeleteOrderPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("newOrder", new Order());
        return "vendor/order/delete";
    }

    @PostMapping("/vendor/order/delete")
    public String postDeleteOrder(@ModelAttribute("newOrder") Order order) {
        this.orderServiceImpl.deleteOrderById(order.getId());
        return "redirect:/vendor/order";
    }

    @GetMapping("/vendor/order/update/{id}")
    public String getUpdateOrderPage(Model model, @PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("id") == null) {
            return "redirect:/login";
        }

        Long userId = (Long) session.getAttribute("id");
        Optional<User> user = this.userServiceImpl.getUserById(userId);
        if (!user.isPresent()) {
            return "redirect:/login";
        }

        Shop shop = this.shopServiceImpl.findByOwner(user.get());
        if (shop == null) {
            model.addAttribute("error", "User không sở hữu shop nào.");
            return "vendor/order/show";
        }

        Long shopId = shop.getId();
        Optional<Order> currentOrderOpt = this.orderServiceImpl.fetchOrderById(id);

        if (currentOrderOpt.isPresent()) {
            Order currentOrder = currentOrderOpt.get();

            List<OrderDetail> orderDetailsForShop = currentOrder.getOrderDetails().stream()
                    .filter(od -> od.getProduct().getShop().getId().equals(shopId))
                    .collect(Collectors.toList());

            double totalValueForShop = orderDetailsForShop.stream()
                    .mapToDouble(od -> od.getPrice() * od.getQuantity())
                    .sum();

            // currentOrder.setStatus(currentOrder.getOrderDetails().get(0).getStatus());
            currentOrder.setStatus(orderDetailsForShop.get(0).getStatus());
            model.addAttribute("newOrder", currentOrder);
            // model.addAttribute("status", orderDetailsForShop.get(0).getStatus());
            model.addAttribute("orderDetailsForShop", orderDetailsForShop);
            model.addAttribute("totalValueForShop", totalValueForShop);
            // model.addAttribute("status", orderDetailsForShop.get(0).getStatus());
        }

        return "vendor/order/update";
    }

    @PostMapping("/vendor/order/update")
    public String handleUpdateOrder(Model model, @ModelAttribute("newOrder") Order order, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("id") == null) {
            return "redirect:/login";
        }

        Long userId = (Long) session.getAttribute("id");
        Optional<User> user = this.userServiceImpl.getUserById(userId);
        if (!user.isPresent()) {
            return "redirect:/login";
        }

        Shop shop = this.shopServiceImpl.findByOwner(user.get());
        if (shop == null) {
            model.addAttribute("error", "User không sở hữu shop nào.");
            return "vendor/order/show";
        }

        Long shopId = shop.getId();
        Long orderId = order.getId();

        Order curOrder = this.orderServiceImpl.fetchOrderById(orderId).get();

        List<OrderDetail> orderDetailsForShop = curOrder.getOrderDetails().stream()
                .filter(od -> od.getProduct().getShop().getId().equals(shopId))
                .collect(Collectors.toList());

        for (OrderDetail od : orderDetailsForShop) {
            od.setStatus(order.getStatus());
            this.orderServiceImpl.updateOrderDetail(od);
        }

        // this.orderService.updateOrderDetails(orderDetailsForShop);

        return "redirect:/vendor/order";
    }

}
