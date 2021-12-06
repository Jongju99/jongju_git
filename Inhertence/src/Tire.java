
public class Tire {
	public int maxRotation;
	public int pastRotation;
	public String location;

	public Tire() {
	}

	public Tire(int maxRotation, String location) {
		this.maxRotation = maxRotation;
		this.location = location;
	}
	public boolean roll() {
		++pastRotation;
		if(pastRotation<maxRotation) {
			System.out.println(location + " Tire ¼ö¸í:"+
						(maxRotation-pastRotation)+" È¸");
			return true;
		} else {
			System.out.println(this.location+" Tire ÆãÅ© ***");
			return false;
		}
	}
}
