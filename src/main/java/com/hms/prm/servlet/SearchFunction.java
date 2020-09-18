package com.hms.prm.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hms.prm.model.Doctor;
import com.hms.prm.model.Employee;
import com.hms.prm.model.Nurse;
import com.hms.prm.model.Staff;
import com.hms.prm.service.DoctorRelative;
import com.hms.prm.service.EmployeeRelative;
import com.hms.prm.service.NurseRelative;
import com.hms.prm.service.StaffRelative;

/**
 * Servlet implementation class SearchFunction
 */
public class SearchFunction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchFunction() {
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
		
		String status = request.getParameter("status");
		String search = request.getParameter("search");
		
		if(status.equals("doctor") || status.equals("doctor_monthly_payslip")) {
			List<Doctor> results = DoctorRelative.SearchAllDoctors(status,search);
			request.setAttribute("employee", results);
			
		}
		else if(status.equals("nurse") || status.equals("nurse_monthly_payslip")) {
			List<Nurse> results = NurseRelative.SearchAllNurses(status,search);
			request.setAttribute("employee", results);
			
		}
		else if(status.equals("staff") || status.equals("staff_monthly_payslip")) {
			List<Staff> results = StaffRelative.SearchAllStaff(status,search);
			request.setAttribute("employee", results);
			
		}
		else{
			List<Employee> results = EmployeeRelative.SearchAllEmployees(status,search);
			request.setAttribute("employee", results);
			
		}
		
		request.setAttribute("status", status);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/search_results.jsp");
		dispatcher.forward(request, response);
	}

}
