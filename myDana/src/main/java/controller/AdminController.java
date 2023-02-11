package controller;

import entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import service.BookingService;
import service.RoomService;
import service.ServiceService;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import service.RoomService;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private RoomService roomService;
    @Autowired
    private ServiceService serviceService;
    @Autowired
    private BookingService bookingService;
    //Room
    @RequestMapping(value = "/",method = RequestMethod.GET)
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public String adminPage(){
        return "/admin/indexpage/index1";
    }
    @RequestMapping(value = "/listRoom",method = RequestMethod.GET)
    public String getListRoom(Model model){
        List<Room> roomList = roomService.getAllRoom();
        model.addAttribute("roomList", roomList);
        return "admin/indexpage/searchRoom";
    }
    @RequestMapping(value = "/searchRoom",method = RequestMethod.GET,produces = "text/plain")
    public String searchRoom(@RequestParam("searchKey") String searchKey, Model model){
        List<Room> roomList;
        if(searchKey.isEmpty()){
            roomList = roomService.getAllRoom();
        }
        else {
            roomList = roomService.searchRoom(searchKey);
        }
        model.addAttribute("roomList", roomList);
        return "admin/indexpage/searchRoom";
    }
    @RequestMapping(value = "/requestUpdateRoom", method = RequestMethod.GET)
    public String requestUpdateRoom(@RequestParam(name = "id",defaultValue = "0") int id, Model model){
        if(id == 0){
            model.addAttribute("room",new Room());
        } else{
            Room room = roomService.getRoomById(id);
            model.addAttribute("room",room);
        }
        Map<Integer, String> status = new HashMap<>();
        List<RoomStatus> statusList = roomService.getAllStatus();
        for(RoomStatus r : statusList){
            status.put(r.getId(),r.getValue());
        }
        Map<Integer,String> category = new HashMap<>();
        List<RoomCategory> roomCategoryList = roomService.getAllCategoryRoom();
        for(RoomCategory roomCategory : roomCategoryList){
            category.put(roomCategory.getId(),roomCategory.getName());
        }
        model.addAttribute("listRoomCategory",category);
        model.addAttribute("listStatus",status);
        return "admin/indexpage/addRoom";
    }
    @RequestMapping(value = "/saveRoom",method = RequestMethod.POST)
    public String saveRoom(@ModelAttribute("room") Room room){
        roomService.addOrUpdate(room);
        return "redirect:/admin/listRoom";
    }
    @RequestMapping(value = "/deleteRoom", method = RequestMethod.GET)
    public String deleteRoom(@RequestParam(name = "id") int id){
        roomService.deleteRoomById(id);
        return "redirect:/admin/listRoom";
    }
    //Service
    @RequestMapping(value = "/listService",method = RequestMethod.GET)
    public String getListService(Model model){
        List<Service> serviceList = serviceService.getAllService();
        model.addAttribute("serviceList", serviceList);
        return "admin/indexpage/searchService";
    }
    @RequestMapping(value = "/searchService", method = RequestMethod.GET)
    public String searchService(@RequestParam("searchKey") String searchKey, Model model){
        List<Service> serviceList;
        if(searchKey.isEmpty()){
            serviceList = serviceService.getAllService();
        }
        else {
            serviceList = serviceService.getAllServiceByName(searchKey);
        }
        model.addAttribute("serviceList", serviceList);
        return "admin/indexpage/searchService";
    }
    @RequestMapping(value = "/requestUpdateService", method = RequestMethod.GET)
    public String updateService(@RequestParam(value = "id", defaultValue = "0") int id,Model model){
        if(id == 0){
            model.addAttribute("service", new Service());
        }
        else{
            model.addAttribute("service", serviceService.getServiceById(id));
        }
        return "admin/indexpage/addService";
    }
    @RequestMapping(value = "/saveService", method = RequestMethod.GET, produces = "text/plain")
    public String saveService(@ModelAttribute("service") Service service){
        serviceService.addService(service);
        return "redirect:/admin/listService";
    }
    @RequestMapping(value = "/deleteService",method = RequestMethod.GET)
    public String deleteService(@RequestParam("id") int id){
        serviceService.deleteServiceById(id);
        return "redirect:/admin/listService";
    }
    // Booking
    @RequestMapping(value = "/getListBooking", method = RequestMethod.GET)
    public String getListBooking(Model model){
        List<BookingDetail> bookingList = bookingService.getAllBookingInfo();
        model.addAttribute("bookingList", bookingList);
        return "admin/indexpage/searchBooking";
    }
    @RequestMapping(value = "/requestUpdateBooking", method = RequestMethod.GET)
    public String updateBooking(@RequestParam(name = "id",defaultValue = "0") int id, Model model){
        if(id == 0){
            model.addAttribute("booking", new BookingDetail());
        }
        else {
//            BookingDetail booking = bookingService.getBookingById(id);
//            model.addAttribute("booking", booking);
//        }
//        Map<Integer, String> payment = new HashMap<>();
//        List<Payment> paymentList = bookingService.getListPayment();
//        for(Payment p : paymentList){
//            payment.put(p.getId(),p.getType_payment());
        }
//        model.addAttribute("paymentList", payment);

        return "admin/indexpage/addBooking";
    }

//    @RequestMapping(value = "/saveBooking", method = RequestMethod.GET)
//    public String saveBooking(@ModelAttribute(name = "booking") BookingDetail booking){
//        bookingService.saveBooking(booking);
//        return "redirect:/admin/getListBooking";
//    }
    //Show Bill

    @RequestMapping(value = "/showBill",method = RequestMethod.GET)
    public String totalInvoice(Model model, Guest guest, Service service){
        Guest guestBooked = bookingService.getGuest(1);
        model.addAttribute("guest", guestBooked);
        return "admin/indexpage/showBill";
    }
    @RequestMapping(value = "/uploadFile",method = RequestMethod.POST)
    @ResponseBody
    public String uploadFileHandler(@RequestParam(value = "file") MultipartFile file){
        try{
            byte[] bytes = file.getBytes();
            String pathName = "D:\\Project\\JV51_Project\\myDana\\src\\main\\webapp\\resources\\images";
            File dir = new File(pathName);
            if(!dir.exists()){
                dir.mkdirs();
            }
            String fileSource = dir.getAbsolutePath() + File.separator + file.getOriginalFilename();
            File serverFile = new File(fileSource);
            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
            stream.write(bytes);
            stream.close();
            return "You uploaded sucessfully a file, at : "+ fileSource;
        } catch (Exception e){
            System.out.println(e);
            return "Error when uploading file " +e;
        }
    }
}

