package com.hms.prm.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
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
 * Servlet implementation class ViewPaySheet
 */
public class ViewPaySheet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewPaySheet() {
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
		String id = request.getParameter("id");
//		String name = request.getParameter("name");
//		String designation = request.getParameter("designation");
//		String basicSalary = request.getParameter("basicSalary");
		String stat = request.getParameter("stat");
		request.setAttribute("stat", stat);
		
		if(stat.equals("doctors")) {
			
			Doctor doctor = DoctorRelative.findDoctorById(id);
			request.setAttribute("employee", doctor);
			
		}
		else if(stat.equals("nurses")) {
			
			Nurse nurse = NurseRelative.findNurseById(id);
			request.setAttribute("employee", nurse);
		}
		else if(stat.equals("staff")) {
			
			Staff staff = StaffRelative.findStaffById(id);
			request.setAttribute("employee", staff);	
		}
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/paysheet_view.jsp");
		dispatcher.forward(request, response);
	}

}
