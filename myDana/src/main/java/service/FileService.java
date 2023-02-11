package service;
import entity.File;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

public interface FileService {
    File store(MultipartFile file) throws IOException;
    List<File> getFiles();
    List<File> getFilesByRoomCateID(int id);
    File getFileById(int id);
}
