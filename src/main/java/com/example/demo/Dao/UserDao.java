package com.example.demo.Dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.demo.Repo.ExpenseRepo;
import com.example.demo.Repo.UserRepo;
import com.example.demo.Services.UserService;
import com.example.demo.model.Expenses;
import com.example.demo.model.Users;

@Service
public class UserDao implements UserService {

	@Autowired
	UserRepo ur;
	
	@Autowired 
	ExpenseRepo er;
	
	@Autowired
	private PasswordEncoder  passwordencoder ;
	
	
	
	@Override
	public Users checkUserInfo(String username, String password) {
		
		Users u = ur.findByUsernameAndPassword(username, password);
		return u;
	}

	@Override
	public void saveuserdata(Users u1) {
		
//		String eencodePassword = passwordencoder.encode(u1.getPassword());
//		
//		u1.setPassword(eencodePassword);
//		ur.save(u1);
		
		u1.setPassword(passwordencoder.encode(u1.getPassword()));
	    ur.save(u1);

	}

	@Override
	public void saveExpense(Expenses e1) {
		
		er.save(e1);
		
	}

	@Override
	public List<Expenses> ExpenseList(Users user) {
		
		List<Expenses> el = er.findByUser(user);
		return el;
	}

	@Override
	public Expenses fetchSingleRecord(int id) {
		Expenses u = er.findById(id).orElse(null);
		return u;
	}

	@Override
	public void deleteExpenseRecord(int id) {
		
		er.deleteById(id);
		
	}

	@Override
	public Users findByUsername(String username) {
		
		return ur.findByUsername(username);
	}

	@Override
	public Users getUserByUsername(String Username) {
		
		return ur.findByUsername(Username);
	}

	
	
}
