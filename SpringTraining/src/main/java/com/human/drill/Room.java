package com.human.drill;

public class Room {
	private int code;
	private String name;
	private String typename; 
	private int howmany; 
	private int howmuch;
	public Room() {
	}
	public Room(int code, String name, String typename, int howmany, int howmuch) {
		this.code = code;
		this.name = name;
		this.typename = typename;
		this.howmany = howmany;
		this.howmuch = howmuch;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	public int getHowmany() {
		return howmany;
	}
	public void setHowmany(int howmany) {
		this.howmany = howmany;
	}
	public int getHowmuch() {
		return howmuch;
	}
	public void setHowmuch(int howmuch) {
		this.howmuch = howmuch;
	}
	
}
