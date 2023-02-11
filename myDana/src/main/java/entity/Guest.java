package entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.Type;

import javax.persistence.*;

@Entity
@Table(name = "guest")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Guest {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    @Column(name = "full_name")
    private String full_name;
    @Column(name = "email")
    private String email;
    @Column(name = "phone_number")
    private String phone_number;
    @Column(name = "address")
    private String address;
    @Column(name = "address2")
    private String address2;
    @Column(name = "postcode")
    private int postcode;
    @Column(name = "numberOfpp")
    private int numberOfPeople;
    @Column(name = "extrainformation" ,columnDefinition = "text")
    @Type(type = "text")
    private String extrainformation;

    @OneToOne(mappedBy = "guest",cascade = CascadeType.ALL)
    private BookingDetail bookingDetail;

}
