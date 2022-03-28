package com.human.member;

import java.util.ArrayList;

public interface iMember {
	void signCheck(String name,	String gender, String userid, String passcode, String mobile, String interest);
	void loginCheck(String userid);
	void logout(String userid);
	ArrayList<Member> getMember();
}