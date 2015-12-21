package ru.javarush.test.dao;

/**
 * Created by adm on 11.12.2015.
 */

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import ru.javarush.test.entities.User;

import java.util.List;


@Repository
public class UserDaoImpl implements UserDao {

    private static final Logger logger = LoggerFactory.getLogger(UserDaoImpl.class);



    @Autowired
    private SessionFactory sessionFactory;

    @Transactional
    public void addUser(User user) {
        Session session = sessionFactory.getCurrentSession();
        session.save(user);
        logger.info(user + " saved successfully.");
    }

    @Transactional
    public void updateUser(User user) {
        Session session = sessionFactory.getCurrentSession();
        User updateUser = (User) session.get(User.class, user.getId());
        updateUser.setName(user.getName());
        updateUser.setAge(user.getAge());
        updateUser.setIsAdmin(user.getIsAdmin());
        session.save(updateUser);
        logger.info(user + "update successfully.");
    }

    @Transactional
    public void removeUser(int id) {
        Session session = sessionFactory.getCurrentSession();
        User user = (User) session.load(User.class, id);
        if(user != null) {
            session.delete(user);
        }
        logger.info(user.getName() + "delete successfully.");
    }

    @Transactional
    @SuppressWarnings("unchecked")
    public List<User> listUser(int pageNumber, int pageLimit) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from User");
        query.setFirstResult(pageLimit * (pageNumber - 1));
        query.setMaxResults(pageLimit);
        List<User> userList = (List<User>) query.list();
        for(User user : userList)
            logger.info("user" + user);
        return userList;
    }

    @Transactional
    public User getUserById(int id) {
        Session session = sessionFactory.getCurrentSession();
        User user = (User) session.load(User.class, id);
        logger.info(user + "load successfully.");
        return user;
    }

    @Transactional
    public int getTableSize(){
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from User");
        return query.list().size();
    }

    @Transactional
    public List<User> searchUser(String name) {
        String query = "select * from user where name like '%"+name+"%'";
        return sessionFactory.getCurrentSession().createSQLQuery(query).addEntity(User.class).list();
    }

}

