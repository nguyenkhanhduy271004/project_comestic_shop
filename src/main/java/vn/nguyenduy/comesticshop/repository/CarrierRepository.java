package vn.nguyenduy.comesticshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.nguyenduy.comesticshop.domain.Carrier;

@Repository
public interface CarrierRepository extends JpaRepository<Carrier, Long> {
}
