package service;

import entity.RoomCategory;

import java.time.LocalDate;
import java.util.List;

public interface RoomCategoryService {
    List<RoomCategory> getAllRoomCategory();
    RoomCategory getRoomCateById(int id);
    List<RoomCategory> getRoomCategoryByDateAndName(String searchKey);

    List<RoomCategory> getAllRoomAvailable();
    void Quantity(int quantity,int id);
}
