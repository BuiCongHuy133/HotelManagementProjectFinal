package service;

import entity.RoomCategory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.RoomCategoryRepository;

import java.time.LocalDate;
import java.util.List;

@Service("roomCategoryService")
public class RoomCategoryServiceImpl implements RoomCategoryService {
    @Autowired
    private RoomCategoryRepository roomCategoryRepository;

    @Override
    public List<RoomCategory> getAllRoomCategory() {
        return roomCategoryRepository.findAll();
    }
    public List<RoomCategory> getAllRoomAvailable() {
        return roomCategoryRepository.findAvailableRooms();
    }

    @Override
    public void Quantity(int quantity, int id) {
        roomCategoryRepository.Quantity(quantity,id);
    }

    @Override
    public RoomCategory getRoomCateById(int id) {
        return roomCategoryRepository.findById(id);
    }

    @Override
    public List<RoomCategory> getRoomCategoryByDateAndName(String searchKey) {
        return roomCategoryRepository.findByDatesBetween(searchKey);
    }


}
