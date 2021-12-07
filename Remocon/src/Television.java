
public class Television implements RemotContral{
	private int volume;
	public void turnOn() {
		System.out.println("TV¸¦ ÄÕ´Ï´Ù.");
	}
	public void turnOff() {
		System.out.println("TV¸¦ ²ü´Ï´Ù.");
	}
	public void setVolume(int v) {
		if(v>RemotContral.MAX_VOLUME){
			this.volume=RemotContral.MAX_VOLUME;
		}else if(v<RemotContral.MIN_VOLUME) {
			this.volume=RemotContral.MIN_VOLUME;
		}else {
			this.volume=v;
		}
		System.out.println("ÇöÁ¦TVº¼·ý:"+this.volume);
	}
}
