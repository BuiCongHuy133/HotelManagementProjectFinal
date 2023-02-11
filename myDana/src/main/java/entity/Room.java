package entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "room")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Room {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    @Column(name = "name")
    private String name;
    @Column(name = "description")
    private String description;
    @Column(name = "img_list")
    private String img_list;
    @Column(name = "img")
    private String img;
    @ManyToOne
    @JoinColumn(name = "room_category_id")
    private RoomCategory roomCategory2;
    @ManyToOne
    @JoinColumn(name = "room_status_id")
    private RoomStatus roomStatus;

}
