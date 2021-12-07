
public class SmartPhone extends Phone {
	public SmartPhone(String owner) {
		super(owner);
	}
	public void InternetSearch() {
		System.out.println("인터넷 검색을 합니다.");
	}
	@Override
	public void turnOn() {
		System.out.println("스마트폰 전원을 켭니다.");
	}
	@Override
	public void turnOff() {
		System.out.println("스마트폰 전원을 끕니다.");
	}
}
