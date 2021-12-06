import java.util.Scanner;

public class MyComputer {

	public static void main(String[] args) {

		int i=0;
		int j;
		Scanner s=new Scanner(System.in);
		Scanner si=new Scanner(System.in);
		i=Integer.parseInt(s.nextLine());
			i=si.nextInt();
		
		System.out.println("-----"+i+"´Ü-----");
		for(j=1; j<10; j++) {
			System.out.println(i+"x"+j+"="+(i*j));
		}
//		for(i=2; i<10; i++) {
//		System.out.println("-----"+i+"´Ü-----");
	//		for(j=1; j<10; j++) {
	//			System.out.println(i+"x"+j+"="+(i*j));
		//				}
		//	}
		//	Scanner s=new Scanner(System.in);
		//	int n=Integer.parseInt(s.nextLine());
		//		n=s.nextInt();
		
		int[] ar= {1,2,9,26,-3,-65};
		
		int ar1[] ={1,2,9,26,-3,-65};
		String ars[]= {"Hello","world","Le Monde","NY Times"};
		System.out.println(ars[0]);
		System.out.println(ars[1]);
		
		int[] ar2=null;
		ar2=new int[] {1,2,9,26,-3,-65};
		
		int[] ar3=new int[] {1,2,9,26,-3,-65};
		

}
}
