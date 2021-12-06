import java.util.ArrayList;
import java.util.Scanner;

public class Order {
   ArrayList<String> alMobile;
   ArrayList<String> alMenuname;
   ArrayList<Integer> alQty;
   ArrayList<Integer> alSum;
   Scanner s;
   
   Order(){
      this.alMobile=new ArrayList<String>();
      this.alMenuname=new ArrayList<String>();
      this.alQty=new ArrayList<Integer>();
      this.alSum=new ArrayList<Integer>();
      this.s=new Scanner(System.in);
   }
   
   void add(String mobile, String menuname, int qty, int sum) {
      this.alMobile.add(mobile);
      this.alMenuname.add(menuname);
      this.alQty.add(qty);
      this.alSum.add(sum);
   }
   void remove(int n) {
      n--;
      this.alMobile.remove(n);
      this.alMenuname.remove(n);
      this.alQty.remove(n);
      this.alSum.remove(n);
   }
   void update(int n, String mobile, String menuname, int qty, int sum) {
      n--;
      this.alMobile.set(n, mobile);
      this.alMenuname.set(n, menuname);
      this.alQty.set(n, qty);
      this.alSum.set(n, sum);
   }
   void dispaly() {
      for(int i=0; i<this.alMobile.size(); i++) {
            System.out.println(this.alMobile.get(i)+" "+this.alMenuname.get(i)
                              +" "+this.alQty.get(i)+" "+this.alSum.get(i)); 
         }
   }
   void Handling(Menu menu) {
      menu.display();
        
      int menu_num=this.getInput(menu); //메뉴표시, 메뉴번호 읽음
      while(menu_num!=0) {
         System.out.println("메뉴의 수량을 입력하세요.");
         int qty=Integer.parseInt(s.nextLine());
         menu_num--;
         this.add(menu.alMenu.get(menu_num), qty, menu.alPrice.get(menu_num)*qty);
         this.showOrder();   
         
         menu_num=this.getInput(menu); //메뉴표시, 메뉴번호 읽음
      }
      int start_ndx=this.addMobile();
      int total=0;
      for(int i=start_ndx; i<this.alMenuname.size(); i++) {
         System.out.println((i+1)+"."+this.alMobile.get(i)+","+this.alMenuname.get(i)+","+this.alQty.get(i)+","+this.alSum.get(i));         
         total+=this.alSum.get(i);
      }
      System.out.println("총주문금액:"+sum);
      System.out.println("-----------------------");
   }
   
   void showOrder() {
      int n=this.alMenuname.size()-1;
      System.out.println(this.alMenuname.get(n)+" x"+this.alQty.get(n)+", "+this.alSum.get(n));
   }
   int getInput(Menu m) {
      m.display();
        System.out.println("주문할 메뉴번호를 입력하세요. (0:주문종료)");
        return Integer.parseInt(this.s.nextLine());
   }
   int addMobile() {
      System.out.println("모바일 번호를 입력하세요.");
      String mobile=this.s.nextLine();
      if(mobile.equals("")) mobile="-";
      int start_ndx=this.alMobile.size();
      for(int i=this.alMobile.size(); i<this.alMenuname.size(); i++) {
         this.alMobile.add(mobile);
      }
      return start_ndx;      
   }
}
