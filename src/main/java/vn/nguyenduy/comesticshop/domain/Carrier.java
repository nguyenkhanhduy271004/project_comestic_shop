package vn.nguyenduy.comesticshop.domain;

import jakarta.persistence.*;
import java.util.List;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "carriers")
@Getter
@Setter
public class Carrier {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "shipping_fee")
    private Double shippingFee;

    @ManyToMany(mappedBy = "carriers")
    private List<Shop> shops;
}
