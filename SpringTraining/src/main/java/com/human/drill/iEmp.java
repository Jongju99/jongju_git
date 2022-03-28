package com.human.drill;

import java.util.ArrayList;

public interface iEmp {
	ArrayList<Employee> getEmpList(int keyword);
	ArrayList<Country> getContList();
	ArrayList<department> getDepartList();
	
	ArrayList<Room> getRoomList();
	void addRoom(String name, String type, int howmany, int howmuch);
	void updateRoom(int code, String name, String type, int howmany, int howmuch);
	void deleteRoom(int code);
	
	ArrayList<Roomtype> getRoomType();
	void addRType(int typecode, String typename);
	
	ArrayList<Menu> getMenuList();
	void addMenu(String menu_name, int price);
	void updateMenu(int code, String name, int price);
	void deleteMenu(int code);
}
