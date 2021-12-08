
public class MyHome {

	public static void main(String[] args) {
//		String str="*";
//		int i=1, j=0;
		
//		while(i<10) {
//		while(j<i) {
//			System.out.print(str);
//			j++;
//		}
//		j=0;
//		System.out.println();
//		i++;
//		}
//		while(i>0) {
//		while(j<i) {
//			System.out.print(str);
//			j++;
//		}
//		j=0;
//		System.out.println();
//		i--;
//		}
		
		int limit=10;
		int x;
		int i;
		
		for(x=1; x<=limit; x++) {
			for(i=0; i<x; i++) {
				System.out.print("*");
			}
			System.out.println("");
		}
		for(x=limit-1; x>=1; x--) {
			for(i=0; i<x; i++) {
				System.out.print("*");
			}
			System.out.println("");
		}
	}

}
