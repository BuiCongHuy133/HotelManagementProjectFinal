package service;

import entity.User;

public interface UserService{
    void addUser(User user);
    boolean checkUser(User user);
    User getUserbyName(String name);
    User CheckUser(String username,String password);
    User getUserById(int id);
}
