
public class Car {
	String company;
	String model;
	String color;
	int maxSpeed;
	int speed;
	
	// ������(Constructor:������/������)
	// �ʵ尪�� �ʱ�ȭ �� �� �Ǵ� �ʱ�ȭ�۾��� ������ ��.
	// Ŭ������� ������ �żҵ�.
	// ��ȯ�� Ÿ���� ����.
	// �ڵ�����=�����(���������) ȣ������ ����.<-new������ ȣ��
	Car(){ //�⺻������(default constructor)
		this.company="KIA";
		this.model="Sorento";
		this.color="grey";
		this.maxSpeed=240;
		this.speed=0;
	}
	// �Ϲݻ����ڰ� ������, �ݵ�� �⺻�����ڵ� �����ؾ� �Ѵ�.
	// (�Ϲݻ����� ����) �⺻�����ڸ� ������ �� �ִ�.
	// ������ �����ε�(Constructor Overloading) <-�������� ����
	Car(String sCompany,String sModel,String sColor,
		int nMaxSpeed, int nSpeed){
		this.company=sCompany;
		this.model=sModel;
		this.color=sColor;
		this.maxSpeed=nMaxSpeed;
		this.speed=nSpeed;
	}
	Car(String model,String color){
		this.company="KIA";
		this.model=model;
		this.color=color;
		this.maxSpeed=240;
		this.speed=0;
	}
}
