package service;

import entity.Guest;

public interface GuestService {
    Guest saveGuest(Guest guest);

    void cancelBooking(int GuestID);

}
