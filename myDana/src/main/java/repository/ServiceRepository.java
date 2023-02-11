package repository;

import entity.Service;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ServiceRepository extends JpaRepository<Service,Integer> {
    @Query(value = "SELECT * from service where price > 0",nativeQuery = true)
    List<Service> findByPrice();
    @Query(value = "select *from service where name like ?1", nativeQuery = true)
    List<Service> findServicesByName(String searchKey);

}
