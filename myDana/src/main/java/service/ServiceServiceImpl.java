package service;

import entity.Service;
import org.springframework.beans.factory.annotation.Autowired;
import repository.ServiceRepository;

import javax.transaction.Transactional;
import java.util.List;

@org.springframework.stereotype.Service(value = "serviceService")
public class ServiceServiceImpl implements ServiceService{

    @Autowired
    private ServiceRepository serviceRepository;

    @Override
    public List<Service> getListService() {
        return (List<Service>) serviceRepository.findByPrice();
    }
    @Override
    public List<Service> getAllService(){
        return (List<Service>) serviceRepository.findAll();
    }
    @Override
    public List<Service> getAllServiceByName(String searchKey){
        return (List<Service>)  serviceRepository.findServicesByName(searchKey);
    }
    @Override
    @Transactional
    public void addService(Service service){
        serviceRepository.save(service);
    }
    @Override
    public Service getServiceById(int id){
        Service service = (Service) serviceRepository.findById(id).get();
        return service;
    }
    @Override
    public void deleteServiceById(int id){
        serviceRepository.deleteById(id);
    }
}
