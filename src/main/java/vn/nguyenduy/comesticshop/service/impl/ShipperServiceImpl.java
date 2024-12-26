package vn.nguyenduy.comesticshop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.nguyenduy.comesticshop.domain.Shipper;
import vn.nguyenduy.comesticshop.repository.ShipperRepository;
import vn.nguyenduy.comesticshop.service.ShipperService;

@Service
public class ShipperServiceImpl implements ShipperService {

    @Autowired
    private ShipperRepository shipperRepository;

    public List<Shipper> getAllShippers() {
        return this.shipperRepository.findAll();
    }

    public Shipper getShipperById(Long id) {
        return this.shipperRepository.findById(id).orElse(null);
    }

}
