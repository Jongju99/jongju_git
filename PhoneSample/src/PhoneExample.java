
public class PhoneExample {

	public static void main(String[] args) {
		SmartPhone smartPhone = new SmartPhone("ȫ�浿");
		
		smartPhone.turnOn();
		smartPhone.InternetSearch();
		smartPhone.turnOff();
		
		CellPhone cellPhone = new CellPhone("ȫ���");
		cellPhone.turnOn();
		cellPhone.YoutubeSearch();
		cellPhone.turnOff();
	}

}
