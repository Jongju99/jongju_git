
public class Car {
	Tire frontLeft = new Tire(6, "�� ����");
	Tire frontRight = new Tire(2, "�� ������");
	Tire backLeft = new Tire(3, "�� ����");
	Tire backRight = new Tire(4, "�� ������");
	
	void stop() {
		System.out.println("�ڵ����� ����ϴ�.");
	}
	int run() {
		System.out.println("�ڵ����� �޸��ϴ�.");
		
		if(!frontLeft.roll()) {stop(); return 1;}
		if(!frontRight.roll()) {stop(); return 2;}
		if(!backLeft.roll()) {stop(); return 3;}
		if(!backRight.roll()) {stop(); return 4;}
		return 0;
	}
	
	//class �տ� final�� ���̸� ����� �� ����
	
}
