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
import com.hms.prm.model.Nurse;
import com.hms.prm.model.TestNurse;

public class NurseRelative {

	public static final Logger log = Logger.getLogger(EmployeeRelative.class.getName());

	private static SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

	/*
	 * insert nurse paysheets to the database
	 */
	public static void saveNursePayslip(Nurse nurse) {

		try {
			Session session = sessionFactory.openSession();
			Transaction transaction = session.beginTransaction();

			session.save(nurse);
			transaction.commit();

			session.close();
		} catch (Exception ex) {
			log.log(Level.SEVERE, ex.getMessage());

		}

	}

	/*
	 * update nurse paysheet inside the database
	 */
	public static void updateNursePayslip(Nurse nurse) {

		try {
			Session session = sessionFactory.openSession();
			Transaction transaction = session.beginTransaction();

			session.update(nurse);
			transaction.commit();

			session.close();
		} catch (Exception ex) {
			log.log(Level.SEVERE, ex.getMessage());

		}

	}

	/*
	 * delete nurse paysheet details
	 */
	public static void deleteNursePayslip(String id) {

		try {
			Session session = sessionFactory.openSession();
			Transaction transaction = session.beginTransaction();

			Nurse nurse = session.get(Nurse.class, id);

			session.delete(nurse);
			transaction.commit();
			session.close();
		} catch (Exception ex) {
			log.log(Level.SEVERE, ex.getMessage());

		}

	}

	/*
	 * find nurse paysheet by his/her id
	 */
	public static Nurse findNurseById(String id) {

		try {
			Session session = sessionFactory.openSession();
			Transaction transaction = session.beginTransaction();

			Nurse nurse = session.get(Nurse.class, id);

			session.close();

			return nurse;
		} catch (Exception ex) {
			log.log(Level.SEVERE, ex.getMessage());
			return null;
		}
	}

	/*
	 * retrieve all the nurse paysheets' details
	 */
	@SuppressWarnings({ "unchecked", "deprecation" })
	public static List<Nurse> findAllNurses() {

		try {
			Session session = sessionFactory.openSession();
			List<Nurse> nurseList = session.createCriteria(Nurse.class).list();
			session.close();

			return nurseList;
		} catch (Exception ex) {
			log.log(Level.SEVERE, ex.getMessage());
			return null;
		}
	}
	
	/*
	 * retrieve all the nurses' details
	 */
	@SuppressWarnings({ "unchecked", "deprecation" })
	public static List<TestNurse> findAllNurse() {

		try {
			Session session = sessionFactory.openSession();
			List<TestNurse> nurseList = session.createCriteria(TestNurse.class).list();
			session.close();

			return nurseList;
		} catch (Exception ex) {
			log.log(Level.SEVERE, ex.getMessage());
			return null;
		}
	}

	/*
	 * check if particular nurse already exists in the database
	 */
	public static boolean checkNurse(String id) {

		try {
			Session session = sessionFactory.openSession();
			Transaction transaction = session.beginTransaction();

			Nurse nurse = session.get(Nurse.class, id);
			session.close();

			if (nurse != null) {
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
	 * retrieve nurse object list for matching id ,name or designation
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	public static List<Nurse> SearchAllNurses(String status, String searchValue) {
		// TODO Auto-generated method stub
		try {
			Session session = sessionFactory.openSession();
			Criteria cr1 ,cr2 ,cr3 = null;
			
			if(status.equals("nurse")) {
				cr1 = session.createCriteria(Nurse.class);
				cr2 = session.createCriteria(Nurse.class);
				cr3 = session.createCriteria(Nurse.class);
			}
			else {
				return null;
			}

			// Add restriction.
			cr1.add(Restrictions.ilike("id", "%"+searchValue+"%"));
			List<Nurse> list1 = cr1.list();
			
			cr2.add(Restrictions.ilike("name", "%"+searchValue+"%"));
			List<Nurse> list2 = cr2.list();
			
			cr3.add(Restrictions.ilike("designation", "%"+searchValue+"%"));
			List<Nurse> list3 = cr3.list();
			

			List<Nurse> nurses = new ArrayList<Nurse>();
			nurses.addAll(list1);
			nurses.addAll(list2);
			nurses.addAll(list3);
			
			return nurses;

		} catch (Exception ex) {
			log.log(Level.SEVERE, ex.getMessage());
			return null;
		}
	}

}
