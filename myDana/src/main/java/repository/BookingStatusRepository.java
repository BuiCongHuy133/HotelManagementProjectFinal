package repository;

import entity.BookingStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BookingStatusRepository extends JpaRepository<BookingStatus,Integer> {
}
