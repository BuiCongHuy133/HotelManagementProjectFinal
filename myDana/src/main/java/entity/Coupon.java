package entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "coupon")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Coupon {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    @Column(name = "name")
    private String coupon_name;
    @Column(name = "description")
    private String coupon_description;
    @Column(name = "date_start")
    private Date date_start;
    @Column(name = "date_expired")
    private Date date_expired;
    @Column(name = "discount_percent")
    private double discount_percent;
    @Column(name = "quantity")
    private int quantity;


}
