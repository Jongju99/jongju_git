
public class KumhoTire extends Tire {
	
	public KumhoTire(int maxRotation, String location) {
		super(maxRotation, location);
	}
	
	@Override
	public boolean roll() {
		++pastRotation;
		if(pastRotation<maxRotation) {
			System.out.println(location + " 금호타이어 남은수명:"+
						(maxRotation-pastRotation)+" 회");
			return true;
		} else {
			System.out.println(this.location+" 금호타이어 펑크 ***");
			return false;
		}
	}
}
