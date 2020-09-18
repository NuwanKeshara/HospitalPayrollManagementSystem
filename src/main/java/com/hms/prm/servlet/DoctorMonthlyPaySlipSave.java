package com.hms.prm.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hms.prm.model.Doctor;
import com.hms.prm.service.DoctorRelative;

/**
 * Servlet implementation class DoctorMonthlyPaySlipSave
 */
public class DoctorMonthlyPaySlipSave extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoctorMonthlyPaySlipSave() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String action = request.getParameter("action");
		
		if(action.equals("Save")) {
			try {
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String designation = request.getParameter("designation");
			double basicSalary = Double.parseDouble(request.getParameter("basicSalary"));
			double overtime = Double.parseDouble(request.getParameter("overtime"));
			double medical = Double.parseDouble(request.getParameter("medical"));
			double bonus = Double.parseDouble(request.getParameter("bonus"));
			double other = Double.parseDouble(request.getParameter("other"));
			String deductionDescription = request.getParameter("deductionDescription");
			double deductionTotal = Double.parseDouble(request.getParameter("deductionTotal"));
			double TotalEarnings = Double.parseDouble(request.getParameter("TotalEarnings"));
			double netPay = Double.parseDouble(request.getParameter("netPay"));
			String date = request.getParameter("date");
			
			Doctor doctor = new Doctor(id, name, designation, basicSalary, overtime, 
					medical, bonus, other, deductionDescription, deductionTotal, TotalEarnings,
					netPay,new SimpleDateFormat("yyyy-MM-dd").parse(date));
			
			DoctorRelative.updateDoctorPayslip(doctor);
			response.sendRedirect("doctor_monthly_payslip.jsp");
			
			}
			catch(Exception ex) {
				
			}
			
		}
		else if(action.equals("Cancel")) {
			response.sendRedirect("doctor_monthly_payslip.jsp");
		}
	}

}
