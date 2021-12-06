
public class Warrior {
   private int AP;
   private int HP;
   
   public Warrior() {
   }
   public Warrior(int AP, int HP) {
      this.AP = AP;
      this.HP = HP;
   }
   
   public int getAP() {
      return AP;
   }
   
   public int getHP() {
      return HP;
   }
   
   public void setAP(int AP) {
      this.AP = AP;
   }
   
   public void setHP(int AP) {
      this.HP-=AP;
      System.out.println("전사의 남은 체력:"+this.HP);
   }
   
   public void attack(Soldier s) {
      int AP=(int)(Math.random()*this.AP);
      System.out.println("전사의 공격력:"+AP);
      s.setHP(AP);
   }
   
}