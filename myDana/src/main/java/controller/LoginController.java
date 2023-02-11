package controller;

import entity.Contact;
import entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import service.UserService;

import javax.servlet.http.HttpSession;
import java.security.SecureRandom;

@Controller
@RequestMapping( "/login")
public class LoginController {
    @Autowired
    UserService userService;

    @RequestMapping(value = "/",method = RequestMethod.GET)
    public String login(){
        return "login";
    }
    @RequestMapping(value = "/checkLogin",method = RequestMethod.POST)
    public String checkLogin(@ModelAttribute("user") User user, Model model, HttpSession session){

        if(userService.CheckUser(user.getUsername(),user.getPassword()) != null){
            User user1 = userService.getUserbyName(user.getUsername());
            session.setAttribute("userNew",user1);
            return "redirect:/home/";
        }
        else{
            model.addAttribute("msg", "Wrong Username or Password");
            return "login";
        }

    }
}

