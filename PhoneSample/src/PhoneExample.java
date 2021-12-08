
public class PhoneExample {

	public static void main(String[] args) {
		SmartPhone smartPhone = new SmartPhone("È«±æµ¿");
		
		smartPhone.turnOn();
		smartPhone.InternetSearch();
		smartPhone.turnOff();
		
		CellPhone cellPhone = new CellPhone("È«±æ¼ø");
		cellPhone.turnOn();
		cellPhone.YoutubeSearch();
		cellPhone.turnOff();
	}

}
