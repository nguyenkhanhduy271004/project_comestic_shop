package vn.nguyenduy.comesticshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import vn.nguyenduy.comesticshop.domain.Promotion;
import vn.nguyenduy.comesticshop.domain.Shop;
import java.util.List;

public interface PromotionRepository extends JpaRepository<Promotion, Long> {

    List<Promotion> findAll();

    List<Promotion> findByShop(Shop shop);
}
