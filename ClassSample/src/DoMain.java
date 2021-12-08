
public class DoMain {

	public static void main(String[] args) {
		Car car=new Car();
		
		System.out.println("제조업체:"+car.company);
		System.out.println("모델명:"+car.model);
		System.out.println("색상:"+car.color);
		System.out.println("최고속도"+car.maxSpeed);
		System.out.println("현재속도"+car.speed);
		
		car.speed=60;
		System.out.println("수정된 현재속도:"+car.speed);
		System.out.println("----------------------");
		
		Car seltos=new Car("KIA","Seltos","white",220,0);
		
		System.out.println("제조업체:"+seltos.company);
		System.out.println("모델명:"+seltos.model);
		System.out.println("색상:"+seltos.color);
		System.out.println("최고속도"+seltos.maxSpeed);
		System.out.println("현재속도"+seltos.speed);
	}

}
