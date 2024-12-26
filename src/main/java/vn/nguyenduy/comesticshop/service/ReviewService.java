package vn.nguyenduy.comesticshop.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import vn.nguyenduy.comesticshop.domain.Review;

import java.util.List;
import java.util.Optional;

public interface ReviewService {

  Optional<Review> findById(long reviewId);

  Review createReview(Review rv);

  void deleteById(long reviewId);

  Page<Review> getAllReviewsByProductId(long id, Pageable pageable);

  List<Review> getReviewsByProductId(Long productId);

  List<Review> getReviewsByProductIdAndRating(Long productId, int rating);
}
