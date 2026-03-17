package com.example.demo.Repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.Users;

public interface UserRepo extends JpaRepository<Users , Integer>{

	public Users findByUsernameAndPassword(String u , String p);
	
	Users findByUsername(String username);
}
