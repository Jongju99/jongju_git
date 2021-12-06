
public class HankucTire extends Tire {

	public HankucTire(int maxRotation, String location) {
		super(maxRotation, location);
	}
	
	@Override
	public boolean roll() {
		++pastRotation;
		if(pastRotation<maxRotation) {
			System.out.println(location + " 한국타이어 남은수명:"+
						(maxRotation-pastRotation)+" 회");
			return true;
		} else {
			System.out.println(this.location+" 한국타이어 펑크 ***");
			return false;
		}
	}
}
