package entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "payment")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Payment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    @Column(name = "type_payment")
    private String type_payment;
    @Column(name = "cardNumber")
    private String cardNumber;
    @Column(name = "cardName")
    private String cardName;
    @Column(name = "amount")
    private long amount;
    @Column(name = "expressMonth")
    private int expressMonth;
    @Column(name = "expressYear")
    private long expressYear;

    @OneToMany(mappedBy = "payment_booking")
    private List<Booking> bookingList;




}
