package com.hms.prm.model;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="paysheets_backup")
public class Employee {
	
	@Id
	@Column(name="id")
	private String id;
	
	@Column(name="name")
	private String name;
	
	@Column(name="designation")
	private String designation;
	
	@Column(name="basicSalary")
	private double basicSalary;
	
	@Column(name="overtime")
	private double overtime;
	
	@Column(name="medical")
	private double medical;
	
	@Column(name="bonus")
	private double bonus;
	
	@Column(name="other")
	private double other;
	
	@Column(name="deductionDescription")
	private String deductionDescription;
	
	@Column(name="deductionTotal")
	private double deductionTotal;
	
	@Column(name="totalEarnings")
	private double totalEarnings;
	
	@Column(name="netpay")
	private double netpay;
	
	@Column(name="date")
	private Date date;
	
	@Column(name="status")
	private String status;
	
	
	
	
	public Employee(String id, String name, String designation, double basicSalary, 
			double overtime, double medical,double bonus, double other, String deductionDescription, 
			double deductionTotal, double totalEarnings,double netpay , Date date , String status) {
		
		super();
		this.id = id;
		this.name = name;
		this.designation = designation;
		this.basicSalary = basicSalary;
		this.overtime = overtime;
		this.medical = medical;
		this.bonus = bonus;
		this.other = other;
		this.deductionDescription = deductionDescription;
		this.deductionTotal = deductionTotal;
		this.totalEarnings = totalEarnings;
		this.netpay = netpay;
		this.date = date;
		this.status = status;
	}


	public Employee() {
		super();
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getDesignation() {
		return designation;
	}


	public void setDesignation(String designation) {
		this.designation = designation;
	}


	public double getBasicSalary() {
		return basicSalary;
	}


	public void setBasicSalary(double basicSalary) {
		this.basicSalary = basicSalary;
	}


	public double getOvertime() {
		return overtime;
	}


	public void setOvertime(double overtime) {
		this.overtime = overtime;
	}


	public double getMedical() {
		return medical;
	}


	public void setMedical(double medical) {
		this.medical = medical;
	}


	public double getBonus() {
		return bonus;
	}


	public void setBonus(double bonus) {
		this.bonus = bonus;
	}


	public double getOther() {
		return other;
	}


	public void setOther(double other) {
		this.other = other;
	}


	public String getDeductionDescription() {
		return deductionDescription;
	}


	public void setDeductionDescription(String deductionDescription) {
		this.deductionDescription = deductionDescription;
	}


	public double getDeductionTotal() {
		return deductionTotal;
	}


	public void setDeductionTotal(double deductionTotal) {
		this.deductionTotal = deductionTotal;
	}


	public double getTotalEarnings() {
		return totalEarnings;
	}


	public void setTotalEarnings(double totalEarnings) {
		this.totalEarnings = totalEarnings;
	}


	public double getNetpay() {
		return netpay;
	}


	public void setNetpay(double netpay) {
		this.netpay = netpay;
	}
	
	public Date getDate() {
		return date;
	}


	public void setDate(Date date) {
		this.date = date;
	}
	
	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}
	
	
	

}
