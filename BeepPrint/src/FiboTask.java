
public class FiboTask extends Thread {
	@Override
	public void run() {
		int a = 1;
        int b = 1;
        int c;
        
        System.out.println(a);
        System.out.println(b);
        
        for(c=1; c<1000; c++){
            c=a+b;
            System.out.println(c);
            a=b;
            b=c;
        }
	}
}
