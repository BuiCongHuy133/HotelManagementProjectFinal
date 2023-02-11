package service;

import entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.*;

import javax.transaction.Transactional;
import java.util.List;
import java.util.UUID;

@Service(value = "bookingService")
public class BookingServiceImpl implements BookingService{
    @Autowired
    BookingRepository bookingRepository;
    @Autowired
    CouponRepository couponRepository;
    @Autowired
    PaymentRepository paymentRepository;
    @Autowired
    BookingDetailRepository bookingDetailRepository;
    @Autowired
    GuestRepository guestRepository;
    @Override
    public List<BookingDetail> getAllBookingInfo(){
        return bookingDetailRepository.findAll();
    }
    @Override
    @Transactional
    public Booking saveBooking(Booking booking){
        return (Booking) bookingRepository.save(booking);
    }
    @Override
    @Transactional
    public BookingDetail searchBooking(String searchKey){
        return new BookingDetail();
    }
    @Override
    public Booking getBookingById(int id){
        return (Booking) bookingRepository.findById(id).get();
    }

    @Override
    public List<Booking> getBookingByUserId(int id) {
        return (List<Booking>) bookingRepository.findBookingsByUserId(id);
    }

    @Override
    public List<Coupon> getListCoupon(){
        return (List<Coupon>) couponRepository.findAll();
    }
//    @Override
//    public List<PaymentServiceImpl> getListPayment(){
//        return (List<PaymentServiceImpl>) paymentRepository.findAll();
//    }
    @Override
    public Guest getGuest(int id){
        return (Guest) guestRepository.findById(id).get();
    }

    @Override
    public Booking searchBookingByExternalID(String Uuid) {
        return bookingRepository.findByExternalID(Uuid);
    }

    @Override
    public void BookingPay(Payment payment, int bookingID) {
        bookingRepository.BookingPay(payment,bookingID);
    }

    @Override
    public void cancelBooking(int bookingID) {
        bookingRepository.CancelBooking(bookingID);
    }


}
