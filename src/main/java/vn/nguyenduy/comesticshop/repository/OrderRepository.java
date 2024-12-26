package vn.nguyenduy.comesticshop.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import vn.nguyenduy.comesticshop.domain.Order;
import vn.nguyenduy.comesticshop.domain.Shop;
import vn.nguyenduy.comesticshop.domain.User;

import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    List<Order> findByUser(User user);

    Page<Order> findAll(Pageable pageable);

    Page<Order> findByShop(Shop shop, Pageable pageable);

    List<Order> findByShipperId(Long shipperId);

    List<Order> findByShipperIdAndStatus(Long shipperId, String status);

    List<Order> getOrdersByShipperId(Long shipperId);

    // List<Order> getDeliveredOrdersByShipper(Long shipperId);

    long countByShipperIdAndStatus(Long shipperId, String status);

    @Query("SELECT MONTH(o.orderDate) AS month, SUM(o.totalPrice) FROM Order o " +
            "WHERE o.shop.id = :shopId " +
            "AND YEAR(o.orderDate) = :year " +
            "GROUP BY MONTH(o.orderDate)")
    List<Object[]> findMonthlyRevenueByShopId(long shopId, int year);

}
