package vn.nguyenduy.comesticshop.service;

import java.util.Optional;
import vn.nguyenduy.comesticshop.domain.CartDetail;

public interface CartDetailService {
  void save(CartDetail cartDetail);
  Optional<CartDetail> findById(long cartDetailId);
  void deleteById(long cartDetailId);
  double calculateTotalPriceForCart(Long cartId);
}