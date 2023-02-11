package entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "service")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Service {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    @Column(name = "name")
    private String name;
    @Column(name = "description",columnDefinition ="text" )
    @Type(type = "text")
    private String description;
    @Column(name = "price")
    private int price;
    @Column(name = "img")
    private String img;
    @ManyToMany
    @JoinTable(
            name = "booking_detail_service",
            joinColumns = @JoinColumn(name = "booking_detail_id"),
            inverseJoinColumns = @JoinColumn(name = "service_id")
    )
    private List<BookingDetail> bookingDetailList;


}