
public abstract class Phone {
	//추상 메소드와 Overriding
	//추상클래스<-추상메소드선언<-오버라이딩을 부담없이.
	
	public String owner;
	
	public Phone(String owner) {
		this.owner=owner;
	}
	public abstract void turnOn();
	public abstract void turnOff();
	
//	public void turnOn() {
//		System.out.println("폰 전원을 켭니다.");
//	}
//	public void turnOff() {
//		System.out.println("폰 전원을 끕니다.");
//	} //메모리차지
	
}
