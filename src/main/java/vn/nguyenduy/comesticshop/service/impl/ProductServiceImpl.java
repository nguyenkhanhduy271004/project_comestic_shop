package vn.nguyenduy.comesticshop.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;
import vn.nguyenduy.comesticshop.domain.Cart;
import vn.nguyenduy.comesticshop.domain.CartDetail;
import vn.nguyenduy.comesticshop.domain.Order;
import vn.nguyenduy.comesticshop.domain.OrderDetail;
import vn.nguyenduy.comesticshop.domain.Product;
import vn.nguyenduy.comesticshop.domain.Promotion;
import vn.nguyenduy.comesticshop.domain.Shop;
import vn.nguyenduy.comesticshop.domain.User;
import vn.nguyenduy.comesticshop.domain.dto.ProductCriteriaDTO;
import vn.nguyenduy.comesticshop.repository.CartDetailRepository;
import vn.nguyenduy.comesticshop.repository.CartRepository;
import vn.nguyenduy.comesticshop.repository.OrderDetailsRepository;
import vn.nguyenduy.comesticshop.repository.OrderRepository;
import vn.nguyenduy.comesticshop.repository.ProductRepository;
import vn.nguyenduy.comesticshop.service.ProductService;
import vn.nguyenduy.comesticshop.service.specification.ProductSpecs;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private CartRepository cartRepository;
    @Autowired
    private CartDetailRepository cartDetailRepository;
    @Autowired
    private UserServiceImpl userServiceImpl;
    @Autowired
    private OrderRepository orderRepository;
    @Autowired
    private OrderDetailsRepository orderDetailRepository;
    @Autowired
    private PromotionServiceImpl promotionServiceImpl;

    public ProductServiceImpl(
            ProductRepository productRepository,
            CartRepository cartRepository,
            CartDetailRepository cartDetailRepository,
            UserServiceImpl userServiceImpl,
            OrderRepository orderRepository,
            OrderDetailsRepository orderDetailRepository) {
        this.productRepository = productRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.userServiceImpl = userServiceImpl;
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }

    public Product createProduct(Product pr) {
        return this.productRepository.save(pr);
    }

    public Page<Product> fetchProducts(Pageable page) {
        return this.productRepository.findAll(page);
    }

    public List<Product> fetchTopSellingProducts(int page, int limit) {
        return productRepository.findAllByOrderByQuantitySoldDesc(PageRequest.of(page, limit)).getContent();
    }

    public Page<Product> fetchProductsWithSpec(Pageable page, ProductCriteriaDTO productCriteriaDTO) {
        if (productCriteriaDTO.getTarget() == null
                && productCriteriaDTO.getFactory() == null
                && productCriteriaDTO.getPrice() == null) {
            return this.productRepository.findAll(page);
        }

        Specification<Product> combinedSpec = Specification.where(null);

        if (productCriteriaDTO.getTarget() != null && productCriteriaDTO.getTarget().isPresent()) {
            Specification<Product> currentSpecs = ProductSpecs.matchListTarget(productCriteriaDTO.getTarget().get());
            combinedSpec = combinedSpec.and(currentSpecs);
        }
        if (productCriteriaDTO.getFactory() != null && productCriteriaDTO.getFactory().isPresent()) {
            Specification<Product> currentSpecs = ProductSpecs.matchListFactory(productCriteriaDTO.getFactory().get());
            combinedSpec = combinedSpec.and(currentSpecs);
        }

        if (productCriteriaDTO.getPrice() != null && productCriteriaDTO.getPrice().isPresent()) {
            Specification<Product> currentSpecs = this.buildPriceSpecification(productCriteriaDTO.getPrice().get());
            combinedSpec = combinedSpec.and(currentSpecs);
        }

        return this.productRepository.findAll(combinedSpec, page);
    }

    // case 6
    public Specification<Product> buildPriceSpecification(List<String> price) {
        Specification<Product> combinedSpec = Specification.where(null); // disconjunction
        for (String p : price) {
            double min = 0;
            double max = 0;

            // Set the appropriate min and max based on the price range string
            switch (p) {
                case "duoi-500":
                    min = 1;
                    max = 500000;
                    break;
                case "500-1-trieu":
                    min = 500000;
                    max = 1000000;
                    break;
                case "1-3-trieu":
                    min = 1000000;
                    max = 3000000;
                    break;
                case "tren-3-trieu":
                    min = 3000000;
                    max = 100000000;
                    break;
            }

            if (min != 0 && max != 0) {
                Specification<Product> rangeSpec = ProductSpecs.matchMultiplePrice(min, max);
                combinedSpec = combinedSpec.or(rangeSpec);
            }
        }

        return combinedSpec;
    }

    public List<Product> searchProducts(String query, int page, int size, String criteria, List<String> factories,
            List<String> targets, List<String> priceRange, String sort) {
        Pageable pageable;

        if ("best_seller".equals(criteria)) {
            pageable = PageRequest.of(page - 1, size, Sort.by("quantitySold").descending());
        } else if ("new".equals(criteria)) {
            pageable = PageRequest.of(page - 1, size, Sort.by("createDate").descending());
        } else if ("evaluate".equals(criteria)) {
            pageable = PageRequest.of(page - 1, size, Sort.by("star").descending());
        } else if ("favorite".equals(criteria)) {
            pageable = PageRequest.of(page - 1, size, Sort.by("likes").descending());
        } else {
            pageable = PageRequest.of(page - 1, size);
        }

        Page<Product> filteredProducts = productRepository.findByNameContainingIgnoreCase(query, pageable);

        List<Product> products = filteredProducts.getContent();

        if (factories != null && !factories.isEmpty()) {
            products = products.stream()
                    .filter(product -> factories.contains(product.getFactory()))
                    .toList();
        }

        if (targets != null && !targets.isEmpty()) {
            products = products.stream()
                    .filter(product -> targets.contains(product.getTarget()))
                    .toList();
        }

        if (priceRange != null && !priceRange.isEmpty()) {
            for (String range : priceRange) {
                double minPrice = 0;
                double maxPrice = 0;

                switch (range) {
                    case "duoi-500":
                        minPrice = 1;
                        maxPrice = 500000;
                        break;
                    case "500-1-trieu":
                        minPrice = 500000;
                        maxPrice = 1000000;
                        break;
                    case "1-3-trieu":
                        minPrice = 1000000;
                        maxPrice = 3000000;
                        break;
                    case "tren-3-trieu":
                        minPrice = 3000000;
                        maxPrice = 100000000;
                        break;
                    default:
                        // Handle invalid range or do nothing
                        continue;
                }

                // Filter products based on price range
                final double min = minPrice;
                final double max = maxPrice;

                products = products.stream()
                        .filter(product -> product.getPrice() >= min && product.getPrice() <= max)
                        .toList();
            }
        }

        return products;
    }

    public Optional<Product> fetchProductById(long id) {
        return this.productRepository.findById(id);
    }

    public void deleteProduct(long id) {
        this.productRepository.deleteById(id);
    }

    public void handleAddProductToCart(String email, long productId, HttpSession session, long quantity) {

        User user = this.userServiceImpl.getUserByEmail(email);
        if (user != null) {
            Cart cart = this.cartRepository.findByUser(user);

            if (cart == null) {
                // Tạo mới cart
                Cart otherCart = new Cart();
                otherCart.setUser(user);
                otherCart.setSum(0);

                cart = this.cartRepository.save(otherCart);
            }

            Optional<Product> productOptional = this.productRepository.findById(productId);
            if (productOptional.isPresent()) {
                Product realProduct = productOptional.get();

                CartDetail oldDetail = this.cartDetailRepository.findByCartAndProduct(cart, realProduct);

                if (oldDetail == null) {
                    CartDetail cd = new CartDetail();
                    cd.setCart(cart);
                    cd.setProduct(realProduct);
                    cd.setPrice(realProduct.getPrice());
                    cd.setQuantity(quantity);
                    this.cartDetailRepository.save(cd);

                    int newSum = cart.getSum() + (int) quantity;
                    cart.setSum(newSum);
                    this.cartRepository.save(cart);
                    session.setAttribute("sum", newSum);
                } else {
                    oldDetail.setQuantity(oldDetail.getQuantity() + quantity);
                    this.cartDetailRepository.save(oldDetail);
                }

                realProduct.setQuantity(realProduct.getQuantity() - quantity);
                realProduct.setQuantitySold(realProduct.getQuantitySold() + quantity);

                this.productRepository.save(realProduct);
            }
        }
    }

    public Cart fetchByUser(User user) {
        return this.cartRepository.findByUser(user);
    }

    public void handleRemoveCartDetail(long cartDetailId, HttpSession session) {
        Optional<CartDetail> cartDetailOptional = this.cartDetailRepository.findById(cartDetailId);
        if (cartDetailOptional.isPresent()) {
            CartDetail cartDetail = cartDetailOptional.get();

            Cart currentCart = cartDetail.getCart();
            // delete cart-detail
            this.cartDetailRepository.deleteById(cartDetailId);

            // update cart
            if (currentCart.getSum() > 1) {
                // update current cart
                int s = currentCart.getSum() - 1;
                currentCart.setSum(s);
                session.setAttribute("sum", s);
                this.cartRepository.save(currentCart);
            } else {
                // delete cart (sum = 1)
                this.cartRepository.deleteById(currentCart.getId());
                session.setAttribute("sum", 0);
            }
        }
    }

    public void handleUpdateCartBeforeCheckout(List<CartDetail> cartDetails) {
        for (CartDetail cartDetail : cartDetails) {
            Optional<CartDetail> cdOptional = this.cartDetailRepository.findById(cartDetail.getId());
            if (cdOptional.isPresent()) {
                CartDetail currentCartDetail = cdOptional.get();
                currentCartDetail.setQuantity(cartDetail.getQuantity());
                this.cartDetailRepository.save(currentCartDetail);
            }
        }
    }

    public void handlePlaceOrder(
            User user, HttpSession session,
            String receiverName, String receiverAddress, String receiverPhone, String paymentMethod,
            double totalShippingFee, Long promotionId) {

        Cart cart = this.cartRepository.findByUser(user);
        if (cart != null) {
            List<CartDetail> cartDetails = cart.getCartDetails();

            if (cartDetails != null) {

                Order order = new Order();

                Optional<Promotion> promotion = Optional.empty();
                if (promotionId != null && promotionId != 0) {
                    promotion = promotionServiceImpl.getPromotionById(promotionId);
                }

                if (promotion.isPresent()) {
                    order.setPromotion(promotion.get());
                }

                order.setUser(user);
                order.setReceiverName(receiverName);
                order.setReceiverAddress(receiverAddress);
                order.setReceiverPhone(receiverPhone);
                order.setStatus("PENDING");
                order.setPaymentMethod(paymentMethod);

                double sum = 0;
                for (CartDetail cd : cartDetails) {
                    Double discountPercentage = cd.getProduct().getDiscountPercentage();
                    if (discountPercentage != null && discountPercentage > 0) {
                        sum += (cd.getPrice() * (1 - discountPercentage / 100)) * cd.getQuantity();
                    } else {
                        sum += cd.getPrice() * cd.getQuantity();
                    }
                }

                if (promotion.isPresent()) {
                    sum -= (sum * promotion.get().getDiscountRate()) / 100;
                }
                sum += totalShippingFee;
                order.setTotalPrice(sum);
                order = this.orderRepository.save(order);

                for (CartDetail cd : cartDetails) {
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setOrder(order);
                    orderDetail.setProduct(cd.getProduct());
                    orderDetail.setPrice(cd.getPrice());
                    orderDetail.setQuantity(cd.getQuantity());
                    orderDetail.setStatus("PENDING");
                    // Product product =
                    // this.productRepository.findById(cd.getProduct().getId()).get();
                    // product.setQuantity(product.getQuantity() - cd.getQuantity());
                    // this.productRepository.save(product);
                    this.orderDetailRepository.save(orderDetail);
                }

                for (CartDetail cd : cartDetails) {
                    this.cartDetailRepository.deleteById(cd.getId());
                }

                this.cartRepository.deleteById(cart.getId());

                session.setAttribute("sum", 0);
            }
        }
    }

    public List<Product> searchProductsByName(String name, int page, int size) {
        Page<Product> productPage = productRepository.findByNameContainingIgnoreCase(name, PageRequest.of(page, size));
        return productPage.getContent();
    }

    public Page<Product> fetchProductsByShop(Shop shop, Pageable pageable) {
        return productRepository.findByShop(shop, pageable);
    }

    public void saveProduct(Product product) {
        this.productRepository.save(product);
    }

}
