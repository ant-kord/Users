package ru.javarush.test.entities;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by adm on 11.12.2015.
 */
@Entity
@Table(name = "user")
public class User implements Serializable{

    @Id
    @Column (name ="id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column (name = "name")
    private String name;
    @Column (name = "age")
    private int age;
    @Column (name = "isAdmin")
    private boolean isAdmin;
    @Temporal(TemporalType.DATE)
    @Column(name = "createdDate")
    private Date createdDate;

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public boolean getIsAdmin(){
        return isAdmin;
    }

    public void setIsAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
    }

    public Date getCreatedDate() {
        return this.createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }


    @Override
    public String toString() {
        return "id" + id + "name" + name + "age" + age;
    }

}

