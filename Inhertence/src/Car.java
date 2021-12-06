
public class Car {
	Tire frontLeft = new Tire(6, "앞 왼쪽");
	Tire frontRight = new Tire(2, "앞 오른쪽");
	Tire backLeft = new Tire(3, "뒤 왼쪽");
	Tire backRight = new Tire(4, "뒤 오른쪽");
	
	void stop() {
		System.out.println("자동차가 멈춥니다.");
	}
	int run() {
		System.out.println("자동차가 달립니다.");
		
		if(!frontLeft.roll()) {stop(); return 1;}
		if(!frontRight.roll()) {stop(); return 2;}
		if(!backLeft.roll()) {stop(); return 3;}
		if(!backRight.roll()) {stop(); return 4;}
		return 0;
	}
	
	//class 앞에 final을 붙이면 상속할 수 없음
	
}
