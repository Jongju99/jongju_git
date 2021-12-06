import java.util.Scanner;

public class CafeControl {

   public static void main(String[] args) {
      Menu menu=new Menu();
      Order order=new Order();
     
     System.out.println("프로그램 시작");
      System.out.println("작업을 선택하시오.(X:종료,M:메뉴관리,O:주문관리,S:실적관리)");
      
      Scanner s=new Scanner(System.in);
      String i=s.nextLine();
         while(i.equals("X")==false) {
           if(i.equals("M")) {
               menu.Handling();
            } else if(i.equals("O")) {
               order.Handling(menu);
            } else if(i.equals("S")) {
               order.dispaly();
            } else {
            }
            System.out.println("작업을 선택하시오.(X:종료,M:메뉴관리,O:주문관리,S:실적관리)");
            i=s.nextLine();
         }
         System.out.println("프로그램 종료");
   } 
}