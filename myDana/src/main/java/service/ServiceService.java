package service;

import entity.Room;
import entity.Service;

import java.util.List;

public interface ServiceService {
    List<Service> getListService();
    List<Service> getAllService();
    List<Service> getAllServiceByName(String searchKey);
    void addService(Service service);
    Service getServiceById(int id);
    void deleteServiceById(int id);
}
