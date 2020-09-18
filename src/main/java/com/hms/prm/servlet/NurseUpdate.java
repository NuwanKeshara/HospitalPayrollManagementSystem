package com.hms.prm.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hms.prm.model.Nurse;
import com.hms.prm.service.NurseRelative;

/**
 * Servlet implementation class DoctorUpdate
 */
public class NurseUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NurseUpdate() {
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
		//doGet(request, response);
		
		String id = request.getParameter("id");
		
		if (id != "" || id != null)
		{
			
			Nurse nurse = NurseRelative.findNurseById(id);

			request.setAttribute("nurse", nurse);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/monthly_payslip_form2.jsp");
			dispatcher.forward(request, response);
		}
	}

}
