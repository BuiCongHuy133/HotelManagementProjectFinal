package service;

import entity.Room;
import entity.RoomCategory;
import entity.RoomStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.RoomCategoryRepository;
import repository.RoomRepository;
import repository.RoomStatusRepository;


import javax.transaction.Transactional;
import java.util.List;

@Service(value = "roomService")
public class RoomServiceImpl implements RoomService{
    @Autowired
    private RoomRepository roomRepository;
    @Autowired
    private RoomCategoryRepository roomCategoryRepository;
    @Autowired
    private RoomStatusRepository roomStatusRepository;

    @Override
    public List<Room> getAllRoom() {
        return (List<Room>) roomRepository.findAll();
    }
    @Override
    @Transactional
    public Room addOrUpdate(Room room){
        return roomRepository.save(room);
    }
    @Override
    public Room getRoomById(int id){
        return  (Room) roomRepository.findById(id).get();
    }
    @Override
    public List<RoomStatus> getAllStatus(){
        List<RoomStatus> statusList = (List<RoomStatus>) roomStatusRepository.findAll();
        return statusList;
    }
    @Override
    public void deleteRoomById(int id){
        roomRepository.deleteById(id);
    }
    @Override
    public List<RoomCategory> getAllCategoryRoom(){
        return (List<RoomCategory>) roomCategoryRepository.findAll();
    }
    @Override
    public List<Room> searchRoom(String searchKey){
        return (List<Room>) roomRepository.getAllRoomBySearchKey(searchKey);
    }

    @Override
    public List<Room> searchRoomNameorAvailableRoom(String searchKey) {
        return (List<Room>) roomRepository.searchRoomNameorAvailableRoom(searchKey);
    }

    @Override
    public long countByRoomCategory(RoomCategory roomCategory) {
        return 0;
    }


}
