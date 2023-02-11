package repository;

import entity.BookingDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;

@Repository
@Transactional
public interface BookingDetailRepository extends JpaRepository<BookingDetail,Integer> {
    BookingDetail findBookingDetailById(int bookingDeID);

    @Modifying
    @Query("delete from BookingDetail b where b.id = ?1")
    void CancelBooking( int bookingDeID);
}
