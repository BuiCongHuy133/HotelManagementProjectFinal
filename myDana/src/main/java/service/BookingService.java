package service;

import entity.*;

import java.util.List;
import java.util.UUID;

public interface BookingService {
    List<BookingDetail> getAllBookingInfo();
    Booking saveBooking(Booking booking);
    BookingDetail searchBooking(String searchKey);
    Booking getBookingById(int id);
    List<Booking> getBookingByUserId(int id);
//    List<PaymentServiceImpl> getListPayment();
    List<Coupon> getListCoupon();
    Guest getGuest(int id);

    Booking searchBookingByExternalID(String Uuid);
    void BookingPay(Payment payment, int bookingID);
    void cancelBooking(int bookingID);
}
