package vn.nguyenduy.comesticshop.service;

import java.awt.print.Pageable;
import java.util.List;
import java.util.Optional;
import org.springframework.data.domain.Page;
import vn.nguyenduy.comesticshop.domain.Order;
import vn.nguyenduy.comesticshop.domain.OrderDetail;
import vn.nguyenduy.comesticshop.domain.Shop;
import vn.nguyenduy.comesticshop.domain.User;

public interface OrderService {
  Page<Order> fetchAllOrders(Pageable pageable);

  Page<OrderDetail> fetchAllOrdersDetail(Pageable pageable);

  Optional<Order> fetchOrderById(long id);

  void deleteOrderById(long id);

  void updateOrder(Order order);

  List<Order> fetchOrderByUser(User user);

  Page<Order> fetchOrdersByShop(Shop shop, Pageable pageable);

  List<Order> getOrdersByShipperId(Long shipperId);

  List<Order> getDeliveredOrdersByShipper(Long shipperId);

  long countDeliveredOrdersByShipper(Long shipperId);

  long countPendingOrdersByShipper(Long shipperId);

  List<Object[]> getMonthlyRevenue(long shopId, int year);

  Optional<OrderDetail> findById(Long id);

  Page<OrderDetail> fetchOrdersByShopId(Long shopId, Pageable pageable);

  List<OrderDetail> findByOrderId(long orderId);

  void updateOrderDetail(OrderDetail orderDetail);

  void save(Order order);
}