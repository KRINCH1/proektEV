package com.ecommerce.userservice.service;

import com.ecommerce.userservice.dto.UserRequest;
import com.ecommerce.userservice.dto.UserResponse;
import com.ecommerce.userservice.model.User;
import com.ecommerce.userservice.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class UserService {
    private final UserRepository userRepository;

    public UserResponse createUser(UserRequest request) {
        log.info("Creating user with email: {}", request.getEmail());
        
        User user = new User();
        user.setEmail(request.getEmail());
        user.setPassword(request.getPassword());
        user.setFirstName(request.getFirstName());
        user.setLastName(request.getLastName());
        user.setPhone(request.getPhone());
        
        User savedUser = userRepository.save(user);
        log.info("User created with id: {}", savedUser.getId());
        
        return UserResponse.fromEntity(savedUser);
    }

    public UserResponse getUserById(Long id) {
        User user = userRepository.findById(id)
            .orElseThrow(() -> new RuntimeException("User not found"));
        return UserResponse.fromEntity(user);
    }

    public List<UserResponse> getAllUsers() {
        return userRepository.findAll().stream()
            .map(UserResponse::fromEntity)
            .collect(Collectors.toList());
    }

    public UserResponse updateUser(Long id, UserRequest request) {
        User user = userRepository.findById(id)
            .orElseThrow(() -> new RuntimeException("User not found"));
        
        user.setEmail(request.getEmail());
        user.setFirstName(request.getFirstName());
        user.setLastName(request.getLastName());
        user.setPhone(request.getPhone());
        
        User updatedUser = userRepository.save(user);
        return UserResponse.fromEntity(updatedUser);
    }

    public void deleteUser(Long id) {
        userRepository.deleteById(id);
    }
}