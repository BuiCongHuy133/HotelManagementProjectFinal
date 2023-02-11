package controller;


import dto.FileResponseDto;
import entity.File;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;
import service.FileService;
import service.RoomCategoryService;
import service.RoomService;
import entity.Room;
import entity.RoomCategory;

import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/rooms")
public class RoomController {
    @Autowired
    private RoomService roomService;

    @Autowired
    private RoomCategoryService roomCategoryService;

    @Autowired
    private FileService fileService;

    @RequestMapping(value = "/",method = RequestMethod.GET)
    public String getAllRoom(Model model){
        List<RoomCategory> rooms = roomCategoryService.getAllRoomCategory();
        model.addAttribute("rooms",rooms);
        return "site/rooms/index";
    }
    @RequestMapping(value = "/room_details",method = RequestMethod.GET)
    public String searchRoomById(@RequestParam(name="roomCate") int id,Model model,HttpSession session){
        RoomCategory roomCategory = roomCategoryService.getRoomCateById(id);
        model.addAttribute("roomCate",roomCategory);
        //Get image
        List<FileResponseDto> fileResponseDtos = new ArrayList<>();
        List<File> files = fileService.getFilesByRoomCateID(roomCategory.getId());
        files.forEach(file -> {
            String fileUrl = ServletUriComponentsBuilder
                    .fromCurrentContextPath()
                    .path("/file/")
                    .path(String.valueOf(file.getId()))
                    .toUriString();
            FileResponseDto fileResponseDto = new FileResponseDto();
            fileResponseDto.setName(file.getName());
            fileResponseDto.setUrl(fileUrl);
            fileResponseDtos.add(fileResponseDto);
        });
        model.addAttribute("files", fileResponseDtos);

        return "site/room_details/index";
    }

    @RequestMapping(value = "/searchBooking", method = RequestMethod.GET)
    public String searchBook(
            @RequestParam(name = "fromDate") @DateTimeFormat(pattern="yyyy-MM-dd") LocalDate fromDate
            , @RequestParam(name = "toDate") @DateTimeFormat(pattern="yyyy-MM-dd") LocalDate toDate
            , @RequestParam("view") String searchKey, Model model, HttpSession session ){


        session.setAttribute("fromDate",fromDate);
        session.setAttribute("toDate",toDate);

        List<RoomCategory> rooms;
        if(searchKey.isEmpty()){
            rooms = roomCategoryService.getAllRoomCategory();
        }
        else {
            rooms = roomCategoryService.getRoomCategoryByDateAndName(searchKey);
        }
        model.addAttribute("msg", "This room is not available");
        model.addAttribute("rooms", rooms);
        return "site/rooms/index";
    }
    @GetMapping("/{id}")
    public ResponseEntity<byte[]> getFile(@PathVariable String id) {
        File fileDB = fileService.getFileById(Integer.parseInt(id));

        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + fileDB.getName() + "\"")
                .body(fileDB.getContent());
    }
}
