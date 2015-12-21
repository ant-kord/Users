package ru.javarush.test.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ru.javarush.test.entities.User;
import ru.javarush.test.services.UserService;

import java.util.Date;
import java.sql.Timestamp;

/**
 * Created by adm on 11.12.2015.
 */
@Controller
public class UserController {

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    private int pageLimit = 10;

    @Autowired
    private UserService userService;

    @Autowired
    MessageSource messageSource;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String listUser(@RequestParam(value = "page", required = false) Integer page,
                           @RequestParam(value = "resultPage", required = false) Integer resultPage,
                           Model model) {

        if (resultPage != null)
            pageLimit = resultPage;

        if (page == null)
            page = 1;
        int tableSize = this.userService.getTableSize();
        int maxPage = (tableSize % pageLimit) == 0 ? (tableSize/ pageLimit) : (tableSize/ pageLimit) + 1;
        int startpage = page - 5 > 0?page - 5:1;
        int endpage =  maxPage;
        int nextPage = page == maxPage ? page - 1 : page;

        model.addAttribute("listUser", this.userService.listUser(page, pageLimit));
        model.addAttribute("startpage", startpage);
        model.addAttribute("endpage", endpage);
        model.addAttribute("user", new User());
        model.addAttribute("page", nextPage);
        model.addAttribute("currentPage", page);
        model.addAttribute("pageLimit", pageLimit);
        return "userList";
    }

    @RequestMapping(value = "createUser", method = RequestMethod.GET)
    public String addUser(ModelMap model){
        User user = new User();
        model.addAttribute("user", user);
        model.addAttribute("edit", false);
        return "userForm";
    }

    @RequestMapping(value ="saveUser", method = RequestMethod.POST)
    public String saveUser(@ModelAttribute ("user") User user, ModelMap modelMap){

        if(user.getId() == 0){
            user.setCreatedDate(new Timestamp(new Date().getTime()));
            this.userService.addUser(user);
            modelMap.addAttribute("success", "User " + user.getName() + " registered successfully");
            modelMap.addAttribute("title", "Registered successfully");
        } else{
            this.userService.updateUser(user);
            modelMap.addAttribute("success", "User " + user.getName() + " updating successfully");
            modelMap.addAttribute("title", "Updating successfully");
        }
        return "successPage";
    }

    @RequestMapping("delete")
    public String delete(@RequestParam int id, User user, ModelMap modelMap) {
        logger.info("Deleting the User. Id : " + id);
        user = this.userService.getUserById(id);
        this.userService.removeUser(id);
        modelMap.addAttribute("success", "User " + user.getName() + " deleting successfully");
        modelMap.addAttribute("title", "Deleting successfully");
        return "successPage";
    }

    @RequestMapping(value = "edit", method = RequestMethod.GET)
    public String edit(@RequestParam int id, ModelMap model){
        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        model.addAttribute("edit", true);
        return "userForm";
    }

    @RequestMapping(value = "search", method = RequestMethod.POST)
    public String searchUser(@RequestParam(value = "page", required = false) Integer page,
                             @RequestParam(value = "searchName") String searchName, Model model ){

        if (page == null)
            page = 1;
        int startpage = page - 5 > 0?page - 5:1;
        if(searchName.equals("")) {
            model.addAttribute("error", "Enter user name");
            return "errorPage";
        }else {

            model.addAttribute("listUser", this.userService.searchUser(searchName));
            model.addAttribute("startpage", startpage);
            model.addAttribute("currentPage", page);
            return "userList";
        }
    }

}
