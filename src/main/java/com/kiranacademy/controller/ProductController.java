package com.kiranacademy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kiranacademy.entity.Product;
import com.kiranacademy.service.ProductService;

@RestController
@RequestMapping("productapi")
public class ProductController {

	@Autowired
	ProductService service;
	@GetMapping("getproduct/{pid}")
	Product getProduct(@PathVariable int pid)
	{
		System.out.println("Inside getProduct Methods of ProductController ");
		Product p=service.getProduct(pid);
		System.out.println("Product is : "+p);
		return p;
	}
	@RequestMapping("getallproducts")
	public List<Product> getAllProducts()
	{
		return service.getAllProducts();

	}
	
	@PostMapping("saveproduct/{cid}")
	Product addProduct(@RequestBody Product product ,@PathVariable int cid)
	{
		System.out.println("Inside addProduct Methods of ProductController ");
		return service.addProduct(product,cid);
	}
	
	@PutMapping("updateproduct")
	Product updateProduct(@RequestBody Product product)
	{
		return service.updateProduct(product);
	}
	
	@DeleteMapping("deleteProduct/{pid}")
	Product deleteProduct(@PathVariable int pid)
	{
		System.out.println("Inside DeleteProduct ");
		return service.deleteProduct(pid);
	}
	
}
