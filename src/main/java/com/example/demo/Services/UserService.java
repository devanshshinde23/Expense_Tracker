package com.example.demo.Services;

import java.util.List;

import com.example.demo.model.Expenses;
import com.example.demo.model.Users;

public interface UserService {

	public Users checkUserInfo(String username, String password);

	public void saveuserdata(Users u1);

	public void saveExpense(Expenses e1);

	public List<Expenses> ExpenseList(Users user);

	public Expenses fetchSingleRecord(int id);

	public void deleteExpenseRecord(int id);
	
	public Users findByUsername(String username);
	
	public Users getUserByUsername(String Username);

}
