import java.util.ArrayList;
import java.util.Scanner;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

public class Menu {
   ArrayList<String> alMenu;
   ArrayList<Integer> alPrice;
   
   public Menu(){
      this.alMenu=new ArrayList<String>();
      this.alPrice=new ArrayList<Integer>();
      
      File f = new File("C:\\Temp\\menu.txt");
      try { // 파일을 제대로 읽는지 중간정검하기위함.
         FileReader fr = new FileReader(f);
         BufferedReader br = new BufferedReader(fr);
         try {
            String line=br.readLine(); //한줄씩 읽기
            while(line!=null) {
               String[] ar=line.split(" ");
               this.alMenu.add(ar[0]);
               this.alPrice.add(Integer.parseInt(ar[1]));
               line=br.readLine(); //한줄씩 읽기
            }
         } catch (IOException e) {
            e.printStackTrace();
         }
      } catch (FileNotFoundException e) {
         e.printStackTrace();
      }

   }
   
   public void display() {
      for(int i=0; i<this.alMenu.size(); i++) {
            System.out.println(this.alMenu.get(i)+" "+this.alPrice.get(i)); 
         }
   }
   void add(String menu,int price) {
      //메뉴추가받는 것
      this.alMenu.add(menu);
      this.alPrice.add(price);
      this.saveMenu();
   }
   void update(int menu_num,String menu,int price) {
      this.alMenu.set(menu_num-1, menu);
      this.alPrice.set(menu_num-1, price);
      this.saveMenu();
   }
   void remove(int menu_num) {
      this.alMenu.remove(menu_num-1);
      this.alPrice.remove(menu_num-1);
      this.saveMenu();
      }
   
   void guide() {
        System.out.println("메뉴관리(X:종료,C:메뉴추가,U:메뉴수정,D:메뉴삭제");
   }
   void saveMenu() {
      File f = new File("C:\\Temp\\menu.txt");
      try {
         FileWriter fw = new FileWriter(f);
         PrintWriter pw = new PrintWriter(fw);
         for(int i=0; i<this.alMenu.size(); i++) {
            pw.print(this.alMenu.get(i)+" "+this.alPrice.get(i)+"\n");
         }
         pw.close();
      }catch (IOException e) {
         e.printStackTrace();
      }
   }
   
   void Handling() {
        this.display();
        this.guide();
        Scanner s=new Scanner(System.in);
        String i=s.nextLine();
           while(i.equals("X")==false) {
              if(i.equals("C")) {
                 System.out.println("메뉴추가");
                 Scanner ms=new Scanner(System.in);
                 System.out.println("새로운 메뉴명을 입력하시오.");
                 String menuname=ms.nextLine();
                 System.out.println("새로운 가격을 입력하시오.");
                 int price=Integer.parseInt(ms.nextLine());
                 this.add(menuname, price);
              } else if(i.equals("U")) {
                 System.out.println("메뉴수정");
                 Scanner ms=new Scanner(System.in);
                 System.out.println("변경할 메뉴번호를 입력하시오.");
                 int menu_num=Integer.parseInt(ms.nextLine());
                 System.out.println("새로운 메뉴명을 입력하시오.");
                 String menuname=ms.nextLine();
                 System.out.println("새로운 가격을 입력하시오.");
                 int price=Integer.parseInt(ms.nextLine());
                 this.update(menu_num,menuname,price);
              } else if(i.equals("D")) {
                 System.out.println("메뉴삭제");
                 Scanner ms=new Scanner(System.in);
                 System.out.println("삭제할 메뉴 번호를 입력하세요.");
                 int menu_num=Integer.parseInt(ms.nextLine());
                 this.remove(menu_num);
              }
              this.display();
              this.guide();
              i=s.nextLine();
           }
   }
}