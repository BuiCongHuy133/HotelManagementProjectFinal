package repository;

import entity.Room;
import entity.RoomCategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoomRepository extends JpaRepository<Room,Integer> {
    @Query(
            value = "select *from room " +
                    "join room_category on room.room_category_id = room_category.id " +
                    "join room_status on room.room_status_id = room_status.id " +
                    "where room_category.name like ?1 " +
                    "or room_status.value like ?1 " +
                    "or room.price like ?1", nativeQuery = true
    )
    List<Room> getAllRoomBySearchKey(String searchKey);
    @Query(
            value = "select count(id) from room",nativeQuery = true
    )
    void countTotalRoom();
    @Query(
            value = "update room set " +
                    "name like ?1, " +
                    "price like ?2, " +
                    "description like ?3, " +
                    "img_list like ?4, " +
                    "img like ?5, " +
                    "room_status_id like ?6", nativeQuery = true
    )
    void updateRoom(String name, int price, String description, String img_list, String img, int roomStatus);
    @Query(value = "select *from room " +
            "inner join room_category " +
            "on room.room_category_id = room_category.id " +
            "where room.name like ?1 " +
            "or room_category.name like ?1",nativeQuery = true)
    List<Room> getAllRoomByNameOrCategoryName(String searchKey);

    @Query(value = "select *from room " +
            "inner join room_status " +
            "on room.room_status_id = room_status.id " +
            "where room.name like %?1% " +
            "or room_status.value like %?1%",nativeQuery = true)
    List<Room> searchRoomNameorAvailableRoom(String searchKey);



}
