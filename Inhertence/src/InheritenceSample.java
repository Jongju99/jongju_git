
public class InheritenceSample {

	public static void main(String[] args) {
		Car car = new Car();
		
		for(int i=0; i<5; i++) {
			int punk=car.run();
			switch(punk) {
			case 1:
			System.out.println("�� ���� �ѱ�Ÿ�̾�� ��ü");
			car.frontLeft=new HankucTire(15, "�� ����");
			break;
			case 2:
			System.out.println("�� ������ ��ȣŸ�̾�� ��ü");
			car.frontLeft=new KumhoTire(13, "�� ������");
			break;
			case 3:
			System.out.println("�� ���� �ѱ�Ÿ�̾�� ��ü");
			car.frontLeft=new HankucTire(14, "�� ����");
			break;
			case 4:
			System.out.println("�� ������ ��ȣŸ�̾�� ��ü");
			car.frontLeft=new KumhoTire(17, "�� ������");
			break;
			}
			System.out.println("----------------------------");
		}
	}

}
