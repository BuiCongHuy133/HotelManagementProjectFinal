package repository;

import entity.Payment;
import entity.RoomCategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.time.LocalDate;
import java.util.List;

@Repository
@Transactional
public interface PaymentRepository extends JpaRepository<Payment,Integer> {
    @Query("select p from Payment p " +
            "where p.type_payment = ?1 and p.cardName = ?2 and p.cardNumber = ?3 and p.expressMonth = ?4 and p.expressYear = ?5 and p.amount > ?6")
    Payment CompareCardPayment(String type_payment, String cardName, String cardNumber,int expressMonth,long expressYear,long amount);
    @Modifying
    @Query("update Payment p set p.amount = p.amount - ?1 where p.id = ?2")
    void Pay(long amount, int id);

    @Modifying
    @Query("update Payment p set p.amount = p.amount + ?1 where p.id = ?2")
    void Refund(long amount,int id);
}
