package vn.nguyenduy.comesticshop.service;

import java.util.List;
import vn.nguyenduy.comesticshop.domain.Shipper;

public interface ShipperService {

  List<Shipper> getAllShippers();

  Shipper getShipperById(Long id);
}