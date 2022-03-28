package com.human.drill;

public class manager {
	private int manager_id;
	private String emp_name;
	public manager() {
	}
	public manager(int manager_id, String emp_name) {
		this.manager_id = manager_id;
		this.emp_name = emp_name;
	}
	public int getManager_id() {
		return manager_id;
	}
	public void setManager_id(int manager_id) {
		this.manager_id = manager_id;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	
}
