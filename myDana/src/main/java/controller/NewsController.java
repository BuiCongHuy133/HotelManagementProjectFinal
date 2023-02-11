package controller;

import entity.Contact;
import entity.Destination;
import entity.News;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import service.NewsService;

import java.util.List;

@Controller
@RequestMapping("/news")
public class NewsController {
    @Autowired
    private NewsService newsService;

    @RequestMapping(value = "/",method = RequestMethod.GET)
    public String getDestination(Model model){
        List<News> news = newsService.getAllNew();
        model.addAttribute("news",news);
        return "site/news/index";
    }
}
