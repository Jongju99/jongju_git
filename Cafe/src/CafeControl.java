import java.util.Scanner;

public class CafeControl {

   public static void main(String[] args) {
      Menu menu=new Menu();
      Order order=new Order();
     
     System.out.println("���α׷� ����");
      System.out.println("�۾��� �����Ͻÿ�.(X:����,M:�޴�����,O:�ֹ�����,S:��������)");
      
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
            System.out.println("�۾��� �����Ͻÿ�.(X:����,M:�޴�����,O:�ֹ�����,S:��������)");
            i=s.nextLine();
         }
         System.out.println("���α׷� ����");
   } 
}