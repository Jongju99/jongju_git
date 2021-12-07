
public class Audio implements RemotContral {
	private int volume;
	public void turnOn() {
		System.out.println("오디오를 켭니다.");
	}
	public void turnOff() {
		System.out.println("오디오를 끕니다.");
	}
	public void setVolume(int v) {
		if(v>RemotContral.MAX_VOLUME){
			this.volume=RemotContral.MAX_VOLUME;
		}else if(v<RemotContral.MIN_VOLUME) {
			this.volume=RemotContral.MIN_VOLUME;
		}else {
			this.volume=v;
		}
		System.out.println("현제오디오볼륨:"+this.volume);
	}
}
