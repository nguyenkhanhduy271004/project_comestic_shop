package vn.nguyenduy.comesticshop.domain.dto;

import java.util.List;

import vn.nguyenduy.comesticshop.domain.Review;

public class ReviewsResponse {

    private List<Review> reviews;

    // Constructor
    public ReviewsResponse(List<Review> reviews) {
        this.reviews = reviews;
    }

    // Getter and Setter
    public List<Review> getReviews() {
        return reviews;
    }

    public void setReviews(List<Review> reviews) {
        this.reviews = reviews;
    }
}