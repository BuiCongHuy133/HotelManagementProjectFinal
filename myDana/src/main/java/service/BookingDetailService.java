package service;

import entity.BookingDetail;

public interface BookingDetailService {
    BookingDetail saveBooking(BookingDetail bookingDetail);
    BookingDetail findBookingDetailById(int bookingDeID);
    void cancelBooking(int bookingDeID);

}
