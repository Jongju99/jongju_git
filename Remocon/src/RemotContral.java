
public interface RemotContral {
	//필드가 없다.(변수가 없다). 상수선언 가능.(사실상 변수)
	int MAX_VOLUME=10;
	int MIN_VOLUME=0;
	// 생성자가 없다. -> new연산자를 사용할 수 없다.
	//메소드만 있다.(추상메소드/디폴트메소드/정직메소드)
	void turnOn();//추상메소드
	void turnOff();
	void setVolume(int volume);
	//디폴트(기본) 메소드 - 일반 클래스의 일반 메소드
	default void setMute(boolean mute) {
		//일반클래스의 일반메소드와 동일
		if(mute) {
			System.out.println("무음처리합니다.");
		} else {
			System.out.println("무음해제합니다.");
		}
	}
	static void changeBettery() {
		System.out.println("건전지를 교환합니다.");
	}
}
