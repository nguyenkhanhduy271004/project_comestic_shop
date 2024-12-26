package vn.nguyenduy.comesticshop.controller.client;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.nguyenduy.comesticshop.domain.Carrier;
import vn.nguyenduy.comesticshop.domain.Cart;
import vn.nguyenduy.comesticshop.domain.CartDetail;
import vn.nguyenduy.comesticshop.domain.Order;
import vn.nguyenduy.comesticshop.domain.OrderDetail;
import vn.nguyenduy.comesticshop.domain.Product;
import vn.nguyenduy.comesticshop.domain.Product_;
import vn.nguyenduy.comesticshop.domain.Promotion;
import vn.nguyenduy.comesticshop.domain.Review;
import vn.nguyenduy.comesticshop.domain.Shop;
import vn.nguyenduy.comesticshop.domain.User;
import vn.nguyenduy.comesticshop.domain.dto.ProductCriteriaDTO;
import vn.nguyenduy.comesticshop.service.impl.CartDetailServiceImpl;
import vn.nguyenduy.comesticshop.service.impl.OrderServiceImpl;
import vn.nguyenduy.comesticshop.service.impl.ProductServiceImpl;
import vn.nguyenduy.comesticshop.service.impl.PromotionServiceImpl;
import vn.nguyenduy.comesticshop.service.impl.ReviewServiceImpl;
import vn.nguyenduy.comesticshop.service.impl.UserServiceImpl;

@Controller
public class ItemController {

    @Autowired
    private ProductServiceImpl productServiceImpl;
    @Autowired
    private ReviewServiceImpl reviewServiceImpl;
    @Autowired
    private UserServiceImpl userServiceImpl;
    @Autowired
    private PromotionServiceImpl promotionServiceImpl;
    @Autowired
    OrderServiceImpl orderServiceImpl;
    @Autowired
    CartDetailServiceImpl cartDetailServiceImpl;

    @GetMapping("/product/{id}")
    public String getProductPage(Model model, @PathVariable long id, @RequestParam(defaultValue = "1") int page,
            HttpServletRequest request) {
        Product pr = this.productServiceImpl.fetchProductById(id)
                .orElseThrow(() -> new IllegalArgumentException("Product not found"));

        Pageable pageable = PageRequest.of(page - 1, 5);
        Page<Review> reviews = this.reviewServiceImpl.getAllReviewsByProductId(id, pageable);

        HttpSession session = request.getSession(false);
        Long userId = (Long) session.getAttribute("id");

        boolean isFavorited = this.userServiceImpl.isProductInFavorites(id, userId);

        model.addAttribute("product", pr);
        model.addAttribute("reviews", reviews);
        model.addAttribute("id", id);
        model.addAttribute("currentPage", page);
        model.addAttribute("userId", userId);
        model.addAttribute("isFavorited", isFavorited);

        return "client/product/detail";
    }

    @PostMapping("/add-product-to-cart/{id}")
    public String addProductToCart(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        long productId = id;
        String email = (String) session.getAttribute("email");

        this.productServiceImpl.handleAddProductToCart(email, productId, session, 1);

        return "redirect:/products";
    }

    private Carrier getFirstCarrierOfShop(Shop shop) {
        List<Carrier> carriers = shop.getCarriers();
        if (carriers != null && !carriers.isEmpty()) {
            return carriers.get(0);
        }
        return null;
    }

    @GetMapping("/cart")
    public String getCartPage(Model model, HttpServletRequest request) {
        User currentUser = new User();
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("id") == null) {
            return "redirect:/login";
        }
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        Cart cart = this.productServiceImpl.fetchByUser(currentUser);
        System.out.println("Fetched cart: " + cart);

        List<CartDetail> cartDetails = cart == null ? new ArrayList<>() : cart.getCartDetails();

        Map<Shop, List<CartDetail>> shopCartDetailsMap = new HashMap<>();
        double totalPrice = 0;

        for (CartDetail cd : cartDetails) {
            Double discountPercentage = cd.getProduct().getDiscountPercentage();
            double productPrice = discountPercentage != null && discountPercentage > 0
                    ? cd.getPrice() * (1 - discountPercentage / 100)
                    : cd.getPrice();

            totalPrice += productPrice * cd.getQuantity();

            Shop shop = cd.getProduct().getShop();
            shopCartDetailsMap.computeIfAbsent(shop, k -> new ArrayList<>()).add(cd);
        }

        Map<Shop, Double> shopTotalPrices = new HashMap<>();
        double totalShippingFee = 0;

        for (Map.Entry<Shop, List<CartDetail>> entry : shopCartDetailsMap.entrySet()) {
            double shopTotal = entry.getValue().stream()
                    .mapToDouble(cd -> {
                        Double discountPercentage = cd.getProduct().getDiscountPercentage();
                        double productPrice = discountPercentage != null && discountPercentage > 0
                                ? cd.getPrice() * (1 - discountPercentage / 100)
                                : cd.getPrice();
                        return productPrice * cd.getQuantity();
                    })
                    .sum();

            shopTotalPrices.put(entry.getKey(), shopTotal);

            Shop shop = entry.getKey();
            Carrier firstCarrier = getFirstCarrierOfShop(shop);

            if (firstCarrier != null) {
                totalShippingFee += firstCarrier.getShippingFee();
            }
        }

        double totalAmount = totalPrice + totalShippingFee;
        model.addAttribute("totalAmount", totalAmount);

        model.addAttribute("shopCartDetailsMap", shopCartDetailsMap);
        model.addAttribute("shopTotalPrices", shopTotalPrices);
        model.addAttribute("totalShippingFee", totalShippingFee);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("cart", cart);

        return "client/cart/show";
    }

    @PostMapping("/delete-cart-product/{id}")
    public String deleteCartDetail(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long cartDetailId = id;
        CartDetail cartDetail = this.cartDetailServiceImpl.findById(cartDetailId).get();
        Product product = this.productServiceImpl.fetchProductById(cartDetail.getProduct().getId()).get();
        product.setQuantity(cartDetail.getQuantity());
        this.productServiceImpl.saveProduct(product);
        this.productServiceImpl.handleRemoveCartDetail(cartDetailId, session);
        return "redirect:/cart";
    }

    @GetMapping("/checkout")
    public String getCheckOutPage(Model model, HttpServletRequest request) {
        User currentUser = new User();
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("id") == null) {
            return "redirect:/login";
        }

        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        Optional<User> user = userServiceImpl.getUserById(id);

        Cart cart = this.productServiceImpl.fetchByUser(currentUser);
        System.out.println("Fetched cart: " + cart);

        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();
        double totalPrice = 0;
        // for (CartDetail cd : cartDetails) {
        // Double discountPercentage = cd.getProduct().getDiscountPercentage();
        // if (discountPercentage != null && discountPercentage > 0) {
        // totalPrice += (cd.getPrice() * (1 - discountPercentage / 100)) *
        // cd.getQuantity();
        // } else {
        // totalPrice += cd.getPrice() * cd.getQuantity();
        // }
        // }

        Map<Shop, List<CartDetail>> shopCartDetailsMap = new HashMap<>();
        for (CartDetail cd : cartDetails) {
            Double discountPercentage = cd.getProduct().getDiscountPercentage();
            double productPrice = discountPercentage != null && discountPercentage > 0
                    ? cd.getPrice() * (1 - discountPercentage / 100)
                    : cd.getPrice();

            totalPrice += productPrice * cd.getQuantity();

            Shop shop = cd.getProduct().getShop();
            shopCartDetailsMap.computeIfAbsent(shop, k -> new ArrayList<>()).add(cd);
        }

        Map<Shop, Double> shopTotalPrices = new HashMap<>();
        double totalShippingFee = 0;

        for (Map.Entry<Shop, List<CartDetail>> entry : shopCartDetailsMap.entrySet()) {
            double shopTotal = entry.getValue().stream()
                    .mapToDouble(cd -> {
                        Double discountPercentage = cd.getProduct().getDiscountPercentage();
                        double productPrice = discountPercentage != null && discountPercentage > 0
                                ? cd.getPrice() * (1 - discountPercentage / 100)
                                : cd.getPrice();
                        return productPrice * cd.getQuantity();
                    })
                    .sum();

            shopTotalPrices.put(entry.getKey(), shopTotal);

            Shop shop = entry.getKey();
            Carrier firstCarrier = getFirstCarrierOfShop(shop);

            if (firstCarrier != null) {
                totalShippingFee += firstCarrier.getShippingFee();
            }
        }

        totalPrice += totalShippingFee;

        List<Promotion> promotions = promotionServiceImpl.findAll();

        List<Long> shopIdsInCart = cartDetails.stream()
                .map(cd -> cd.getProduct().getShop().getId())
                .distinct()
                .collect(Collectors.toList());

        promotions = promotions.stream()
                .filter(promotion -> promotion.getShop() == null ||
                        shopIdsInCart.contains(promotion.getShop().getId()))
                .filter(promotion -> !promotion.getEndDate().isBefore(LocalDate.now()))
                .collect(Collectors.toList());

        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalShippingFee", totalShippingFee);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("promotions", promotions);
        if (user.isPresent()) {
            model.addAttribute("user", user.get());
        }

        model.addAttribute("cart", cart);

        return "client/cart/checkout";
    }

    @PostMapping("/confirm-checkout")
    public String getCheckOutPage(@ModelAttribute("cart") Cart cart) {
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();
        this.productServiceImpl.handleUpdateCartBeforeCheckout(cartDetails);
        return "redirect:/checkout";
    }

    @PostMapping("/place-order")
    public String handlePlaceOrder(
            HttpServletRequest request,
            @RequestParam("receiverName") String receiverName,
            @RequestParam("receiverAddress") String receiverAddress,
            @RequestParam("receiverPhone") String receiverPhone,
            @RequestParam(value = "promotionId", required = false) Long promotionId,
            @RequestParam(value = "paymentMethod", required = false) String paymentMethod,
            @RequestParam(value = "totalShippingFee", required = false) double totalShippingFee) {

        User currentUser = new User();
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("id") == null) {
            return "redirect:/login";
        }

        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        Cart cart = this.productServiceImpl.fetchByUser(currentUser);
        if (cart == null || cart.getCartDetails() == null || cart.getCartDetails().isEmpty()) {
            return "redirect:/cart";
        }

        Optional<Promotion> promotion = Optional.empty();
        if (promotionId != null && promotionId != 0) {
            promotion = promotionServiceImpl.getPromotionById(promotionId);
        }

        double totalPrice = 0;

        for (CartDetail cd : cart.getCartDetails()) {
            Double discountPercentage = cd.getProduct().getDiscountPercentage();
            double productPrice = cd.getPrice() * cd.getQuantity();

            if (promotion.isPresent()) {
                if (promotion.get().getShop() == null || promotion.get().getShop().equals(cd.getProduct().getShop())) {
                    totalPrice += (productPrice * (1 - discountPercentage / 100));
                } else {
                    totalPrice += productPrice;
                }
            } else {
                totalPrice += productPrice;
            }
        }

        if (promotion.isPresent() && promotion.get().getShop() == null) {
            totalPrice -= (totalPrice * promotion.get().getDiscountRate()) / 100;
        }

        totalPrice += totalShippingFee;

        session.setAttribute("totalPrice", totalPrice);

        this.productServiceImpl.handlePlaceOrder(currentUser, session, receiverName, receiverAddress, receiverPhone,
                paymentMethod, totalShippingFee,
                promotionId);

        if ("VNPay".equalsIgnoreCase(paymentMethod)) {
            return "redirect:/pay";
        }

        return "redirect:/thanks";
    }

    @GetMapping("/thanks")
    public String getThankYouPage(Model model) {

        return "client/cart/thanks";
    }

    @PostMapping("/add-product-from-view-detail")
    public String handleAddProductFromViewDetail(
            @RequestParam("id") long id,
            @RequestParam("quantity") long quantity,
            HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        String email = (String) session.getAttribute("email");
        this.productServiceImpl.handleAddProductToCart(email, id, session, quantity);
        return "redirect:/product/" + id;
    }

    @GetMapping("/products")
    public String getProductPage(Model model,
            ProductCriteriaDTO productCriteriaDTO,
            HttpServletRequest request) {
        int page = 1;
        try {
            if (productCriteriaDTO.getPage().isPresent()) {
                page = Integer.parseInt(productCriteriaDTO.getPage().get());
            }
        } catch (Exception e) {
            // page = 1
        }

        Pageable pageable = PageRequest.of(page - 1, 10);

        if (productCriteriaDTO.getSort() != null && productCriteriaDTO.getSort().isPresent()) {
            String sort = productCriteriaDTO.getSort().get();
            if (sort.equals("gia-tang-dan")) {
                pageable = PageRequest.of(page - 1, 10, Sort.by(Product_.PRICE).ascending());
            } else if (sort.equals("gia-giam-dan")) {
                pageable = PageRequest.of(page - 1, 10, Sort.by(Product_.PRICE).descending());
            }
        }

        if (productCriteriaDTO.getCriteria() != null && productCriteriaDTO.getCriteria().isPresent()) {
            String criteria = productCriteriaDTO.getCriteria().get();
            if (criteria.equals("best_seller")) {
                pageable = PageRequest.of(page - 1, 10, Sort.by(Product_.QUANTITY_SOLD).descending());
            } else if (criteria.equals("new")) {
                pageable = PageRequest.of(page - 1, 10, Sort.by(Product_.CREATE_DATE).descending());
            } else if (criteria.equals("evaluate")) {
                pageable = PageRequest.of(page - 1, 10, Sort.by(Product_.STAR).descending());
            } else if (criteria.equals("favorite")) {
                pageable = PageRequest.of(page - 1, 10, Sort.by(Product_.LIKES).descending());
            }
        }

        Page<Product> prs = this.productServiceImpl.fetchProductsWithSpec(pageable, productCriteriaDTO);

        List<Product> products = prs.getContent().size() > 0 ? prs.getContent() : new ArrayList<Product>();

        String qs = request.getQueryString();
        if (qs != null && !qs.isBlank()) {
            qs = qs.replace("page=" + page, "");
        }

        model.addAttribute("products", products);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", prs.getTotalPages());
        model.addAttribute("queryString", qs);

        return "client/product/show";
    }

    @GetMapping("/products-sell")
    public String getProductPageSell(Model model, ProductCriteriaDTO productCriteriaDTO, HttpServletRequest request) {
        int page = 1;
        try {
            if (productCriteriaDTO.getPage().isPresent()) {
                page = Integer.parseInt(productCriteriaDTO.getPage().get());
            }
        } catch (Exception e) {
        }

        Pageable pageable = PageRequest.of(page - 1, 10);

        if (productCriteriaDTO.getSort() != null && productCriteriaDTO.getSort().isPresent()) {
            String sort = productCriteriaDTO.getSort().get();
            if (sort.equals("gia-tang-dan")) {
                pageable = PageRequest.of(page - 1, 10, Sort.by(Product_.PRICE).ascending());
            } else if (sort.equals("gia-giam-dan")) {
                pageable = PageRequest.of(page - 1, 10, Sort.by(Product_.PRICE).descending());
            }
        }

        if (productCriteriaDTO.getCriteria() != null && productCriteriaDTO.getCriteria().isPresent()) {
            String criteria = productCriteriaDTO.getCriteria().get();
            if (criteria.equals("best_seller")) {
                pageable = PageRequest.of(page - 1, 10, Sort.by(Product_.QUANTITY_SOLD).descending());
            } else if (criteria.equals("new")) {
                pageable = PageRequest.of(page - 1, 10, Sort.by(Product_.CREATE_DATE).descending());
            } else if (criteria.equals("evaluate")) {
                pageable = PageRequest.of(page - 1, 10, Sort.by(Product_.STAR).descending());
            } else if (criteria.equals("favorite")) {
                pageable = PageRequest.of(page - 1, 10, Sort.by(Product_.LIKES).descending());
            }
        }

        Page<Product> prs = this.productServiceImpl.fetchProductsWithSpec(pageable, productCriteriaDTO);

        List<Product> products = prs.getContent().size() > 0 ? prs.getContent() : new ArrayList<Product>();

        // Lọc các sản phẩm có discountPercentage khác null
        products = products.stream()
                .filter(product -> product.getDiscountPercentage() != null && product.getDiscountPercentage() > 0)
                .collect(Collectors.toList());

        String qs = request.getQueryString();
        if (qs != null && !qs.isBlank()) {
            qs = qs.replace("page=" + page, "");
        }

        model.addAttribute("products", products);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", prs.getTotalPages());
        model.addAttribute("queryString", qs);

        return "client/product/show-for-sell";
    }

    @PostMapping("/cancelOrder")
    public String cancelOrder(@RequestParam("orderId") long orderId, HttpSession session) {
        if (session.getAttribute("id") == null) {
            return "redirect:/login";
        }

        Optional<Order> orderOptional = this.orderServiceImpl.fetchOrderById(orderId);
        if (!orderOptional.isPresent()) {
            return "redirect:/order-history?error=OrderNotFound";
        }

        Order order = orderOptional.get();

        order.setStatus("CANCELLED");
        for (OrderDetail orderDetail : order.getOrderDetails()) {
            orderDetail.setStatus("CANCELLED");
        }

        this.orderServiceImpl.save(order);

        return "redirect:/order-history?success=OrderCancelled";
    }

}
