package vn.nguyenduy.comesticshop.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import vn.nguyenduy.comesticshop.domain.Review;

@Repository
public interface ReviewRepository extends JpaRepository<Review, Long>, JpaSpecificationExecutor<Review> {
    Review save(Review rv);

    void deleteById(long id);

    Optional<Review> findById(long id);

    List<Review> findAll();

    Page<Review> findAllByProductId(Long productId, Pageable pageable);

    List<Review> findByProductId(Long productId);

    List<Review> findByProductIdAndRating(Long productId, int rating);
}
