package com.example.demo.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class Expenses {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String expensename;
	private String amount;
	private String date ;
	private String description ;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private Users user;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getExpensename() {
		return expensename;
	}
	public void setExpensename(String expensename) {
		this.expensename = expensename;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
	public Users getUser() {
		return user;
	}
	public void setUser(Users user) {
		this.user = user;
	}
	@Override
	public String toString() {
		return "Expenses [id=" + id + ", expensename=" + expensename + ", amount=" + amount + ", date=" + date
				+ ", description=" + description + ", user=" + user + "]";
	}
	
	
	
	
	
	
}
