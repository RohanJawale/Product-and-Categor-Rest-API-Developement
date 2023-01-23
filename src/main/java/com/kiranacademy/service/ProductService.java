package com.kiranacademy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kiranacademy.dao.ProductDao;
import com.kiranacademy.entity.Product;

@Service
public class ProductService {
@Autowired
ProductDao dao;
	public Product getProduct(int pid) {
		// TODO Auto-generated method stub
		return dao.getProduct(pid);
	}
	public List<Product> getAllProducts()
	{
		return dao.getAllProducts();

	}
	public Product addProduct(Product product, int cid) {
		// TODO Auto-generated method stub
		return dao.addProduct(product,cid);
	}
	public Product updateProduct(Product product) {
		return dao.updateProduct(product);
	}
	public Product deleteProduct(int pid) {
		return dao.deleteProduct(pid);
	}

}
