package kr.green.calc.vo;

import javax.swing.JOptionPane;

public class CalcVO {
	private int heightbar;
	private int weightbar;
	private double result;
	private double heightp;
	
	public CalcVO(int heightbar, int weightbar, double result, double heightp) {
		super();
		this.heightbar = heightbar;
		this.weightbar = weightbar;
		this.result = result;
		this.heightp = heightp;
	}
	
	public int getHeightbar() {
		return heightbar;
	}
	
	public void setHeightbar(int heightbar) {
		if(this.heightbar>300 || this.heightbar<=0){
			JOptionPane.showConfirmDialog(null, "작성된 값이 맞습니까?");
			JOptionPane.showConfirmDialog(null, "님 그거 맞음??", "측정치 재확인 알람", JOptionPane.QUESTION_MESSAGE);
		}else if(this.heightbar<=100){
			JOptionPane.showMessageDialog(null, "만약 피측정자가 19세 미만의 소아라면\n하단의 BMI표를 참고하시기 바랍니다.");
			JOptionPane.showConfirmDialog(null, "님 그거 맞음??", "측정치 재확인 알람", JOptionPane.INFORMATION_MESSAGE);
		}else {
			this.heightbar = heightbar;
		}
	}
	
	public int getWeightbar() {
		return weightbar;
	}
	
	public void setWeightbar(int weightbar) {
		if(this.weightbar>300 || this.weightbar<=0){
			JOptionPane.showConfirmDialog(null, "작성된 값이 맞습니까?");
			JOptionPane.showConfirmDialog(null, "님 그거 맞음??", "측정치 재확인 알람", JOptionPane.QUESTION_MESSAGE);
		}else if(this.weightbar<=30){
			JOptionPane.showMessageDialog(null, "만약 피측정자가 19세 미만의 소아라면\n하단의 BMI표를 참고하시기 바랍니다.");
			JOptionPane.showConfirmDialog(null, "님 그거 맞음??", "측정치 재확인 알람", JOptionPane.INFORMATION_MESSAGE);
		} else {
			this.weightbar = weightbar;
		}
	}
	
	public double getResult() {
		return result;
	}
	
	public void setResult(double result) {
		this.result = result;
	}
	
	public double heightp() {
		double heightp = (this.heightbar)/100; // ex) 171 -> 1.71 로 환산	
		return heightp;
	}
	
	public double finalResult() {
		double result = weightbar/(heightp*heightp);
		return result;
	}
	
	public int calcBMI(int heightbar, int weightbar) {
		int output = 0;
		return output;
	}


	@Override
	public String toString() {
		return "CalcVO [heightbar=" + heightbar + ", weightbar=" + weightbar + ", result=" + result + ", heightp="
				+ heightp + "]";
	}
	
}
/*
	if (result>=25) { 
		// BMI수치가 25보다 크다면
		alert("BMI지수는 " + result + "이며\n비만도 결과는 비만입니다.");
		// BMI수치가 23보다 크다면
	}else if (result>=23) {
		salert("BMI지수는 " + result + "이며\n비만도 결과는 과체중입니다.");
		// BMI수치가 18.5보다 크다면
	}else if (result>=18.5) {
		alert("BMI지수는 " + result + "이며\n비만도 결과는 정상입니다.");
		// BMI수치가 그 나머지 값이라면
	}else {
		alert("BMI지수는 " + result + "이며\n비만도 결과는 저체중입니다.");
	}
 */

//	public String showMsg() {
//		if (result>=25) { 
//			// BMI수치가 25보다 크다면
//			System.out.println("BMI지수는 " + result + "이며\n비만도 결과는 비만입니다.");
//			// BMI수치가 23보다 크다면
//		}else if (result>=23) {
//			System.out.println("BMI지수는 " + result + "이며\n비만도 결과는 과체중입니다.");
//			// BMI수치가 18.5보다 크다면
//		}else if (result>=18.5) {
//			System.out.println("BMI지수는 " + result + "이며\n비만도 결과는 정상입니다.");
//			// BMI수치가 그 나머지 값이라면
//		}else {
//			System.out.println("BMI지수는 " + result + "이며\n비만도 결과는 저체중입니다.");
//		}
//	}
//}




//체질량지수는 자신의 몸무게(kg)를 키의 제곱(m)으로 나눈 값

//ex) 키 170㎝에 몸무게 73kg이면, 
//			계산식 : 73 / (1.7×1.7) = 25.26 → 과체중 