
public class CellPhone extends Phone {
	public CellPhone(String owner) {
		super(owner);
	}
	public void YoutubeSearch() {
		System.out.println("유튜브 검색을 합니다.");
	}
	@Override
	public void turnOn() {
		System.out.println("셀룰러폰 전원을 켭니다.");
	}
	@Override
	public void turnOff() {
		System.out.println("셀룰러폰 전원을 끕니다.");
	}
}
