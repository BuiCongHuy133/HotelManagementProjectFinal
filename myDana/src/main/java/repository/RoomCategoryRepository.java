package repository;

import entity.Room;
import entity.RoomCategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

@Repository
public interface RoomCategoryRepository extends JpaRepository<RoomCategory,Integer> {
    RoomCategory findById(int id);

    @Query(value = "select r from RoomCategory r where r.name like %?1% and r.roomStatus = 1")
    List<RoomCategory> findByDatesBetween(String searchKey);

    @Query(value = "select r from RoomCategory r where r.quantity > 0 and r.roomStatus = 1 ")
    List<RoomCategory> findAvailableRooms();

    @Modifying
    @Transactional
    @Query("update RoomCategory r set r.quantity = ?1 where r.id = ?2")
    void Quantity(int quantity,int id);

}
