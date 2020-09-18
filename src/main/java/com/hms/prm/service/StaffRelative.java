package com.hms.prm.service;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.hms.prm.util.HibernateUtil;
import com.hms.prm.model.Staff;
import com.hms.prm.model.TestStaff;

public class StaffRelative {

	public static final Logger log = Logger.getLogger(StaffRelative.class.getName());

	private static SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

	
	/*
	 * insert staff members paysheets to the database
	 */
	public static void saveStaffPayslip(Staff staff) {

		try {
			Session session = sessionFactory.openSession();
			Transaction transaction = session.beginTransaction();

			session.save(staff);
			transaction.commit();

			session.close();
		} catch (Exception ex) {
			log.log(Level.SEVERE, ex.getMessage());
		}

	}

	/*
	 * update staff members paysheets 
	 */
	public static void updateStaffPayslip(Staff staff) {

		try {
			Session session = sessionFactory.openSession();
			Transaction transaction = session.beginTransaction();

			session.update(staff);
			transaction.commit();

			session.close();
		} catch (Exception ex) {
			log.log(Level.SEVERE, ex.getMessage());
		}

	}

	/*
	 * delete staff members paysheets in the database
	 */
	public static void deleteStaffPayslip(String id) {

		try {
			Session session = sessionFactory.openSession();
			Transaction transaction = session.beginTransaction();

			Staff staff = session.get(Staff.class, id);

			session.delete(staff);
			transaction.commit();
			session.close();
		} catch (Exception ex) {
			log.log(Level.SEVERE, ex.getMessage());
		}

	}

	/*
	 * find staff member's paysheet by his/her id
	 */
	public static Staff findStaffById(String id) {

		try {
			Session session = sessionFactory.openSession();
			Transaction transaction = session.beginTransaction();

			Staff staff = session.get(Staff.class, id);
			transaction.commit();
			session.close();

			return staff;
		} catch (Exception ex) {
			log.log(Level.SEVERE, ex.getMessage());
			return null;
		}
	}

	/*
	 * retrieve all the staff members' paysheets details from the database
	 */
	@SuppressWarnings({ "unchecked", "deprecation" })
	public static List<Staff> findAllStaffs() {

		try {
			Session session = sessionFactory.openSession();
			List<Staff> staffList = session.createCriteria(Staff.class).list();

			session.close();

			return staffList;
		} catch (Exception ex) {
			log.log(Level.SEVERE, ex.getMessage());
			return null;
		}
	}

	/*
	 * retrieve all the staff members' details
	 */
	@SuppressWarnings({ "unchecked", "deprecation" })
	public static List<TestStaff> findAllStaff() {

		try {
			Session session = sessionFactory.openSession();
			List<TestStaff> staffList = session.createCriteria(TestStaff.class).list();

			session.close();

			return staffList;
		} catch (Exception ex) {
			log.log(Level.SEVERE, ex.getMessage());
			return null;
		}
	}

	/*
	 * check if particular staff member already exists in the database
	 */
	public static boolean checkStaff(String id) {

		try {
			Session session = sessionFactory.openSession();
			Transaction transaction = session.beginTransaction();

			Staff staff = session.get(Staff.class, id);

			transaction.commit();
			session.close();

			if (staff != null) {
				return true;
			} else {
				return false;
			}
		} catch (Exception ex) {
			log.log(Level.SEVERE, ex.getMessage());
			return false;
		}

	}

	/*
	 * retrieve staff object list for matching id ,name or designation
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	public static List<Staff> SearchAllStaff(String status, String searchValue) {
		// TODO Auto-generated method stub
		try {
			Session session = sessionFactory.openSession();
			Criteria cr1 ,cr2 ,cr3 = null;
			
			if(status.equals("staff")) {
				cr1 = session.createCriteria(Staff.class);
				cr2 = session.createCriteria(Staff.class);
				cr3 = session.createCriteria(Staff.class);
			}
			else {
				return null;
			}

			// Add restriction.
			cr1.add(Restrictions.ilike("id", "%"+searchValue+"%"));
			List<Staff> list1 = cr1.list();
			
			cr2.add(Restrictions.ilike("name", "%"+searchValue+"%"));
			List<Staff> list2 = cr2.list();
			
			cr3.add(Restrictions.ilike("designation", "%"+searchValue+"%"));
			List<Staff> list3 = cr3.list();
			

			List<Staff> staff = new ArrayList<Staff>();
			staff.addAll(list1);
			staff.addAll(list2);
			staff.addAll(list3);
			
			return staff;

		} catch (Exception ex) {
			log.log(Level.SEVERE, ex.getMessage());
			return null;
		}
	}

}
