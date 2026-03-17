package com.example.demo.Controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;


import com.example.demo.Services.UserService;
import com.example.demo.model.Expenses;
import com.example.demo.model.Users;




@Controller
public class HomeController {

	@Autowired
	UserService us;
	
	@GetMapping("/login")
	public String loginPage() {
	    return "login";
	}
	
	@GetMapping("/LoginPage")
	public String LoginPage() {
		return "LoginPage";
	}
	

	
	@GetMapping("/RegistrationPage")
	public String RegistrationPage() {
		return "RegistrationPage";
	}
	
	@PostMapping("/saveuser")
	public String saveuser(@ModelAttribute Users u1) {
		us.saveuserdata(u1);
		return "redirect:/login";
	}
	
	@GetMapping("/UserDash")
	public String UserDash() {
		
			return "UserDash";
		
		
	}
	
	@GetMapping("/AddExpense")
	public String AddExpense() {
		return"AddExpense";
	}
	
	@PostMapping("/saveExpense")
	public String saveExpense(@ModelAttribute Expenses e1) {
		
		Authentication auth= SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		Users u = us.getUserByUsername(username);
		
		e1.setUser(u);
		us.saveExpense(e1);
		return "redirect:/UserDash?success=expense";
	}
	
	
	@GetMapping("/ExpenseList")
	public String ExpenseList(Model m , Authentication auth) {
		
		String username = auth.getName();
		Users u = us.getUserByUsername(username);
		List<Expenses> el= us.ExpenseList(u);
		
		m.addAttribute("temp", el);
		return "ExpenseList";
		
	}
	
	@GetMapping("UpdateExpense")
	public String UpdateExpense() {
		return "UpdateExpense";
	}
	
	
	@GetMapping("/edit/{id}")
	public String updateExpense(@PathVariable int id , Model m ){
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		
		
		Expenses e = us.fetchSingleRecord(id); 
		
		if(e == null || !e.getUser().getUsername().equals(username)) {
			return "redirect:/ExpenseList";
		}
		
		
		m.addAttribute("ex", e);
		
		return "UpdateExpense";
	}
	
	@PostMapping("/UpdateExpenseData")
	public String UpdateExpenseData(@ModelAttribute Expenses ue, Authentication auth ) {
		
		String username = auth.getName();
		Expenses old = us.fetchSingleRecord(ue.getId());
		
		if(old != null && old.getUser().getUsername().equals(username)) {
			ue.setUser(old.getUser());
			us.saveExpense(ue);
		}
		
		return "redirect:/ExpenseList?success=updated";
	}
	
	@GetMapping("/delete/{id}")
	public String deleteExpense(@PathVariable int id) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		String username = auth.getName();
		
		Expenses e = us.fetchSingleRecord(id);
		if(e!= null && e.getUser().getUsername().equals(username)) {
			us.deleteExpenseRecord(id);
		}
		
		return "redirect:/ExpenseList?success=deleted";
	}
	
	
}
