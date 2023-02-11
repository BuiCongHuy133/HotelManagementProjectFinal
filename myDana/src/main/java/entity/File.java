package entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "file")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class File {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;
    @Lob
    @Column(columnDefinition = "LONGBLOB")
    private byte[] content;
    private String type;
    @ManyToOne
    @JoinColumn(name = "room_category_id")
    private RoomCategory roomCategory;


}

