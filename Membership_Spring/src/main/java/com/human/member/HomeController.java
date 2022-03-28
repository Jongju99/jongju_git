package com.human.member;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.human.member.iMember;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
	
/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	   private SqlSession sqlSession;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "home";
	}

	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	@RequestMapping("/signon")
	public String signon() {
		return "signon";
	}

	@RequestMapping(value="/signCheck",method=RequestMethod.POST,produces="application/jason;charset=utf-8")
	public String signCheck(HttpServletRequest hsr) {
		try {
				String name=hsr.getParameter("name");
			   	String gender=hsr.getParameter("gender");
				String userid=hsr.getParameter("userid");
				String passcode=hsr.getParameter("passcode");
				String mobile=hsr.getParameter("mobile");
				String[] interest=hsr.getParameterValues("interest");
				String strinterest=Arrays.toString(interest);
				
			iMember Member=sqlSession.getMapper(iMember.class);
			Member.signCheck(name,gender,userid,passcode,mobile,strinterest);

			return "login";
		} catch(Exception e) {
			System.out.println(e.getMessage());
			return "signon";
		}
	}

	@ResponseBody
	@RequestMapping(value="/idCheck",method=RequestMethod.POST,produces="application/json;charset=utf-8") 
	public String idCheck(HttpServletRequest hsr) {
			iMember member=sqlSession.getMapper(iMember.class); 
			ArrayList<Member> mem=member.getMember();
			JSONArray ja=new JSONArray();
		      for(int i=0; i<mem.size(); i++) {
		         JSONObject jo=new JSONObject();
		         jo.put("userid",mem.get(i).getUserid());
		         ja.add(jo);
		      }
		      return ja.toString();
	}
	
	
	@RequestMapping(value="/loginCheck",method=RequestMethod.GET, produces="application/json;charset=utf-8")
	public String loginCheck(HttpServletRequest hsr,Model model) {
		String userid=hsr.getParameter("userid");
		String passcode=hsr.getParameter("passcode");
		
		iMember member=sqlSession.getMapper(iMember.class);
		ArrayList<Member> m=member.getMember();
		String flag="";
		for(int i=0;i<m.size();i++) {
			if(m.get(i).userid.equals(userid) && m.get(i).passcode.equals(passcode)) {
				flag="ok";
				break;
			}
			flag="fail";
		}
		if(flag.equals("fail")) { 
			model.addAttribute("id","일치하지 않습니다"); 
			return "login"; 
		}
		member.loginCheck(userid);
		model.addAttribute("id",userid); 
		return "home";
	}
	
	@RequestMapping(value="/logout",method=RequestMethod.GET, produces="application/json;charset=utf-8")
	public String logout(HttpServletRequest hsr) {
		String userid=hsr.getParameter("userid");
		iMember member=sqlSession.getMapper(iMember.class);
		member.logout(userid);
		return "home";
	}
}
