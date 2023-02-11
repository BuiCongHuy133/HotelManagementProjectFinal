package service;

import entity.Destination;
import entity.Room;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.DestinationRepository;

import java.util.List;


@Service(value = "destinationService")
public class DestinationServiceImpl implements DestinationService{
    @Autowired
    private DestinationRepository destinationRepository;

    @Override
    public Destination getDestination() {
        return (Destination) destinationRepository.findById(1);
    }
}
