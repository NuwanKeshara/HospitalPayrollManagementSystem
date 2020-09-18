package com.hms.prm.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hms.prm.model.Doctor;
import com.hms.prm.model.Nurse;
import com.hms.prm.model.Staff;
import com.hms.prm.service.DoctorRelative;
import com.hms.prm.service.NurseRelative;
import com.hms.prm.service.StaffRelative;

/**
 * Servlet implementation class DoctorPayrollRegisterServlet
 */
public class PayrollSave extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PayrollSave() {
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
		String pattern = "yyyy-MM-dd";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		
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
		String stat = request.getParameter("stat");
		
		Date date;
		
		try {
			date = simpleDateFormat. parse(request.getParameter("date"));
		
		if(stat.equals("doctors")) {
		Doctor doctor = new Doctor(id, name, designation, basicSalary, overtime, 
				medical, bonus, other, deductionDescription, deductionTotal, TotalEarnings,
				netPay,date);
		
		DoctorRelative.saveDoctorPayslip(doctor);
		request.getRequestDispatcher("/non_created_doctors.jsp").forward(request, response);
		
		}
		else if(stat.equals("nurses")) {
			Nurse nurse = new Nurse(id, name, designation, basicSalary, overtime, 
					medical, bonus, other, deductionDescription, deductionTotal, TotalEarnings,
					netPay,date);
			
			NurseRelative.saveNursePayslip(nurse);
			request.getRequestDispatcher("/non_created_nurses.jsp").forward(request, response);
			
		}
		else if(stat.equals("staff")) {
			Staff staff = new Staff(id, name, designation, basicSalary, overtime, 
					medical, bonus, other, deductionDescription, deductionTotal, TotalEarnings,
					netPay,date);
			
			StaffRelative.saveStaffPayslip(staff);
			request.getRequestDispatcher("/non_created_staff.jsp").forward(request, response);
		}
		
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
