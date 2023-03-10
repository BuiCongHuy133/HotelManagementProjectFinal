package entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class BookingRegistation {

    private Booking booking;
    private BookingDetail bookingDetail;
    private Guest guest;
    private Integer userID;
}
