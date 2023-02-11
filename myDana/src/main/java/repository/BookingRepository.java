package repository;

import entity.Booking;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import entity.Payment;

import javax.transaction.Transactional;
import java.util.List;
import java.util.UUID;

@Repository
@Transactional
public interface BookingRepository extends JpaRepository<Booking,Integer> {
    @Query(value = "select * from booking where user_id = ?1", nativeQuery = true)
    List<Booking> findBookingsByUserId(int id);

    Booking findByExternalID(String uuid);

    @Modifying
    @Query("update Booking b set b.payment_booking = ?1 where b.id = ?2")
    void BookingPay(Payment payment, int bookingID);

    @Modifying
    @Query("delete from Booking b where b.id = ?1")
    void CancelBooking( int bookingID);

}
