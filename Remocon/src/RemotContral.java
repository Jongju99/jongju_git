
public interface RemotContral {
	//�ʵ尡 ����.(������ ����). ������� ����.(��ǻ� ����)
	int MAX_VOLUME=10;
	int MIN_VOLUME=0;
	// �����ڰ� ����. -> new�����ڸ� ����� �� ����.
	//�޼ҵ常 �ִ�.(�߻�޼ҵ�/����Ʈ�޼ҵ�/�����޼ҵ�)
	void turnOn();//�߻�޼ҵ�
	void turnOff();
	void setVolume(int volume);
	//����Ʈ(�⺻) �޼ҵ� - �Ϲ� Ŭ������ �Ϲ� �޼ҵ�
	default void setMute(boolean mute) {
		//�Ϲ�Ŭ������ �Ϲݸ޼ҵ�� ����
		if(mute) {
			System.out.println("����ó���մϴ�.");
		} else {
			System.out.println("���������մϴ�.");
		}
	}
	static void changeBettery() {
		System.out.println("�������� ��ȯ�մϴ�.");
	}
}
