package vn.nguyenduy.comesticshop.domain;

import jakarta.persistence.*;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "promotions")
@Getter
@Setter
@ToString(exclude = { "shop", "cart", "orders" })
public class Promotion implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "shop_id", nullable = true)
    private Shop shop;

    @ManyToOne
    @JoinColumn(name = "cart_id")
    private Cart cart;

    private String name;
    private String description;
    private Double discountRate;
    private LocalDate startDate;
    private LocalDate endDate;

    @OneToMany(mappedBy = "promotion")
    private List<Order> orders;
}
