<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>

<%
	//          CalcVO vo = new CalcVO();
String gender = null;
int height = 0;
int weight = 0; // weight
double heightp = 0;
double result = 0; // result
double bmi = 0;
String result2 = "";
%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@700&display=swap"
	rel="stylesheet">
<title>BMI 결과창</title>
</head>
<style>
*{
font-family: 'Gowun Batang', serif;
}

</style>
<body>
	
	<h1>BMI 결과창</h1>
	<hr />
	<%
		gender = (String) request.getParameter("gender");
	// 	vo.setHeightbar(Integer.parseInt(request.getParameter("heightbar")));
	// 	vo.setHeightbar(Integer.parseInt(request.getParameter("heightbar")));
	// 	vo.setWeightbar(Integer.parseInt(request.getParameter("Weightbar")));
	weight = Integer.parseInt(request.getParameter("weightbar"));
	height = Integer.parseInt(request.getParameter("heightbar"));

	heightp = Math.floor(height) * 1 / 100;
	bmi = weight / (heightp * heightp);
	result = Math.round(bmi * 100) / 100.0;
	
	if (result >= 25) {
        result2 = "비만";
    } else if (result >= 23) {
        result2 = "과체중";
    } else if (result >= 18.5) {
        result2 = "정상";
    } else {
        result2 = "저체중";
    }
	
	%>
	
	<!--체질량지수는 자신의 몸무게(kg)를 키의 제곱(m)으로 나눈 값-->

	<!-- ex) 키 170㎝에 몸무게 73kg이면, 
			계산식 : 73 / (1.7×1.7) = 25.26 → 과체중 -->

	<!-- 	키를 100으로 나누고 소수점 첫째자리까지  -->
	전체 변수 출력
	<br /> 성별 :
	<%=gender%><br /> 신장 :
	<%=height%><br /> 체중 :
	<%=weight%><br />
	<!-- 	heightp :heightphtp %><br />
	bmi :bmibmi %><br /> <hr /> -->
	<hr />
	BMI측정결과:신체질량지수(BMI)는 <%=result%>로 <%=result2%> 입니다.<br />
	<button onclick="history.back()" class="btn btn-success btn-lg">Back</button>
	<br />

	<%-- 	getClass : <%=vo.getClass() %> <br /> --%>
	<%-- 	Heightbar : <%=vo.getHeightbar() %> <br /> --%>
	<%-- 	Weightbar : <%=vo.getWeightbar() %> <br /> --%>
	<%-- 	Result : <%=vo.getResult() %> <br /> --%>

	<script type="text/javascript">
		function check(result) {
			if (result >= 25) {
				alert("BMI측정결과:신체질량지수(BMI)는 " + result + "로 '비만'입니다.")
			} else if (result >= 23) {
				alert("BMI측정결과:신체질량지수(BMI)는 " + result + "로 '과체중'입니다.")
			} else if (result >= 18.5) {
				alert("BMI측정결과:신체질량지수(BMI)는 " + result + "로 '정상'입니다.")
			} else {
				alert("BMI측정결과:신체질량지수(BMI)는 " + result + "로 '저체중'입니다.")
			}
		}
		
		
		
		var result =<%=result%>;

		check(result);
		
		//신장과 체중 버튼 위치가 계속 변경되는 스크립트
		// 	function ChangeMode(){
		// 		if(check == 0){
		// 			check = 1
		// 		}else{
		// 			check = 0
		// 		}
		// 	}
		
		</script>
	<script type="text/javascript" src="/WebContent/Calc/js/bootstrap.js"></script>
</body>
</html>