
public class RemotControlSample {

	public static void main(String[] args) {
		Television tv = new Television();
		
		tv.turnOn();
		tv.setVolume(7);
		tv.turnOff();
		
		Audio audio = new Audio();
		
		audio.turnOn();
		audio.setVolume(6);
		audio.turnOff();

	}

}
