package com.human.team;

import java.util.ArrayList;

public interface iTeam {
	ArrayList<Roomtype> getroomType();
	ArrayList<RoomList> getroomList();
	void typeAdd(String typename);
	void RoomAdd(String roomname,int roomtype,int howmany,int howmuch);
	void typeDelete(int typecode);
	void roomDelete(int roomcode);
	void typeupdate(int code,String typename);
	void Roomupdate(int code,String roomname,int roomtype,int howmany,int howmuch);
	void logoutMember(String userid);
	
	ArrayList<Roomtype> getRoomtype();
	ArrayList<Reserve> getReserve(int howmany,int type,String date3,String date4);
	ArrayList<Book> getBookList();
	ArrayList<Rcode> getRoomcode();
	
	void insertBook(int roomcode,String date3,String date4,int howmany,String guest,String mobile,int howmuch,String member_id);
	void updateBook(int book_id,int roomcode,String date3,String date4,int howmany,String guest,String mobile,int howmuch,String member_id);
	void deleteBook(int book_id);
	
	ArrayList<Member> getMember();
	void signCheck(String name,	String gender, String userid, String passcode, String mobile, String type);
	void quitMember(String userid);
	
	ArrayList<Member> getMemberList();
	ArrayList<Member> getTypeList();
	void UpdateMember(String userid);
	
	//게시판
	ArrayList<Notice> getPaging();
    void plusViewCnt(int id);
    Notice getView(int id);
    void writeNotice(String title, String name, String content);
    void deleteNotice(int notice_id);
    void updateNotice(int id, String title, String name, String content);

    ArrayList<Notice> PagingList(int start, int end);
    
    //예약조회
    ArrayList<Book> trackbklist(String userid);
}
