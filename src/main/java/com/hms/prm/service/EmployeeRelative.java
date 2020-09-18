package com.hms.prm.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

import com.hms.prm.model.Employee;
import com.hms.prm.util.HibernateUtil;

public class EmployeeRelative {

	public static final Logger log = Logger.getLogger(EmployeeRelative.class.getName());

	private static SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

	/*
	 * retrieve all the employees paysheets' details
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	public static List<Employee> findAllEmployees(String var) {

		try {
			Session session = sessionFactory.openSession();
			Criteria cr = session.createCriteria(Employee.class);

			// Add restriction.
			if (var.equals("doctor")) {
				cr.add(Restrictions.eq("status", "doctor"));
			} else if (var.equals("staff")) {
				cr.add(Restrictions.eq("status", "staff"));
			} else if (var.equals("nurse")) {
				cr.add(Restrictions.eq("status", "nurse"));
			}

			List<Employee> employees = cr.list();
			return employees;

		} catch (Exception ex) {
			log.log(Level.SEVERE, ex.getMessage());
			return null;
		}
	}

	/*
	 * find employee paysheet by his/her id and date
	 */
	@SuppressWarnings("deprecation")
	public static Employee findEmployeeByIdAndDate(String id, Date date) {

		try {
			Session session = sessionFactory.openSession();
			Criteria cr = session.createCriteria(Employee.class);

			// Add restriction.
			cr.add(Restrictions.eq("id", id));
			cr.add(Restrictions.eq("date", date));

			Employee employee = (Employee) cr.uniqueResult();
			return employee;
		} catch (Exception ex) {
			log.log(Level.SEVERE, ex.getMessage());
			return null;
		}
	}

	/*
	 * delete employee paysheet details by id and date
	 */
	public static void deleteEmployeePayslip(String id, Date date) {

		try {
			Session session = sessionFactory.openSession();
			session.beginTransaction();

			Employee emp = new Employee();

			emp.setId(id);
			emp.setDate(date);

			session.delete(emp);
			session.getTransaction().commit();
			session.close();
		} catch (Exception ex) {
			log.log(Level.SEVERE, ex.getMessage());

		}

	}

	/*
	 * retrieve employee object list for matching id ,name or designation
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	public static List<Employee> SearchAllEmployees(String status, String searchValue) {
		// TODO Auto-generated method stub
		try {
			Session session = sessionFactory.openSession();
			Criteria cr1 = session.createCriteria(Employee.class);
			Criteria cr2 = session.createCriteria(Employee.class);
			Criteria cr3 = session.createCriteria(Employee.class);
			

			// Add restriction.
			cr1.add(Restrictions.ilike("id", "%"+searchValue+"%"));
			List<Employee> list1 = cr1.list();
			
			cr2.add(Restrictions.ilike("name", "%"+searchValue+"%"));
			List<Employee> list2 = cr2.list();
			
			cr3.add(Restrictions.ilike("designation", "%"+searchValue+"%"));
			List<Employee> list3 = cr3.list();
			

			List<Employee> employees = new ArrayList<Employee>();
			employees.addAll(list1);
			employees.addAll(list2);
			employees.addAll(list3);
			
			return employees;

		} catch (Exception ex) {
			log.log(Level.SEVERE, ex.getMessage());
			return null;
		}
	}
}
