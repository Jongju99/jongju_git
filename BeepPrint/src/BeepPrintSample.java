//import java.awt.Toolkit;

public class BeepPrintSample {

	public static void main(String[] args) {
//		Toolkit tk = Toolkit.getDefaultToolkit();
		
		Thread btn1 = new BeepTask1();
		btn1.start();
//		Runnable bt = new BeepTask(); //Thread 동시에 실행하기
//		Thread thread = new Thread(bt);
//		thread.start();
		
		Thread fbt = new FiboTask();
		fbt.start();
//		Runnable pt = new PibonachiTask();
//		Thread thread1 = new Thread(pt);
//		thread1.start();
		
		for(int i=0; i<5; i++) {
			System.out.println("AAAAA");
			try {
				Thread.sleep(500);
			} catch (InterruptedException e) {}
		}
//		for(int i=0; i<5; i++) {
//			System.out.println("띵");
//			try {
//				Thread.sleep(500);
//			} catch (InterruptedException e) {}
//		}

	}

}
