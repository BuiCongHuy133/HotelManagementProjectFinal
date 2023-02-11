package entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.Type;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "room_category")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class RoomCategory {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    @Column(name = "name")
    private String name;
    @Column(name = "quantity")
    private int quantity;
    @Column(name = "description", columnDefinition = "text")
    @Type(type = "text")
    private String description;
    @Column(name = "description2", columnDefinition = "text")
    @Type(type = "text")
    private String description2;
    @Column(name = "img")
    private String img;
    @Column(name = "price")
    private long price;
    @Column(name = "fromDate")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate fromDate;
    @Column(name = "toDate")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate toDate;
    @Column(name = "numberOfpp" )
    private int numberOfpp;

    @OneToMany(mappedBy = "roomCategory2")
    private List<Room> roomList2;
    @OneToMany(mappedBy = "roomCategory")
    private List<BookingDetail> bookingDetails;

    @OneToMany(mappedBy = "roomCategory")
    private List<File> files;

    @ManyToOne
    @JoinColumn(name = "room_status_id")
    private RoomStatus roomStatus;
}
