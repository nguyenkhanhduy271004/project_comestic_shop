package vn.nguyenduy.comesticshop.controller.vendor;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import vn.nguyenduy.comesticshop.domain.Product;
import vn.nguyenduy.comesticshop.domain.Shop;
import vn.nguyenduy.comesticshop.domain.User;
import vn.nguyenduy.comesticshop.service.impl.ProductServiceImpl;
import vn.nguyenduy.comesticshop.service.impl.ShopServiceImpl;
import vn.nguyenduy.comesticshop.service.impl.UploadServiceImpl;
import vn.nguyenduy.comesticshop.service.impl.UserServiceImpl;

@Controller
public class ProductVendorController {

    private final UploadServiceImpl uploadServiceImpl;
    private final ProductServiceImpl productServiceImpl;
    private final UserServiceImpl userServiceImpl;
    private final ShopServiceImpl shopServiceImpl;

    public ProductVendorController(
            UploadServiceImpl uploadServiceImpl,
            ProductServiceImpl productServiceImpl,
            UserServiceImpl userServiceImpl,
            ShopServiceImpl shopServiceImpl) {
        this.uploadServiceImpl = uploadServiceImpl;
        this.productServiceImpl = productServiceImpl;
        this.userServiceImpl = userServiceImpl;
        this.shopServiceImpl = shopServiceImpl;
    }

    @GetMapping("/vendor/product")
    public String getProduct(Model model,
            @RequestParam("page") Optional<String> pageOptional, HttpServletRequest request) {
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
            model.addAttribute("error", "No shop associated with this user.");
            return "vendor/product/show";
        }

        int page = 1;
        if (pageOptional.isPresent()) {
            try {
                page = Integer.parseInt(pageOptional.get());
            } catch (NumberFormatException e) {
                page = 1;
            }
        }

        Pageable pageable = PageRequest.of(page - 1, 10);
        Page<Product> prs = this.productServiceImpl.fetchProductsByShop(shop, pageable);
        List<Product> products = prs.getContent();

        model.addAttribute("products", products);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", prs.getTotalPages());
        return "vendor/product/show";
    }

    @RequestMapping("/vendor/product/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        Optional<Product> productOptional = this.productServiceImpl.fetchProductById(id);

        if (productOptional.isPresent()) {
            Product product = productOptional.get();
            model.addAttribute("product", product);
        } else {
            return "redirect:/vendor/product";
        }

        model.addAttribute("id", id);
        return "vendor/product/detail";
    }

    @RequestMapping("/vendor/product/update/{id}")
    public String getUpdateUserPage(Model model, @PathVariable long id) {
        Optional<Product> productOptional = this.productServiceImpl.fetchProductById(id);
        if (productOptional.isPresent()) {
            Product product = productOptional.get();
            model.addAttribute("newProduct", product);
        } else {
            return "redirect:/vendor/product";
        }

        return "vendor/product/update";
    }

    @PostMapping("/vendor/product/update")
    public String postUpdateProduct(Model model, @ModelAttribute("newProduct") Product product) {
        Optional<Product> currentProductOpt = this.productServiceImpl.fetchProductById(product.getId());
        if (currentProductOpt.isPresent()) {
            Product currentProduct = currentProductOpt.get();
            currentProduct.setName(product.getName());
            currentProduct.setPrice(product.getPrice());
            currentProduct.setQuantity(product.getQuantity());
            currentProduct.setFactory(product.getFactory());

            this.productServiceImpl.createProduct(currentProduct);
        }
        return "redirect:/vendor/product";
    }

    @GetMapping("/vendor/product/delete/{id}")
    public String getDeleteProductPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        // User user = new User();
        // user.setId(id);
        model.addAttribute("newProduct", new Product());
        return "vendor/product/delete";
    }

    @PostMapping("/vendor/product/delete")
    public String postDeleteUser(Model model, @ModelAttribute("newProduct") Product product) {
        this.productServiceImpl.deleteProduct(product.getId());
        return "redirect:/vendor/product";
    }

    @GetMapping("/vendor/product/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "vendor/product/create";
    }

    @PostMapping(value = "/vendor/product/create")
    public String createProduct(Model model,
            @ModelAttribute("newProduct") @Valid Product newProduct,
            BindingResult bindingResult,
            @RequestParam("nguyenduyFile") MultipartFile file, HttpServletRequest request) {

        if (bindingResult.hasErrors()) {
            bindingResult.getFieldErrors().forEach(error -> {
                System.out.println(error.getField() + " - " + error.getDefaultMessage());
            });
            return "vendor/product/create";
        }

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
            model.addAttribute("error", "No shop associated with this user.");
            return "vendor/product/show";
        }

        String image = null;
        if (!file.isEmpty()) {
            image = this.uploadServiceImpl.handleSaveUploadFile(file, "product");
            if (image == null) {
                model.addAttribute("error", "Failed to upload image.");
                return "vendor/product/create";
            }
        }

        newProduct.setImage(image);
        newProduct.setShop(shop);
        this.productServiceImpl.createProduct(newProduct);

        return "redirect:/vendor/product";
    }

}
