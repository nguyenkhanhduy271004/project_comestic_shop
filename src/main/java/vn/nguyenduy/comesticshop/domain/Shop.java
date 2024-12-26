package vn.nguyenduy.comesticshop.domain;

import jakarta.persistence.*;
import java.io.Serializable;
import java.util.List;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "shops")
@Getter
@Setter
@ToString(exclude = { "products", "orders", "owner", "carriers" })
public class Shop implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String description;
    private String logo;
    private String homepageContent;
    @Column(name = "active", nullable = false)
    private boolean active;
    @OneToOne
    private User owner;

    @OneToMany(mappedBy = "shop")
    private List<Product> products;

    @OneToMany(mappedBy = "shop")
    private List<Order> orders;

    @ManyToMany
    @JoinTable(name = "shop_carriers", joinColumns = @JoinColumn(name = "shop_id"), inverseJoinColumns = @JoinColumn(name = "carrier_id"))
    private List<Carrier> carriers;

}
