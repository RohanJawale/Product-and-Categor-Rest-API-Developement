package com.kiranacademy.controller;

import org.apache.catalina.User;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.kiranacademy.entity.Adminuser;
import com.kiranacademy.entity.Product;


@Controller
@ComponentScan("com")
@EntityScan("com")
public class WebController {
	@Autowired
	SessionFactory factory;
	ModelAndView modelAndView = new ModelAndView();

	@RequestMapping("/")
	public String login()
	{
		return "login"; //login is the name of page 
	}
	
	@RequestMapping("/getuser")
	public ModelAndView getUser(@RequestBody Adminuser user)
	{
		Session session=factory.openSession();
		//Adminuser user=session.get(Adminuser.class, username);
		if(user.getUsername().equals("admin") && user.getUsername().equals("admin"))
		{	
			System.out.println("Inside If Block : ");
			modelAndView.setViewName("product");
		}
		else 
		{
			modelAndView.setViewName("login");
		}	
		System.out.println(modelAndView.getViewName());
		return modelAndView;

	}
	
	@RequestMapping("/categoryapi")
	public String categoryapi()
	{
		return "category"; //login is the name of page 
	}
	
	@RequestMapping("/productapi")
	public String productapi()
	{
		return "product"; //login is the name of page 
	}
	
	
	

}
