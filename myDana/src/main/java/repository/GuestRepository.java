package repository;

import entity.Guest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;

@Repository
@Transactional

public interface GuestRepository extends JpaRepository<Guest,Integer> {
    @Modifying
    @Query("delete from Guest g where g.id = ?1")
    void CancelBooking( int GuestID);
}
