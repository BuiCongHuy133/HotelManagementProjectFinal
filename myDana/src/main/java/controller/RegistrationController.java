package controller;

import entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import repository.UserRepository;
import service.UserService;

import java.security.SecureRandom;

@Controller
@RequestMapping("/registration")
public class RegistrationController {
    @Autowired
    public UserService userService;


    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String showRegister(Model model) {
        model.addAttribute("user", new User());
        return "registration";
    }
    @RequestMapping(value = "/saveUser",method = RequestMethod.POST,produces = "text/plain;charset=UTF-8")
    public String saveUser(@ModelAttribute("user") User user,Model model){

        if(userService.checkUser(user)){
            model.addAttribute("msg","Username existed");
            return "registration";
        } else {
            userService.addUser(user);

            model.addAttribute("msg","Success!");
            return "login";
        }
    }


}
