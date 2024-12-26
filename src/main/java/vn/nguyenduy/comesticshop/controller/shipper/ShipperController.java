package vn.nguyenduy.comesticshop.controller.shipper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import vn.nguyenduy.comesticshop.domain.Shipper;
import vn.nguyenduy.comesticshop.service.impl.OrderServiceImpl;
import vn.nguyenduy.comesticshop.service.impl.ShipperServiceImpl;

@Controller
@RequestMapping("/shippers")
public class ShipperController {
    @Autowired
    private ShipperServiceImpl shipperServiceImpl;

    @Autowired
    private OrderServiceImpl orderServiceImpl;

    @GetMapping
    public String listShippers(Model model) {
        model.addAttribute("shippers", shipperServiceImpl.getAllShippers());
        return "shippers/list";
    }

    @GetMapping("/{id}")
    public String viewShipperOrders(@PathVariable Long id, Model model) {
        Shipper shipper = shipperServiceImpl.getShipperById(id);
        model.addAttribute("shipper", shipper);
        model.addAttribute("orders", orderServiceImpl.getOrdersByShipperId(id));
        model.addAttribute("deliveredOrderCount", this.orderServiceImpl.countDeliveredOrdersByShipper(id));
        model.addAttribute("pendingOrderCount", this.orderServiceImpl.countPendingOrdersByShipper(id));
        return "shippers/orders";
    }

    @GetMapping("/{id}/delivered")
    public String viewDeliveredOrders(@PathVariable Long id, Model model) {
        Shipper shipper = shipperServiceImpl.getShipperById(id);
        model.addAttribute("shipper", shipper);
        model.addAttribute("deliveredOrders", orderServiceImpl.getDeliveredOrdersByShipper(id));
        model.addAttribute("deliveredOrderCount", orderServiceImpl.countDeliveredOrdersByShipper(id));
        return "shippers/delivered_orders";
    }
}
