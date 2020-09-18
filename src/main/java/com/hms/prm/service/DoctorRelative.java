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
import com.hms.prm.model.Doctor;
import com.hms.prm.model.TestDoc;

public class DoctorRelative {

	public static final Logger log = Logger.getLogger(DoctorRelative.class.getName());

	private static SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

	/*
	 * insert doctor paysheets to the database
	 */
	public static void saveDoctorPayslip(Doctor doctor) {

		try {
			Session session = sessionFactory.openSession();
			Transaction transaction = session.beginTransaction();

			session.save(doctor);
			transaction.commit();

			session.close();
		} catch (Exception ex) {
			log.log(Level.SEVERE, ex.getMessage());
		}

	}

	/*
	 * update doctor paysheet inside the database
	 */
	public static void updateDoctorPayslip(Doctor doctor) {

		try {
			Session session = sessionFactory.openSession();
			Transaction transaction = session.beginTransaction();

			session.update(doctor);
			transaction.commit();

			session.close();
		} catch (Exception ex) {
			log.log(Level.SEVERE, ex.getMessage());
		}

	}

	/*
	 * delete doctor paysheet details by id
	 */
	public static void deleteDoctorPayslip(String id) {

		try {
			Session session = sessionFactory.openSession();
			Transaction transaction = session.beginTransaction();

			Doctor doctor = session.get(Doctor.class, id);

			session.delete(doctor);
			transaction.commit();
			session.close();
		} catch (Exception ex) {
			log.log(Level.SEVERE, ex.getMessage());
		}

	}

	/*
	 * find doctor paysheet by his/her id
	 */
	public static Doctor findDoctorById(String id) {

		try {
			Session session = sessionFactory.openSession();
			Transaction transaction = session.beginTransaction();

			Doctor doctor = session.get(Doctor.class, id);
			session.close();

			return doctor;
		} catch (Exception ex) {
			log.log(Level.SEVERE, ex.getMessage());
			return null;
		}
	}

	/*
	 * retrieve all the doctor paysheets' details
	 */
	@SuppressWarnings({ "unchecked", "deprecation" })
	public static List<Doctor> findAllDoctors() {

		try {
			Session session = sessionFactory.openSession();
			List<Doctor> doctorList = session.createCriteria(Doctor.class).list();
			session.close();

			return doctorList;
		} catch (Exception ex) {
			log.log(Level.SEVERE, ex.getMessage());
			return null;
		}
	}

	/*
	 * retrieve all the doctors' details
	 */
	@SuppressWarnings({ "unchecked", "deprecation" })
	public static List<TestDoc> findAllDocs() {

		try {
			Session session = sessionFactory.openSession();
			List<TestDoc> doctorList = session.createCriteria(TestDoc.class).list();
			session.close();

			return doctorList;
		} catch (Exception ex) {
			log.log(Level.SEVERE, ex.getMessage());
			return null;
		}
	}

	/*
	 * check if particular doctor already exists in the database
	 */
	public static boolean checkDocs(String id) {

		try {
			Session session = sessionFactory.openSession();
			Transaction transaction = session.beginTransaction();

			Doctor doctor = session.get(Doctor.class, id);
			session.close();

			if (doctor != null) {
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
	 * retrieve doctor object list for matching id ,name or designation
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	public static List<Doctor> SearchAllDoctors(String status , String searchValue) {

		try {
			Session session = sessionFactory.openSession();
			Criteria cr1 ,cr2, cr3 = null;
			
			if(status.equals("doctor")) {
				cr1 = session.createCriteria(Doctor.class);
				cr2 = session.createCriteria(Doctor.class);
				cr3 = session.createCriteria(Doctor.class);
			}
			else {
				return null;
			}

			// Add restriction.
			cr1.add(Restrictions.ilike("id", "%"+searchValue+"%"));
			List<Doctor> list1 = cr1.list();
			
			cr2.add(Restrictions.ilike("name", "%"+searchValue+"%"));
			List<Doctor> list2 = cr2.list();
			
			cr3.add(Restrictions.ilike("designation", "%"+searchValue+"%"));
			List<Doctor> list3 = cr3.list();
			

			List<Doctor> doctors = new ArrayList<Doctor>();
			doctors.addAll(list1);
			doctors.addAll(list2);
			doctors.addAll(list3);
			
			return doctors;

		} catch (Exception ex) {
			log.log(Level.SEVERE, ex.getMessage());
			return null;
		}
	}

}
