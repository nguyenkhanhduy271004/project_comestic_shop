package vn.nguyenduy.comesticshop.controller.admin;

import vn.nguyenduy.comesticshop.domain.Carrier;
import vn.nguyenduy.comesticshop.service.impl.CarrierServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin/carrier")
public class CarrierController {

    @Autowired
    private CarrierServiceImpl carrierServiceImpl;

    @GetMapping("")
    public String listCarriers(Model model) {
        model.addAttribute("carriers", carrierServiceImpl.getAllCarriers());
        return "admin/carrier/list";
    }

    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("carrier", new Carrier());
        return "admin/carrier/add";
    }

    @PostMapping("/add")
    public String addCarrier(@ModelAttribute Carrier carrier) {
        carrierServiceImpl.saveCarrier(carrier);
        return "redirect:/admin/carrier";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Carrier carrier = carrierServiceImpl.getAllCarriers().stream()
                .filter(c -> c.getId().equals(id)).findFirst()
                .orElseThrow(() -> new RuntimeException("Carrier not found"));
        model.addAttribute("carrier", carrier);
        return "admin/carrier/edit";
    }

    @PostMapping("/edit/{id}")
    public String updateCarrier(@PathVariable Long id, @ModelAttribute Carrier carrier) {
        carrierServiceImpl.updateCarrier(id, carrier);
        return "redirect:/admin/carrier";
    }

    @GetMapping("/delete/{id}")
    public String deleteCarrier(@PathVariable Long id) {
        carrierServiceImpl.deleteCarrier(id);
        return "redirect:/admin/carrier";
    }
}
