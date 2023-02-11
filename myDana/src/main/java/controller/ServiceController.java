package controller;

import entity.Room;
import entity.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import service.ServiceService;

import java.util.List;

@Controller
@RequestMapping("/services")
public class ServiceController {
    @Autowired
    private ServiceService serviceService;

    @RequestMapping(value = "/",method = RequestMethod.GET)
    public String getAllService(Model model){
        List<Service> services = serviceService.getListService();
        model.addAttribute("services", services);
        return "site/services/index";
    }
}
