package com.human.edu;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "home"; //jsp file 이름
	}
	
	@RequestMapping("/login")
	public String login(Model m) {
		
		m.addAttribute("userid", "jong07050" );
		m.addAttribute("passcode", "human123");
		
		return "login";
	}
	@RequestMapping("/signon")
	public String signon(Model m) {
		
		m.addAttribute("userid", "jong07050" );
		/*m.addAttribute("passcode", "human123");*/
		
		return "signon";
	}
	
	@RequestMapping("/doLogin/{id}/{pw}")
	public String doLogin(@PathVariable("id") String id,
						  @PathVariable("pw") String pw,
						  Model model) {
		if(id.equals("")) {
			return "login";
		}
		else {
			model.addAttribute("userid",id);
			model.addAttribute("passcode",pw);
			return "home";
		}
	}
	
	/*
	 * @RequestMapping("/doLogin") public String doLogin(HttpServletRequest hsr,
	 * Model model) { String userid=hsr.getParameter("userid");
	 * if(userid.equals("")) { return "login"; } else {
	 * model.addAttribute("id",userid); return "home"; } }
	 */
	
	@RequestMapping("/signCheck")
	public String signCheck(@ModelAttribute("m") Member member) {
		return "personal";
	}
	/*
	 * public String signCheck(HttpServletRequest hsr, Model model) { String
	 * userid=hsr.getParameter("userid"); model.addAttribute("id",userid); String
	 * name=hsr.getParameter("name"); if(name.equals("")) { return "signon"; } else
	 * { return "login"; } }
	 */
	
	@RequestMapping("/logout")
	public String logout() {
		return "home";
	}
	

}
