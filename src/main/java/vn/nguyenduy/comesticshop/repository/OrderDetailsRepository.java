package vn.nguyenduy.comesticshop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import vn.nguyenduy.comesticshop.domain.Order;
import vn.nguyenduy.comesticshop.domain.OrderDetail;
import vn.nguyenduy.comesticshop.domain.Product;

public interface OrderDetailsRepository extends JpaRepository<OrderDetail, Long> {

    Page<OrderDetail> findByOrder(Order order, Pageable pageable);

    Page<OrderDetail> findByProduct(Product product, Pageable pageable);

    Page<OrderDetail> findAll(Pageable pageable);

    @Query("SELECT o FROM OrderDetail o WHERE o.product.shop.id = :shopId")
    Page<OrderDetail> findByProductShopId(@Param("shopId") Long shopId, Pageable pageable);

    List<OrderDetail> findByOrderId(long orderId);

}
