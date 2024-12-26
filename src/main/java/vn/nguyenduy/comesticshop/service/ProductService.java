package vn.nguyenduy.comesticshop.service;

import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import vn.nguyenduy.comesticshop.domain.Cart;
import vn.nguyenduy.comesticshop.domain.CartDetail;
import vn.nguyenduy.comesticshop.domain.Product;
import vn.nguyenduy.comesticshop.domain.Shop;
import vn.nguyenduy.comesticshop.domain.User;
import vn.nguyenduy.comesticshop.domain.dto.ProductCriteriaDTO;

public interface ProductService {
  Product createProduct(Product pr);
  Page<Product> fetchProducts(Pageable page);
  List<Product> fetchTopSellingProducts(int page, int limit);
  Page<Product> fetchProductsWithSpec(Pageable page, ProductCriteriaDTO productCriteriaDTO);
  Optional<Product> fetchProductById(long id);
  void deleteProduct(long id);
  void handleAddProductToCart(String email, long productId, HttpSession session, long quantity);
  Cart fetchByUser(User user);
  void handleRemoveCartDetail(long cartDetailId, HttpSession session);
  void handleUpdateCartBeforeCheckout(List<CartDetail> cartDetails);
  void handlePlaceOrder(User user, HttpSession session, String receiverName, String receiverAddress, String receiverPhone, String paymentMethod, double totalShippingFee, Long promotionId);
  List<Product> searchProducts(String query, int page, int size, String criteria, List<String> factories, List<String> targets, List<String> priceRange, String sort);
  Page<Product> fetchProductsByShop(Shop shop, Pageable pageable);
  void saveProduct(Product product);
}