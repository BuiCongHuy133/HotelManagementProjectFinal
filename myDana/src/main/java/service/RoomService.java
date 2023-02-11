package service;

import entity.Room;
import entity.RoomCategory;
import entity.RoomStatus;

import java.util.List;

public interface RoomService {
    List<Room> getAllRoom();
    Room addOrUpdate(Room room);
    Room getRoomById(int id);
    List<RoomStatus> getAllStatus();
    void deleteRoomById(int id);
    List<RoomCategory> getAllCategoryRoom();
    List<Room> searchRoom(String searchKey);

//    Home
    List<Room> searchRoomNameorAvailableRoom(String searchKey);

    long countByRoomCategory(RoomCategory roomCategory);
}
