import java.util.Scanner;

public class Level {

public static void main(String[] args) {
	int i;
	Scanner s=new Scanner(System.in);
	i=s.nextInt();
	if(i>=90) {
		if(i>=95) {
			System.out.println("A+");
		} else {
			System.out.println("A-");
		}
	} else if(90>i&&i>=80) {
		if(i>=85) {
			System.out.println("B+");
		} else {
			System.out.println("B-");
		}
	} else if(80>i&&i>=70) {
		if(i>=75) {
			System.out.println("C+");
		} else {
			System.out.println("C-");
		}
	} else if(70>i&&i>=60) {
		if(i>=65) {
			System.out.println("D+");
		} else {
			System.out.println("D-");
		}
	} else {
		System.out.println("F");
	}
}

}

