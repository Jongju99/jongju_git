
public abstract class Phone {
	//�߻� �޼ҵ�� Overriding
	//�߻�Ŭ����<-�߻�޼ҵ弱��<-�������̵��� �δ����.
	
	public String owner;
	
	public Phone(String owner) {
		this.owner=owner;
	}
	public abstract void turnOn();
	public abstract void turnOff();
	
//	public void turnOn() {
//		System.out.println("�� ������ �մϴ�.");
//	}
//	public void turnOff() {
//		System.out.println("�� ������ ���ϴ�.");
//	} //�޸�����
	
}
