package com.example.lab6.services;

import com.example.lab6.entities.User;
import com.example.lab6.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    private final UserRepository userRepository;

    @Autowired
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public Iterable<User> getAllUsers() {
        return userRepository.findAll();
    }

    public User getUserById(Long id) throws Exception {
        if (userRepository.existsById(id)) {
            return userRepository.findById(id).get();
        } else {
            throw new Exception("User not found");
        }
    }
    public User createUser(User user) throws Exception {
        if (userRepository.existsUserByEmail(user.getEmail())) {
            throw  new Exception("User with provided email already exists");
        } else {
            return userRepository.save(user);
        }
    }

    public User changeUserEmail(Long id, String email) throws Exception {
        if (userRepository.existsUserByEmail(email)) {
            throw  new Exception("User with provided email already exists");
        } else {
            if (userRepository.existsById(id)) {
                User user = userRepository.findById(id).get();
                user.setEmail(email);
                return userRepository.save(user);
            } else {
                throw new Exception("User with provided id doesn't exist");
            }
        }
    }

    public User changeUserPassword(Long id, String password) throws Exception {
        if (userRepository.existsById(id)) {
            User user = userRepository.findById(id).get();
            user.setPassword(password);
            return userRepository.save(user);
        } else {
            throw new Exception("User with provided id doesn't exist");
        }
    }

    public String deleteUserById(Long id) throws Exception {
        if (userRepository.existsById(id)) {
            userRepository.deleteById(id);
        } else {
            throw new Exception("Failed to delete user");
        }
        return String.format("User %d was deleted", id);
    }

}
