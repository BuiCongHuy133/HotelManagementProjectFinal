package controller;

import entity.Contact;
import entity.Destination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import service.ContactService;
import service.DestinationService;

@Controller
@RequestMapping("/contact")
public class DestinationController {
    @Autowired
    private DestinationService destinationService;

    @Autowired
    private ContactService contactService;

    @RequestMapping(value = "/",method = RequestMethod.GET)
    public String getDestination(Model model){
        model.addAttribute("contact",new Contact());
        Destination destination = destinationService.getDestination();
        model.addAttribute("destination",destination);
        return "site/contact/index";
    }
    @RequestMapping(value ="/saveContact", method = RequestMethod.POST)
    public String saveContactHome(@ModelAttribute("contact") Contact contact, Model model){
        contactService.saveContact(contact);
        model.addAttribute("msg" , " Your opinion have been sent to us. Thanks for your contribution " );
        return "site/index";
    }
}
