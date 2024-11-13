package com.chalanachitram.service;

import com.chalanachitram.dao.UserDAO;
import com.chalanachitram.entity.User;
import org.mindrot.jbcrypt.BCrypt;

public class UserService {
    private final UserDAO userDAO;

    public UserService(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    public boolean authenticateUser(String username, String password) {
        User user = userDAO.findByUsername(username);
        if (user == null) {
            return false;
        }
        return BCrypt.checkpw(password, user.getPassword());
    }

    public boolean registerUser(String username, String password, String email, String mobileNumber) {
        if (userDAO.findByUsername(username) != null) {
            return false;
        }
        if (userDAO.findByEmail(email) != null) {
            return false;
        }

        User user = new User();
        user.setUsername(username);
        user.setPassword(BCrypt.hashpw(password, BCrypt.gensalt()));
        user.setEmail(email);
        user.setMobileNumber(mobileNumber);

        userDAO.save(user);
        return true;
    }
}