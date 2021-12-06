
public class PrimeNumber {

	public static void main(String[] args) {
		int total=0;
		for(int i=0; i<args.length; i++) {
			total=total+Integer.parseInt(args[i]);
			System.out.println("현재값"+args[i]);
		}
		System.out.println("합계"+total);
		
//		int i;
//		int j;
//		
//		for(i=2; i<=1000; i++) {
//			for(j=2; j<=i; j++) {
//				if(i%j==0) {
//					break;
//				}
//			}
//			if(j==i) {
//				System.out.println(i);
//			}
//		}

	}

}
