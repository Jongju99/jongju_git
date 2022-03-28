package com.human.drill;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.session.SqlSession;

@Controller
public class MyController {
	/* if(hsr.getParameter("x1").equals("") || hsr.getParameter("x1")==null ||
	 * !StringUtils.isNumeric(x1) || hsr.getParameter("x2").equals("") ||
	 * hsr.getParameter("x2")==null|| !StringUtils.isNumeric(x2)) {return "input";}
	 */	

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/student")
	public String Student() {
		return "Student";
	}
	
//	@RequestMapping("/emp")
//	public String doEmpList(Model m) {
//		iEmp emp=sqlSession.getMapper(iEmp.class);
//		ArrayList<Employee> alEmp = emp.getEmpList();
//		System.out.println("size ["+alEmp.size()+"]");
//		m.addAttribute("alEmp",alEmp);
//		return "emp";
//	}
	@RequestMapping("/department")
	public String doDepartList (Model m) {
		iEmp depart=sqlSession.getMapper(iEmp.class);
		ArrayList<department> alCon = depart.getDepartList();
		System.out.println("size ["+alCon.size()+"]");
		m.addAttribute("alCon",alCon);
		return "department";
	}
	
	@RequestMapping("/typeadd")
	public String doTypeAdd() {
		return "addRType";
	}
	@RequestMapping("/addRType")
	public String doAddRtype(HttpServletRequest hsr) {
		int typecode=Integer.parseInt(hsr.getParameter("typecode"));
		String typename=hsr.getParameter("typename");
		
		iEmp emp=sqlSession.getMapper(iEmp.class);
		emp.addRType(typecode, typename);
		return "addRoom";
	}
//formtag 이용 경우
//	@RequestMapping("/roomadd")
//	public String doRoomAdd(Model model) {
//		iEmp emp=sqlSession.getMapper(iEmp.class);
//		ArrayList<Room> rl=emp.getRoomList();
//		System.out.println("size ["+rl.size()+"]");
//		model.addAttribute("rl",emp.getRoomList());
//		
//		ArrayList<Roomtype> typeList=emp.getRoomType();
//		System.out.println("type size ["+typeList.size()+"]");
//		model.addAttribute("types",typeList);
//		return "addRoom";
//	}
//	@RequestMapping("/addRoom")
//	public String doAddRoom(HttpServletRequest hsr, Model model) {
//		String strCode=hsr.getParameter("code");
//		String rname=hsr.getParameter("name");
//		String rtype=hsr.getParameter("type");
//		int howmany=Integer.parseInt(hsr.getParameter("howmany"));
//		int howmuch=Integer.parseInt(hsr.getParameter("howmuch"));
//		
//		iEmp emp=sqlSession.getMapper(iEmp.class);
//		if(strCode.equals("")) {
//			emp.addRoom(rname, rtype, howmany, howmuch);
//			System.out.println("s");
//		} else {
//			int code=Integer.parseInt(strCode);
//			emp.updateRoom(code, rname, rtype, howmany, howmuch);
//		}
//		return "redirect:/roomadd";
//	}
//	@RequestMapping("deleteRoom")
//	public String doDeleteRoom(HttpServletRequest hsr) {
//		int code=Integer.parseInt(hsr.getParameter("code"));
//		
//		iEmp emp=sqlSession.getMapper(iEmp.class);
//		emp.deleteRoom(code);
//		return "redirect:/roomadd";
//	}
	
//ajax 버전
	@RequestMapping("/roomadd")
	public String Roomadd() {
		return "addRoom";
	}
	@ResponseBody
	@RequestMapping(value="/roomlist", produces="application/json;charset=utf-8")
	public String getRoomList() {
		iEmp emp=sqlSession.getMapper(iEmp.class);
		ArrayList<Room> RoomList=emp.getRoomList();
		
		JSONArray ja = new JSONArray();
		for(int i=0; i<RoomList.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("name", RoomList.get(i).getName());
			jo.put("code", RoomList.get(i).getCode());
			jo.put("typename", RoomList.get(i).getTypename());
			jo.put("howmany", RoomList.get(i).getHowmany());
			jo.put("howmuch", RoomList.get(i).getHowmuch());
			ja.add(jo);
		}
		return ja.toString();
	}
	@ResponseBody
	@RequestMapping(value="/typeList", produces="application/json;charset=utf-8")
	public String getTypelist() {
		iEmp emp=sqlSession.getMapper(iEmp.class);
		ArrayList<Roomtype> typeList=emp.getRoomType();
		
		JSONArray ja = new JSONArray();
		for(int i=0; i<typeList.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("typename", typeList.get(i).getTypename());
			jo.put("typecode", typeList.get(i).getTypecode());
			ja.add(jo);
		}
		return ja.toString();
	}
	
//formtag 이용 경우
//	@RequestMapping("/menuadd")
//	public String doMenuAdd(Model model) {
//		iEmp emp=sqlSession.getMapper(iEmp.class);
//		ArrayList<Menu> ml=emp.getMenuList();
//		System.out.println("size ["+ml.size()+"]");
//		model.addAttribute("ml",ml);
//		return "addMenu";
//	}
	@RequestMapping("/addMenu")
	public String doAddMenu(HttpServletRequest hsr) {
		String strCode=hsr.getParameter("code");
		String mname=hsr.getParameter("menu_name");
		int price=Integer.parseInt(hsr.getParameter("price"));
		
		iEmp emp=sqlSession.getMapper(iEmp.class);
		if(strCode.equals("")) {
			emp.addMenu(mname, price);
		} else {
			int code=Integer.parseInt(strCode);
			emp.updateMenu(code, mname, price);
		}
		return "redirect:/menuadd";
	}
	@RequestMapping("deleteMenu")
	public String doDeleteMenu(HttpServletRequest hsr) {
		int code=Integer.parseInt(hsr.getParameter("code"));
		
		iEmp emp=sqlSession.getMapper(iEmp.class);
		emp.deleteMenu(code);
		return "redirect:/menuadd";
	}
	
	
//ajax 버전
	@RequestMapping("/menuadd")
	public String MenuAdd() {
		return "addMenu";
	}
	@ResponseBody
	@RequestMapping(value="/menulist", produces="application/json;charset=utf-8")
	public String getMenuList() {
		iEmp emp=sqlSession.getMapper(iEmp.class);
		ArrayList<Menu> MenuList=emp.getMenuList();
		
		JSONArray ja = new JSONArray();
		for(int i=0; i<MenuList.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("name", MenuList.get(i).getName());
			jo.put("code", MenuList.get(i).getCode());
			jo.put("price", MenuList.get(i).getPrice());
			ja.add(jo);
		}
		return ja.toString();
	}
	
	
	@RequestMapping(value="/look",method=RequestMethod.GET)
	public String look(HttpServletRequest hsr, Model model) {
		model.addAttribute("mobile","010-8012-7716");
		return "look";
	}

	@RequestMapping(value="/input",method=RequestMethod.GET)
	public String input() {
		return "input";
	}
	@RequestMapping(value="/calc",method=RequestMethod.GET)
	public String calc(HttpServletRequest hsr, Model model) {
		try {
			int x1=Integer.parseInt(hsr.getParameter("x1"));
			int x2=Integer.parseInt(hsr.getParameter("x2"));
			String sim=hsr.getParameter("simbol");
			
			if(sim.equals("+(plus)")) {
				model.addAttribute("x", x1+x2);
				return "plus";
			} else if(sim.equals("-(minus)")) {
				model.addAttribute("x", x1-x2);
				return "minus";
			} else if(sim.equals("x(multiply)")) {
				model.addAttribute("x", x1*x2);
				return "multi";
			} else if(sim.equals("/(divide)")) {
				model.addAttribute("x", x1/x2);
				return "divide";
			} else {
				model.addAttribute("x", "error");
				return "error";
			}
		} catch(Exception e) {
			model.addAttribute("x", "error");
			return "error";
		}
	}
	
	@RequestMapping(value="/emplist")
	public String Emplist() {
		return "emplist";
	}
	@ResponseBody
	@RequestMapping(value="/empview", produces="application/json;charset=utf-8")
	public String getEmplist(HttpServletRequest hsr) {
		String keyword=hsr.getParameter("kw");
		if(keyword.equals("")) return "emplist";
		
		
		iEmp emp=sqlSession.getMapper(iEmp.class);
		ArrayList<Employee> EmpList=emp.getEmpList(Integer.parseInt(keyword));
		
		JSONArray ja = new JSONArray();
		for(int i=0; i<EmpList.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("employee_id", EmpList.get(i).getEmployee_id());
			jo.put("emp_name", EmpList.get(i).getEmp_name());
			jo.put("phone_number", EmpList.get(i).getPhone_number());
			jo.put("manager_id", EmpList.get(i).getManager_id());
			jo.put("hire_date", EmpList.get(i).getHire_date());
			ja.add(jo);
		}
		return ja.toString();
	}
	
	@RequestMapping(value="/job")
	public String doJob(Model model) {
		iJob job=sqlSession.getMapper(iJob.class);
		ArrayList<job> jl=job.jobList();
		System.out.println("size ["+jl.size()+"]");
		model.addAttribute("jl",jl);
		return "job";
	}
	
	@ResponseBody
	@RequestMapping(value="/jobview", produces="application/json;charset=utf-8")
	public String View(HttpServletRequest hsr) {
		String Jobid=hsr.getParameter("Jid");
		if(Jobid.equals("")) return "job";
		
		iJob job=sqlSession.getMapper(iJob.class);
		ArrayList<empdepart> JobList=job.getList(Jobid);
		
		JSONArray ja = new JSONArray();
		for(int i=0; i<JobList.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("employee_id", JobList.get(i).getEmployee_id());
			jo.put("emp_name", JobList.get(i).getEmp_name());
			jo.put("phone_number", JobList.get(i).getPhone_number());
			jo.put("department_id", JobList.get(i).getDepartment_id());
			ja.add(jo);
		}
		return ja.toString();
	}
	
	@RequestMapping(value="/dept")
	public String doDept(Model model) {
		iJob job=sqlSession.getMapper(iJob.class);
		ArrayList<dept> jl=job.deptList();
		System.out.println("size ["+jl.size()+"]");
		model.addAttribute("jl",jl);
		return "dept";
	}
	
	@ResponseBody
	@RequestMapping(value="/deptview", produces="application/json;charset=utf-8")
	public String Views(HttpServletRequest hsr) {
		String Deptid=hsr.getParameter("Did");
		if(Deptid.equals("")) return "dept";
		
		iJob job=sqlSession.getMapper(iJob.class);
		ArrayList<empinfo> JobList=job.getList2(Integer.parseInt(Deptid));
		
		JSONArray ja = new JSONArray();
		for(int i=0; i<JobList.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("employee_id", JobList.get(i).getEmployee_id());
			jo.put("emp_name", JobList.get(i).getEmp_name());
			jo.put("phone_number", JobList.get(i).getPhone_number());
			jo.put("salary", JobList.get(i).getSalary());
			ja.add(jo);
		}
		return ja.toString();
	}
	@RequestMapping(value="/manager")
	public String doManager(Model model) {
		iJob job=sqlSession.getMapper(iJob.class);
		ArrayList<manager> ml=job.manaList();
		System.out.println("size ["+ml.size()+"]");
		model.addAttribute("ml",ml);
		return "manager";
	}
	@ResponseBody
	@RequestMapping(value="/manaview", produces="application/json;charset=utf-8")
	public String Viewsm(HttpServletRequest hsr) {
		String Mid=hsr.getParameter("Mid");
		if(Mid.equals("")) return "manager";
		
		iJob job=sqlSession.getMapper(iJob.class);
		ArrayList<empimfo> JobList=job.getList3(Integer.parseInt(Mid));
		
		JSONArray ja = new JSONArray();
		for(int i=0; i<JobList.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("employee_id", JobList.get(i).getEmployee_id());
			jo.put("emp_name", JobList.get(i).getEmp_name());
			jo.put("phone_number", JobList.get(i).getPhone_number());
			jo.put("salary", JobList.get(i).getSalary());
			ja.add(jo);
		}
		return ja.toString();
	}
}
