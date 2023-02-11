package controller;


import entity.BookingRegistation;
import entity.Contact;
import entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import service.ContactService;
import service.RoomCategoryService;
import service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.security.Principal;

@Controller
@RequestMapping("/")
@Scope("session")
public class HomeController {
    @Autowired
    private RoomCategoryService roomCategoryService;

    @Autowired
    private ContactService contactService;

    @Autowired
    private UserService userService;

    @RequestMapping(value = {"/","home"}, method = RequestMethod.GET)
    public String home(Model model,Principal user,HttpSession session){
        model.addAttribute("roomCate",roomCategoryService.getAllRoomAvailable());
        model.addAttribute("contact",new Contact());
        User user1 = (User) session.getAttribute("userNew");
        if(user1 != null){

            ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
            HttpSession sessions= attr.getRequest().getSession(true);
            User myUser = (User) userService.getUserbyName(user1.getUsername());

            sessions.setAttribute("username",myUser.getUsername());
            sessions.setAttribute("email",myUser.getEmail());
            sessions.setAttribute("phone_number",myUser.getPhone_number());
            sessions.setAttribute("id",myUser.getId());

            sessions.removeAttribute("price");
        }

        return "site/index";
    }
    @RequestMapping(value = "rooms",method = RequestMethod.GET)
    public String rooms(){
        return "site/rooms/index";
    }

    @RequestMapping(value = "contact",method = RequestMethod.GET)
    public String contact(Model model){

        return "site/contact/index";
    }
    @RequestMapping(value = "information",method = RequestMethod.GET)
    public String information(){

        return "site/information/index";
    }
    @RequestMapping(value = "services",method = RequestMethod.GET)
    public String services(){
        return "site/services/index";
    }
    @RequestMapping(value = "news",method = RequestMethod.GET)
    public String news(){
        return "site/news/index";
    }
    @RequestMapping(value = "booking",method = RequestMethod.GET)
    public String booking(HttpServletRequest request,Principal user){
        return "site/booking/index";
    }
    @RequestMapping(value = "payment",method = RequestMethod.GET)
    public String payment(){
        return "site/booking/payment";
    }

    @RequestMapping(value ="/saveContact", method = RequestMethod.POST)
    public String saveContactHome(@ModelAttribute("contact") Contact contact, Model model){
        contactService.saveContact(contact);
        model.addAttribute("msg" , " Your opinion have been sent to us. Thanks for your contribution " );
        return "site/index";
    }

}
