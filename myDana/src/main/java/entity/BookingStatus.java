package entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "booking_status")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class BookingStatus {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    @Column(name = "value")
    private String value;
    @OneToMany(mappedBy = "bookingStatus")
    private List<BookingDetail> bookingDetailList;



}
