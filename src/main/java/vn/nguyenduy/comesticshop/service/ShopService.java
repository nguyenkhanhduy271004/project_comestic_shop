package vn.nguyenduy.comesticshop.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import vn.nguyenduy.comesticshop.domain.Shop;
import vn.nguyenduy.comesticshop.domain.User;

import java.io.IOException;
import java.util.List;

public interface ShopService {

  void saveShop(Shop shop);

  Shop findByOwner(User user);

  Shop findById(long shopId);

  List<Shop> findAll();

  Shop findById(Long shopId);

  void save(Shop shop);

  Page<Shop> getAllShops(int page, int size);

  Shop getShopById(Long id);

  void deleteShop(Long id);
}
