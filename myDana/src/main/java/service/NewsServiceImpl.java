package service;

import entity.News;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.NewsRepository;

import java.util.List;

@Service( value = "newsService")
public class NewsServiceImpl implements NewsService{
    @Autowired
    private NewsRepository newsRepository;

    @Override
    public List<News> getAllNew() {
        return newsRepository.findAll();
    }
}
