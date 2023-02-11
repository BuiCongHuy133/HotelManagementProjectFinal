package repository;

import entity.File;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface FileRepository extends JpaRepository<File, Integer> {
    List<File> findAllByOrderByIdDesc();
    List<File> findByRoomCategoryId(int id);
}
