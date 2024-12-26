package vn.nguyenduy.comesticshop.service;

import java.util.List;
import java.util.Optional;
import vn.nguyenduy.comesticshop.domain.Promotion;
import vn.nguyenduy.comesticshop.domain.Shop;

public interface PromotionService {

  List<Promotion> findAll();

  List<Promotion> getPromotionsByShop(Shop shop);

  void savePromotion(Promotion promotion);

  Optional<Promotion> getPromotionById(Long id);

  void deletePromotion(Long id);
}