package com.example.demo.Repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.Expenses;
import com.example.demo.model.Users;

public interface ExpenseRepo extends JpaRepository<Expenses , Integer>{

	public List<Expenses> findByUser(Users user);
}
