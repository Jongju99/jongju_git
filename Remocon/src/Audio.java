
public class Audio implements RemotContral {
	private int volume;
	public void turnOn() {
		System.out.println("������� �մϴ�.");
	}
	public void turnOff() {
		System.out.println("������� ���ϴ�.");
	}
	public void setVolume(int v) {
		if(v>RemotContral.MAX_VOLUME){
			this.volume=RemotContral.MAX_VOLUME;
		}else if(v<RemotContral.MIN_VOLUME) {
			this.volume=RemotContral.MIN_VOLUME;
		}else {
			this.volume=v;
		}
		System.out.println("�������������:"+this.volume);
	}
}
