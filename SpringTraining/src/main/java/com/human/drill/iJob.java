package com.human.drill;

import java.util.ArrayList;

public interface iJob {
	ArrayList<job> jobList();
	ArrayList<empdepart> getList(String Jid);
	
	ArrayList<dept> deptList();
	ArrayList<empinfo> getList2(int Did);
	
	ArrayList<manager> manaList();
	ArrayList<empimfo> getList3(int Mid);
}
