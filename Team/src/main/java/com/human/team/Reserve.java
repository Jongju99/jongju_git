package com.human.team;

public class Reserve {
   private int code;
   private String name;
   private String tname;
   private int howmany;
   private int howmuch;
   public Reserve(int code, String name, String tname, int howmany, int howmuch) {
      this.code = code;
      this.name = name;
      this.tname = tname;
      this.howmany = howmany;
      this.howmuch = howmuch;
   }
   public Reserve() {
   }
   public int getCode() {
      return code;
   }
   public String getName() {
      return name;
   }
   public String getTname() {
      return tname;
   }
   public int getHowmany() {
      return howmany;
   }
   public int getHowmuch() {
      return howmuch;
   }
   public void setCode(int code) {
      this.code = code;
   }
   public void setName(String name) {
      this.name = name;
   }
   public void setTname(String tname) {
      this.tname = tname;
   }
   public void setHowmany(int howmany) {
      this.howmany = howmany;
   }
   public void setHowmuch(int howmuch) {
      this.howmuch = howmuch;
   }
   
}