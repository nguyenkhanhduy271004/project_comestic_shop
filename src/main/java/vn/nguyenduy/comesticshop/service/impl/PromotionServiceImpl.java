package vn.nguyenduy.comesticshop.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.nguyenduy.comesticshop.domain.Promotion;
import vn.nguyenduy.comesticshop.domain.Shop;
import vn.nguyenduy.comesticshop.repository.PromotionRepository;

import java.util.List;
import java.util.Optional;
import vn.nguyenduy.comesticshop.service.PromotionService;

@Service
public class PromotionServiceImpl implements PromotionService {

    @Autowired
    private PromotionRepository promotionRepository;

    public List<Promotion> findAll() {
        return promotionRepository.findAll();
    }

    public List<Promotion> getPromotionsByShop(Shop shop) {
        return promotionRepository.findByShop(shop);
    }

    public void savePromotion(Promotion promotion) {
        promotionRepository.save(promotion);
    }

    public Optional<Promotion> getPromotionById(Long id) {
        return promotionRepository.findById(id);
    }

    public void deletePromotion(Long id) {
        promotionRepository.deleteById(id);
    }
}
