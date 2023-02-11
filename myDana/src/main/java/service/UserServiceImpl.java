package service;


import entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.UserRepository;

import javax.transaction.Transactional;


@Service(value = "userService")
public class UserServiceImpl implements UserService{
    @Autowired
    private UserRepository userRepository;

    @Override
    @Transactional
    public void addUser(User user){
        userRepository.save(user);
    }

    @Override
    public boolean checkUser(User user) {
        if(userRepository.existsByUsername(user.getUsername())){
        return true;
        }
        return false;
    }

    @Override
    public User getUserbyName(String name) {
        return (User) userRepository.findByUsername(name);
    }

    @Override
    public User CheckUser(String username, String password) {
        return userRepository.findByUsernameAndPassword(username,password);
    }

    @Override
    public User getUserById(int id) {
        return (User) userRepository.findUserById(id);
    }


}
