<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calc</title>
<style type="text/css">
	#heightbar, #weightbar{
		width: 200px;
	}
</style>
<script type="text/javascript">
	var check = 0;
	
	window.onload = function(){
		// onfocus : 포커스를 가지면
		document.querySelector("#heightbar").onfocus = function(){
			// 0번 박스에 있으면 0을
			check=0;
		}
		document.querySelector("#weightbar").onfocus = function(){
			// 1번 박스에 있으면 1를 가진다.
			check=1;
		}
		document.getElementById("remove").onclick = function(){
			// 입력된 내용을 가져온다
			var obj = document.querySelector(check); 
			var value = obj.value;
			// 내용이 있을때만
			if(value!=null && value.length>0){
				// 원본에서 맨뒤의 1글자를 제하고 잘라낸다.
				value = value.substring(0, value.length-1);
				// 그 값으로 내용을 변경한다.
				obj.value = value;
			}
		}
	}
	
	//신장과 체중쪽에 왔다갔다하면서 버튼이 입력되게 하는 스크립트
	function ClickNum(btnVal){
		if(check == 0){
			document.getElementById("heightbar").value += btnVal;
		}else{
			document.getElementById("weightbar").value += btnVal;
		}
	}
	
	//신장과 체중 버튼 위치가 계속 변경되는 스크립트
	function ChangeMode(){
		if(check == 0){
			check = 1
		}else{
			check = 0
		}
	}
	
	//전체 삭제
	function Clear(){
		document.getElementById("heightbar").value = "";
		document.getElementById("weightbar").value = "";
	}
	
	
// 	//getBMI
// 	function getBMI(){
// 		var result = heightbar + weightbar;
// 		if(result%.2f>=25) { 
// 			// BMI수치가 25보다 크다면
// 			alert("BMI지수는 " + result%.2f + "이며\n비만도 결과는 비만입니다.");
// 			// BMI수치가 23보다 크다면
// 		}else if (result>=23) {
// 			alert("BMI지수는 " + result%.2f + "이며\n비만도 결과는 과체중입니다.");
// 			// BMI수치가 18.5보다 크다면
// 		}else if (result>=18.5) {
// 			alert("BMI지수는 " + result%.2f + "이며\n비만도 결과는 정상입니다.");
// 			// BMI수치가 그 나머지 값이라면
// 		}else {
// 			alert("BMI지수는 " + result%.2f + "이며\n비만도 결과는 저체중입니다.");
// 		}
// 		return;
// 	}
	
	function getBMI(result){
// 		hp = 0;
// 		result = document.getElementById("weightbar").value / (document.getElementById("heightbar").value*document.getElementById("heightbar").value);
		hp = document.getElementById("heightbar").value/100;
		result = Math.floor((document.getElementById("weightbar").value/ (hp * hp))*10)/10;
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
// 		alert(result);
	}
</script>
</head>
<body>
	<form action="${pageContext.request.contextPath}/Calc/BmiResult.jsp" method="post">
		<table>
			<tr>
				<td colspan="4" style="text-align: center">BMI 계산기</td>
			</tr>
			<tr>
				<td colspan="4" style="vertical-align: middle; text-align: center;">
					성별 : 
					<input type="radio" value="man" id="gender" name="gender" checked="checked">남자 &nbsp;
					<input type="radio" value="woman" id="gender" name="gender">여자
				</td>
			</tr>
			<tr>
				<td colspan="3" style="text-align: center">
					신장 : <input type="text" id="heightbar" name="heightbar" readonly="readonly"/>
				</td>
			</tr>
			<tr>
				<td colspan="3" style="text-align: center">
					체중 : <input type="text" id="weightbar" name="weightbar" readonly="readonly"/>
				</td>
			</tr>
			<tr>
				<td><input type="button" value="C" id="c" name="c" onClick="Clear()"/></td>
				<td><input type="button" id="remove" value=" ← "/></td>
			</tr>
			<tr>
				<td><input type="button" value="7" id="7" name="7" onClick="ClickNum(this.id)"/></td>
				<td><input type="button" value="8" id="8" name="8" onClick="ClickNum(this.id)"/></td>
				<td><input type="button" value="9" id="9" name="9" onClick="ClickNum(this.id)"/></td>
			</tr>
			<tr>
				<td><input type="button" value="4" id="4" name="4" onClick="ClickNum(this.id)"/></td>
				<td><input type="button" value="5" id="5" name="5" onClick="ClickNum(this.id)"/></td>
				<td><input type="button" value="6" id="6" name="6" onClick="ClickNum(this.id)"/></td>
			</tr>
			<tr>
				<td><input type="button" value="1" id="1" name="1" onClick="ClickNum(this.id)"/></td>
				<td><input type="button" value="2" id="2" name="2" onClick="ClickNum(this.id)"/></td>
				<td><input type="button" value="3" id="3" name="3" onClick="ClickNum(this.id)"/></td>
			</tr>
			<tr>
				<td><input type="button" value="타겟 변경" id="target" name="target" onclick="ChangeMode()"/></td>
				<td><input type="button" value="0" id="0" name="0" onClick="ClickNum(this.id)"/></td>
				<td><input type="button" value="결과 확인" id="result" name="result" onclick="getBMI()"/></td>
			</tr>
		</table>
	</form>
</body>
</html>