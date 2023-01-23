package com.kiranacademy.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kiranacademy.entity.Category;

@Repository
public class CategoryDao {

	@Autowired
	SessionFactory factory;

	public Category saveCategory(Category category) {
		Session session = factory.openSession();
		Transaction tranaction = session.beginTransaction();
		session.save(category);
		tranaction.commit();
		return category;
	}

	public Category updateCategory(Category category) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();

		session.update(category);

		tx.commit();

		return category;

	}
	
	public Category getCategory(int cid) {
		// TODO Auto-generated method stub
		System.out.println("Inside GetCategoryMethod");
		Session session=factory.openSession();
		Category category=session.get(Category.class, cid); //get method returns null value if record is not present in database;
		return category;
	}

	public List<Category> getAllCategories() {
		Session session=factory.openSession();
		Criteria criteria=session.createCriteria(Category.class);
		List<Category> l=criteria.list();
		return l;
	}

	public Category deleteCategory(int cid) {
		Session session=factory.openSession();
		Category category=session.get(Category.class, cid);
		Transaction tx=session.beginTransaction();
		session.delete(category);
		tx.commit();
		return category;
	}

}
