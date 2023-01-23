package com.kiranacademy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kiranacademy.entity.Category;
import com.kiranacademy.entity.ObjectNotFoundException;
import com.kiranacademy.service.CategoryService;

@RestController
@RequestMapping("categoryapi")
public class CategoryController {

	@Autowired
	CategoryService service;
	
	 @PostMapping("saveCategory")
		Category saveCategory(@RequestBody  Category category)
		{
			System.out.println(category);
			return service.saveCategory(category);
		}
	 @PutMapping("updateCategory")
		public Category updateCategory(@RequestBody Category category)
	    {
	    	return service.updateCategory(category);
	    }
	 
	 @GetMapping("getCategory/{cid}")
	    public Category getCategory(@PathVariable int cid)
	    {
	    	   Category category =service.getCategory(cid);
	    	   System.out.println(category);
	    	   if(category==null)
	    	   {
	    		   throw new ObjectNotFoundException("No record found with cid " + cid);
	    		   
	    		   // raising exception using throw keyword
	    	   }
	    	   else
	    	   {
	    		   return category;
	    	   }
	    }
	 
	 @GetMapping("getAllCategories")
	 List<Category> getAllCategories()
	 {
		 
		 List<Category> l= service.getAllCategories();
		 for(Category c:l)
		 {
			 System.out.println(c);
		 }
		 return l;
	 }
	 @RequestMapping("deleteCategory/{cid}")
	 Category deleteCategory(@PathVariable int cid)
	 {
		 return service.deleteCategory(cid);
	 }
}
