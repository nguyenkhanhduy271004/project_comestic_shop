package vn.nguyenduy.comesticshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.nguyenduy.comesticshop.domain.Cart;
import vn.nguyenduy.comesticshop.domain.CartDetail;
import vn.nguyenduy.comesticshop.domain.Product;
import java.util.List;

@Repository
public interface CartDetailRepository extends JpaRepository<CartDetail, Long> {

    boolean existsByCartAndProduct(Cart cart, Product product);

    CartDetail findByCartAndProduct(Cart cart, Product product);

    List<CartDetail> findByCart(Cart cart);

    // List<CartDetail> findByShopId(Long shopId);

    List<CartDetail> findByCartId(Long shopId);

}
