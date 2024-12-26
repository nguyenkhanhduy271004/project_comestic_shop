package vn.nguyenduy.comesticshop.domain;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import jakarta.persistence.*;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.PositiveOrZero;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "products")
@Getter
@Setter
@ToString(exclude = { "reviews", "shop" })
public class Product implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotEmpty(message = "Name cannot be empty")
    private String name;

    @NotNull(message = "Price cannot be null")
    @PositiveOrZero(message = "Price cannot be negative")
    private double price;

    private String image;

    @NotNull
    @NotEmpty(message = "detailDesc không được để trống")
    @Column(columnDefinition = "MEDIUMTEXT")
    private String detailDesc;

    @NotEmpty(message = "Short description cannot be empty")
    private String shortDesc;

    @Min(value = 0, message = "Quantity cannot be negative")
    private long quantity;

    @PositiveOrZero(message = "Sold quantity cannot be negative")
    private long sold;

    private String factory;
    private String target;
    private long quantitySold;

    private LocalDate createDate;
    private int star;
    private int likes;

    @OneToMany(mappedBy = "product")
    @JsonManagedReference
    private List<Review> reviews;

    @ManyToOne
    @JoinColumn(name = "shop_id")
    private Shop shop;

    @Column(name = "discount_percentage")
    private Double discountPercentage;
}
