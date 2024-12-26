package vn.nguyenduy.comesticshop.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.nguyenduy.comesticshop.domain.CartDetail;
import vn.nguyenduy.comesticshop.repository.CartDetailRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import vn.nguyenduy.comesticshop.service.CartDetailService;

@Service
public class CartDetailServiceImpl implements CartDetailService {

    private static final Logger logger = LoggerFactory.getLogger(CartDetailServiceImpl.class);

    @Autowired
    private CartDetailRepository cartDetailRepository;

    public void save(CartDetail cartDetail) {
        logger.info("Saving cart detail: {}", cartDetail);
        cartDetailRepository.save(cartDetail);
    }

    public Optional<CartDetail> findById(long cartDetailId) {
        logger.info("Finding cart detail with id: {}", cartDetailId);
        return cartDetailRepository.findById(cartDetailId);
    }

    public void deleteById(long cartDetailId) {
        logger.info("Deleting cart detail with id: {}", cartDetailId);
        cartDetailRepository.deleteById(cartDetailId);
    }

    public double calculateTotalPriceForCart(Long cartId) {
        List<CartDetail> cartDetails = cartDetailRepository.findByCartId(cartId);

        return cartDetails.stream()
                .mapToDouble(cartDetail -> cartDetail.getPrice() * cartDetail.getQuantity())
                .sum();
    }

}
