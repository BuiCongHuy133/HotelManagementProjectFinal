package service;

import entity.BookingDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.BookingDetailRepository;

import javax.transaction.Transactional;

@Service(value = "bookingDetailService")
public class BookingDetailServiceImpl implements BookingDetailService {
    @Autowired
    private BookingDetailRepository bookingDetailRepository;

    @Override
    @Transactional
    public BookingDetail saveBooking(BookingDetail bookingDetail) {
        return (BookingDetail) bookingDetailRepository.save(bookingDetail);
    }

    @Override
    public BookingDetail findBookingDetailById(int bookingDeID) {
        return bookingDetailRepository.findBookingDetailById(bookingDeID);
    }

    @Override
    public void cancelBooking(int bookingDeID) {
        bookingDetailRepository.CancelBooking(bookingDeID);
    }

}
