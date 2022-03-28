package com.human.drill;

public class department {
	private int did;
	private String dname;
	private String parent_name;
	private String manager_name;
	public department() {
	}
	public department(int did, String dname, String parent_name, String manager_name) {
		this.did = did;
		this.dname = dname;
		this.parent_name = parent_name;
		this.manager_name = manager_name;
	}
	public int getDid() {
		return did;
	}
	public void setDid(int did) {
		this.did = did;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getParent_name() {
		return parent_name;
	}
	public void setParent_name(String parent_name) {
		this.parent_name = parent_name;
	}
	public String getManager_name() {
		return manager_name;
	}
	public void setManager_name(String manager_name) {
		this.manager_name = manager_name;
	}
	
	
}
