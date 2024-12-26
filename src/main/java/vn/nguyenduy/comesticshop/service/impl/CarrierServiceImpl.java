package vn.nguyenduy.comesticshop.service.impl;

import vn.nguyenduy.comesticshop.domain.Carrier;
import vn.nguyenduy.comesticshop.repository.CarrierRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import vn.nguyenduy.comesticshop.service.CarrierService;

@Service
public class CarrierServiceImpl implements CarrierService {

    @Autowired
    private CarrierRepository carrierRepository;

    public List<Carrier> getAllCarriers() {
        return carrierRepository.findAll();
    }

    public List<Carrier> findByIds(List<Long> carrierIds) {
        return carrierRepository.findAllById(carrierIds);
    }

    public Carrier saveCarrier(Carrier carrier) {
        return carrierRepository.save(carrier);
    }

    public Carrier updateCarrier(Long id, Carrier carrierDetails) {
        Carrier carrier = carrierRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Carrier not found"));

        carrier.setName(carrierDetails.getName());
        carrier.setShippingFee(carrierDetails.getShippingFee());
        return carrierRepository.save(carrier);
    }

    public void deleteCarrier(Long id) {
        carrierRepository.deleteById(id);
    }

}
