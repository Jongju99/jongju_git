
public class Common {
	int x;
	int y;
	int gcf, lcm;
	
	Common(){}
	Common(int x,int y){
		this.x=x;
		this.y=y;
		this.find2Number();
	}
	void find2Number(){
		int small=0;
		int big=0;
		
		if(this.x<this.y) {
			small=this.x;
			big=this.y;
		} else {
			small=this.y;
			big=this.x;
		}
		for(int n=2; n<=small; n++) {
			if(small%n==0&&big%n==0) {
				this.gcf=n;
			}
		}
//		this.gcf=1;
//		for(int n=2; n<=small; n++) {
//			if(small%n==0&&big%n==0) {
//				this.gcf=this.gcf*n;
//				small=small/n;
//				big=big/n;
//				n=1;
//				continue;
//			}
//		}
		this.lcm=(this.x*this.y)/this.gcf;
	}
	void showGCF(){
		System.out.println(this.gcf);
	}
	void showLCM(){
		System.out.println(this.lcm);
	}
	
//	int x, y, M, A;
//	Common(){}
//	Common(int x,int y){
//		this.x=x;
//		this.y=y;
//	}
//	void find2Number(){
//		for(M=2; M<x && M<y; M++) {
//			if(x%M==0 && y%M==0) {
//				this.A=1;
//				A*=M;
//				}
//		}
//	}
//	void showGCF(){
//		this.find2Number();
//		System.out.println(A);
//	}
//	void showLCM(){
//		int LCM=x*y/A;
//		System.out.println(LCM);
//	}
}
