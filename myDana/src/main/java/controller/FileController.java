package controller;

import dto.FileResponseDto;
import entity.File;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;
import service.FileService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/file")
public class FileController {

    @Autowired
    private FileService fileService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(Model model) {
        return "site/room_details/index";
    }
    @RequestMapping(value = "/upload", method = RequestMethod.POST, produces = "text/plain")
    public String upload(@RequestParam("file") MultipartFile file) {
        try {
            File f = fileService.store(file);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "redirect:/home/";
    }
    @RequestMapping(value = "/upload/multiple", method = RequestMethod.POST)
    public String uploadMultiple(@RequestParam("files") MultipartFile[] files) {
        Arrays.asList(files).forEach(file -> {
            try {
                fileService.store(file);
            } catch (IOException e) {
                e.printStackTrace();
            }
        });
        return "site/upload";
    }

    @GetMapping("/{id}")
    public ResponseEntity<byte[]> getFile(@PathVariable String id) {
        File fileDB = fileService.getFileById(Integer.parseInt(id));

        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + fileDB.getName() + "\"")
                .body(fileDB.getContent());
    }
}
