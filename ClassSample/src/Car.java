
public class Car {
	String company;
	String model;
	String color;
	int maxSpeed;
	int speed;
	
	// 생성자(Constructor:건축자/구성자)
	// 필드값을 초기화 할 때 또는 초기화작업을 수행할 때.
	// 클래스명과 동일한 매소드.
	// 반환값 타입이 없음.
	// 자동실행=대놓고(명시적으로) 호출하지 않음.<-new연산자 호출
	Car(){ //기본생성자(default constructor)
		this.company="KIA";
		this.model="Sorento";
		this.color="grey";
		this.maxSpeed=240;
		this.speed=0;
	}
	// 일반생성자가 있으면, 반드시 기본생성자도 존재해야 한다.
	// (일반생성자 없이) 기본생성자만 존재할 수 있다.
	// 생성자 오버로딩(Constructor Overloading) <-다형성의 일종
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
