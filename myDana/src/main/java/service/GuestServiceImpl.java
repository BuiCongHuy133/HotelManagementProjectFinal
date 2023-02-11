package service;

import entity.Guest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.GuestRepository;

import javax.transaction.Transactional;

@Service(value = "guestService")
public class GuestServiceImpl implements GuestService{
    @Autowired
    private GuestRepository guestRepository;

    @Override
    @Transactional
    public Guest saveGuest(Guest guest) {
        return (Guest) guestRepository.save(guest);
    }

    @Override
    public void cancelBooking(int GuestID) {
        guestRepository.CancelBooking(GuestID);
    }
}
