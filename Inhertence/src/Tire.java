
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
			System.out.println(location + " Tire ����:"+
						(maxRotation-pastRotation)+" ȸ");
			return true;
		} else {
			System.out.println(this.location+" Tire ��ũ ***");
			return false;
		}
	}
}
