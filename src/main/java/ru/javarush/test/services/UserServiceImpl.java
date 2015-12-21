package ru.javarush.test.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.javarush.test.dao.UserDao;
import ru.javarush.test.entities.User;

import java.util.List;

/**
 * Created by adm on 11.12.2015.
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    public void addUser(User user) {
        this.userDao.addUser(user);
    }

    public void updateUser(User user) {
        this.userDao.updateUser(user);
    }

    public void removeUser(int id) {
        this.userDao.removeUser(id);
    }

    public List<User> listUser(int pageNumber, int pageLimit) {
        return this.userDao.listUser(pageNumber, pageLimit);
    }

    public User getUserById(int id) {
        return this.userDao.getUserById(id);
    }

    public int getTableSize() {
        return this.userDao.getTableSize();
    }

    public List<User> searchUser(String name) {
        return this.userDao.searchUser(name);
    }
}

