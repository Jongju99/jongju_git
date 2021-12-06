
public class Battel {

   public static void main(String[] args) {
      
      Soldier commando=new Soldier(12,150);
      Warrior conan=new Warrior(15,120);
      
      System.out.println("War started.");
      while(commando.getHP()>0 && 
            conan.getHP()>0) {
         try {
            int Z=(int) (Math.random() * 2);
            if(Z==0) {
               commando.attack(conan);
               Thread.sleep(500);
            } else {
               conan.attack(commando);
               Thread.sleep(500);
            }
         } catch (InterruptedException e) {
            e.printStackTrace();
         }
      }
      if(commando.getHP()>conan.getHP()) {
         System.out.println("코만도가 이겼습니다.(병사 승)");
      } else if(commando.getHP()<conan.getHP()) {
         System.out.println("코난이 이겼습니다.(전사 승)");
      } else {
         System.out.println("둘다 죽었습니다.");
      }
   }
   
}