package com.hms.prm.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

import com.hms.prm.model.Login;
import com.hms.prm.util.HibernateUtil;

/**
 * Servlet implementation class Login
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private SessionFactory sessionFactory = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		
		@SuppressWarnings("deprecation")
		Criteria cr = session.createCriteria(Login.class);

		// Add restriction.
		cr.add(Restrictions.eq("username", username));
		cr.add(Restrictions.eq("password", password));

		Login login = (Login) cr.uniqueResult();
		
		
		sessionFactory = null;
		
		if(login == null) {
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
		else {
			String role = login.getRole();
			System.out.println(role);
			if(role.equals("sysAdmin")) {
				request.getRequestDispatcher("/payroll_home.jsp").forward(request, response);
			}
			else {
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			}
		}

}
}
