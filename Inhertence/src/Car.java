
public class Car {
	Tire[] tires= {
			new Tire(6, "�� ����"),
			new Tire(2, "�� ������"),
			new Tire(3, "�� ����"),
			new Tire(4, "�� ������")
	};
	
//	Tire frontLeft
//	Tire frontRight
//	Tire backLeft
//	Tire backRight
	
	public Car() {
//		 frontLeft = new Tire(6, "�� ����");
//		 frontRight = new Tire(2, "�� ������");
//		 backLeft = new Tire(3, "�� ����");
//		 backRight = new Tire(4, "�� ������");
		
	}
	
	void stop() {
		System.out.println("�ڵ����� ����ϴ�.");
	}
	int run() {
		System.out.println("�ڵ����� �޸��ϴ�.");
		for(int i=0; i<tires.length; i++) {
			if(!tires[i].roll()) {stop(); return i+1;}
		}
//		if(!frontLeft.roll()) {stop(); return 1;}
//		if(!frontRight.roll()) {stop(); return 2;}
//		if(!backLeft.roll()) {stop(); return 3;}
//		if(!backRight.roll()) {stop(); return 4;}
		return 0;
	}
	
	//class �տ� final�� ���̸� ����� �� ����
	
}
