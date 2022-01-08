package sga.calc;

public class CalcVO {
	private double result;
	
	public double getclac(double a) {
		if (a>=25) { 
	        // BMI수치가 25보다 크다면
			System.out.println("BMI지수는 " + a + "이며\n비만도 결과는 비만입니다.");
	        // BMI수치가 23보다 크다면
	     }else if (a>=23) {
	    	 System.out.println("BMI지수는 " + a + "이며\n비만도 결과는 과체중입니다.");
	        // BMI수치가 18.5보다 크다면
	     }else if (a>=18.5) {
	    	 System.out.println("BMI지수는 " + a + "이며\n비만도 결과는 정상입니다.");
	        // BMI수치가 그 나머지 값이라면
	     }else {
	        System.out.println("BMI지수는 " + a + "이며\n비만도 결과는 저체중입니다.");
	     }
	     return result;
	}

	
		
	

}
