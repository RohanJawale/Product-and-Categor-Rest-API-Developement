package com.kiranacademy.dao;

import java.util.List;

import org.hibernate.Transaction;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kiranacademy.entity.Category;
import com.kiranacademy.entity.Product;

@Repository
public class ProductDao {
@Autowired
SessionFactory factory;
	public Product getProduct(int pid) {
		Session session=factory.openSession();
		Product product=session.get(Product.class,pid);
		return product;
	}
	
	public List<Product> getAllProducts()
	{
		Session session=factory.openSession();
		Criteria criteria=session.createCriteria(Product.class);
		List<Product> p=criteria.list();
		return p;
	}
	public Product addProduct(Product product, int cid) {
		System.out.println("Category Id is : "+cid);
		Session session=factory.openSession();
		Category category=session.load(Category.class,cid);
		List<Product> productslist=category.getProducts();
		Transaction tx=session.beginTransaction();
		productslist.add(product);
		tx.commit();
		System.out.println("Product is added into database : ");
		
		return product;
	}
	public Product updateProduct(Product product) {
		Session session=factory.openSession();
		Transaction tx=session.beginTransaction();
		session.update(product);
		tx.commit();
		return product;
	}
	public Product deleteProduct(int pid) {
		Session session=factory.openSession();
		Product product=session.get(Product.class, pid);
		Transaction tx=session.beginTransaction();
		session.delete(product);
		tx.commit();
		return product;

	}

}
