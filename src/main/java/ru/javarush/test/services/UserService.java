package ru.javarush.test.services;

import ru.javarush.test.entities.User;

import java.util.List;

/**
 * Created by adm on 11.12.2015.
 */

public interface UserService {

    void addUser(User user);
    void updateUser(User user);
    void removeUser(int id);
    List<User> listUser(int pageNumber, int pageLimit);
    User getUserById(int id);
    int getTableSize();
    List<User> searchUser(String name);
}
