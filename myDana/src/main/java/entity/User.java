package entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "user")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    @Column(name = "username")
    private String username;
    @Column(name = "password")
    private String password;
    @Column(name = "phone_number")
    private String phone_number;
    @Column(name = "address")
    private String address;
    @Column(name = "email")
    private String email;

    @Column(name = "enabled")
    private int enabled = 1;
    @OneToMany(mappedBy = "user_booking")
    private List<Booking> bookingList;


}
