package vn.nguyenduy.comesticshop.service;

import java.util.List;
import vn.nguyenduy.comesticshop.domain.Carrier;

public interface CarrierService {
  List<Carrier> getAllCarriers();
  List<Carrier> findByIds(List<Long> carrierIds);
  Carrier saveCarrier(Carrier carrier);
  Carrier updateCarrier(Long id, Carrier carrierDetails);
  void deleteCarrier(Long id);
}