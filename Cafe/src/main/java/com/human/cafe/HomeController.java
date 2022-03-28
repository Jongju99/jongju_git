package com.human.cafe;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.human.cafe.iCafe;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	   private SqlSession sqlSession;
	   
	   /**
	    * Simply selects the home view to render by returning its name.
	    */
	   @RequestMapping(value = "/", method = RequestMethod.GET)
	   public String home(Model model) {
	      iCafe cafe=sqlSession.getMapper(iCafe.class);
	      model.addAttribute("ml",cafe.getMenuList());
	      model.addAttribute("sl",cafe.getSales());
	      return "home";
	   }
	   @ResponseBody
	   @RequestMapping(value="/list",method=RequestMethod.POST, produces="application/json;charset=utf-8")
	   public String list() {
	      iCafe cafe=sqlSession.getMapper(iCafe.class);
	      ArrayList<Menu> ml=cafe.getMenuList();
	      JSONArray ja=new JSONArray();
	      for(int i=0; i<ml.size(); i++) {
	         JSONObject jo=new JSONObject();
	         jo.put("code",ml.get(i).getCode());
	         jo.put("name",ml.get(i).getName());
	         jo.put("price", ml.get(i).getPrice());
	         ja.add(jo);
	      }
	      return ja.toString();
	   }
	   @ResponseBody
	   @RequestMapping(value="/insertMenu",method=RequestMethod.POST,
               produces="application/json;charset=utf-8")
	   public String insertMenu(HttpServletRequest hsr) {
		   String retval="";
			try {
				String name=hsr.getParameter("name");
				int price=Integer.parseInt(hsr.getParameter("price"));
				
				iCafe cafe=sqlSession.getMapper(iCafe.class);
				cafe.insertMenu(name,price);
				retval="ok";
			} catch(Exception e) {
				retval="fail";
			}
			return retval;
		}
	   @ResponseBody
	   @RequestMapping(value="/updateMenu",method=RequestMethod.POST,
               produces="application/json;charset=utf-8")
	   public String updateMenu(HttpServletRequest hsr) {
		   String retval="";
			try {
				int code=Integer.parseInt(hsr.getParameter("code"));
				String name=hsr.getParameter("name");
				int price=Integer.parseInt(hsr.getParameter("price"));
				
				iCafe cafe=sqlSession.getMapper(iCafe.class);
				cafe.updateMenu(code, name, price);
				retval="ok";
			} catch(Exception e) {
				retval="fail";
			}
			return retval;
		}
	   @ResponseBody
	   @RequestMapping(value="/deleteMenu",method=RequestMethod.POST,
               produces="application/json;charset=utf-8")
	   public String deleteMenu(HttpServletRequest hsr) {
			String retval="";
			try {
				int code=Integer.parseInt(hsr.getParameter("code"));
				
				iCafe cafe=sqlSession.getMapper(iCafe.class);
				cafe.deleteMenu(code);
				retval="ok";
			} catch(Exception e) {
				retval="fail";
			}
			return retval;
		}
	   @ResponseBody
	   @RequestMapping(value="/insertSales",method=RequestMethod.POST,
			   	produces="application/jason;charset=utf-8")
	   public String insertSales(HttpServletRequest hsr) {
		   String retval="";
		   try {
			   int menu_code=Integer.parseInt(hsr.getParameter("menu_code"));
			   int qty=Integer.parseInt(hsr.getParameter("qty"));
			   int price=Integer.parseInt(hsr.getParameter("price"));
			   String mobile=hsr.getParameter("mobile");
			   
			   iCafe cafe=sqlSession.getMapper(iCafe.class);
			   cafe.insertSales(menu_code,qty,price,mobile);
			   retval="ok";
		   } catch(Exception e) {
			   retval="fail";
		   }
		   return retval;
	   }
	   @ResponseBody
		@RequestMapping(value="/salesMenu",method=RequestMethod.POST,
				produces="application/json;charset=utf-8")
		public String salesMenu() {
			iCafe cafe=sqlSession.getMapper(iCafe.class);
			ArrayList<sales> ml=cafe.salesMenu();
			JSONArray ja=new JSONArray();
			for(int i=0; i<ml.size(); i++) {
				JSONObject jo=new JSONObject();
				jo.put("name",ml.get(i).getName());
				jo.put("total", ml.get(i).getTotal());
				ja.add(jo);
			}
			return ja.toString(); // JSON format data
		}
		@ResponseBody
		@RequestMapping(value="/salesMobile",method=RequestMethod.POST,
				produces="application/json;charset=utf-8")
		public String salesMobile() {
			iCafe cafe=sqlSession.getMapper(iCafe.class);
			ArrayList<sales> ml=cafe.salesMobile();
			JSONArray ja=new JSONArray();
			for(int i=0; i<ml.size(); i++) {
				JSONObject jo=new JSONObject();
				jo.put("mobile",ml.get(i).getName());
				jo.put("total", ml.get(i).getTotal());
				ja.add(jo);
			}
			return ja.toString(); // JSON format data
		}

}
