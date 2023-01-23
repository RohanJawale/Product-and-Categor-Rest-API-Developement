package com.kiranacademy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kiranacademy.dao.CategoryDao;
import com.kiranacademy.entity.Category;


@Service
public class CategoryService {
	@Autowired
	CategoryDao dao;
	
	public Category saveCategory(Category category)
	{
		
		
		return dao.saveCategory( category);
		
	}

	public Category updateCategory(Category category) {
		// TODO Auto-generated method stub
		return dao.updateCategory( category);
	}
	
	public Category getCategory(int cid)
	{
		return dao.getCategory(cid);

	}

	public List<Category> getAllCategories() {
		return dao.getAllCategories();
	}

	public Category deleteCategory(int cid) {

		return dao.deleteCategory(cid);
	}
}
