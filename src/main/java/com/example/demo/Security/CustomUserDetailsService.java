package com.example.demo.Security;

import org.springframework.stereotype.Service;
import org.springframework.security.core.userdetails.*;
import org.springframework.beans.factory.annotation.Autowired;

import com.example.demo.Repo.UserRepo;
import com.example.demo.model.Users;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    UserRepo ur;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        Users user = ur.findByUsername(username);

        if (user == null) {
            throw new UsernameNotFoundException("User not found");
        }

        return org.springframework.security.core.userdetails.User
                .withUsername(user.getUsername())
                .password(user.getPassword())
                .roles("USER")
                .build();
    }
}