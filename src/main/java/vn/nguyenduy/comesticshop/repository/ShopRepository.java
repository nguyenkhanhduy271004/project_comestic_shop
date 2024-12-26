package vn.nguyenduy.comesticshop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.nguyenduy.comesticshop.domain.Shop;
import vn.nguyenduy.comesticshop.domain.User;

@Repository
public interface ShopRepository extends JpaRepository<Shop, Long> {

    Shop findByOwner(User owner);

    Shop findById(long id);

    List<Shop> findAll();

    Page<Shop> findAll(Pageable pageable);

}
