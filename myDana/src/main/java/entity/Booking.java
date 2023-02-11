package entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.Type;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "booking")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Booking {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    @Column(name = "date_check_in")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate date_check_in;
    @Column(name = "date_check_out")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate date_check_out;


    @Column(name = "externalID")
    private String externalID = UUID.randomUUID().toString();

    @ManyToOne
    @JoinColumn(name = "payment_id")
    private Payment payment_booking;

    @OneToMany(mappedBy = "booking",cascade = CascadeType.ALL)
    private List<BookingDetail> bookingDetailList;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user_booking;


}
