<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- -->
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
<meta charset="UTF-8">
<title>Calc</title>
<link href="style.css" rel="stylesheet">
<style type="text/css">
#heightbar, #weightbar {
	width: 200px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">

	check = 0;
	
	//신장과 체중쪽에 왔다갔다하면서 버튼이 입력되게 하는 스크립트
	function ClickNum(btnVal) {
		if (check == 0) {
			document.getElementById("heightbar").value += btnVal;
		} else {
			document.getElementById("weightbar").value += btnVal;
		}
	}

	//더하기 빼기
	function add() {
		if (check == 0) {
			var tmp = document.getElementById("heightbar").value;
			tmp++;
			document.getElementById("heightbar").value = tmp;

		} else {
			var tmp = document.getElementById("weightbar").value;
			tmp++;

			document.getElementById("weightbar").value = tmp;
		}
	}

	function minus() {
		if (check == 0) {
			var tmp = document.getElementById("heightbar").value;
			tmp--;
			document.getElementById("heightbar").value = tmp;
		} else {
			var tmp = document.getElementById("weightbar").value;
			tmp--;
			document.getElementById("weightbar").value = tmp;
		}

	}

	//신장과 체중 버튼 위치가 계속 변경되는 스크립트
	function ChangeMode() {
		if (check == 0) {
			check = 1
		} else {
			check = 0
		}
	}

	//전체 삭제
	function Clear() {
		document.getElementById("heightbar").value = "";
		document.getElementById("weightbar").value = "";
	}
	
// 	//BMI   
// 	function getBMI(result){
// //	       hp = 0;
// //	       result = document.getElementById("weightbar").value / (document.getElementById("heightbar").value*document.getElementById("heightbar").value);
// 	      hp = document.getElementById("heightbar").value/100;
// 	      result = Math.floor((document.getElementById("weightbar").value/(hp * hp))*10)/10; 
// 	      if (result>=25) { 
// 	         // BMI수치가 25보다 크다면
// 	         alert("BMI지수는 " + result + "이며\n비만도 결과는 비만입니다.");
// 	         // BMI수치가 23보다 크다면
// 	      }else if (result>=23) {
// 	         alert("BMI지수는 " + result + "이며\n비만도 결과는 과체중입니다.");
// 	         // BMI수치가 18.5보다 크다면
// 	      }else if (result>=18.5) {
// 	         alert("BMI지수는 " + result + "이며\n비만도 결과는 정상입니다.");
// 	         // BMI수치가 그 나머지 값이라면
// 	      }else {
// 	         alert("BMI지수는 " + result + "이며\n비만도 결과는 저체중입니다.");
// 	      }
// 	   }

	//한글자씩 지우기
		$(function () {
			$("#remove").click(function(){
				if(document.getElementById("heightbar")){
					var value = $("#heightbar").val();
						if(value!=null && value.length>0){
				// 원본에서 맨뒤의 1글자를 제하고 잘라낸다.
						value = value.substring(0, value.length-1);
				// 그 값으로 내용을 변경한다.
						$("#heightbar").val(value);
					}
					if(document.getElementById("weightbar")){
						var value = $("#weightbar").val();
							if(value!=null && value.length>0){
						// 원본에서 맨뒤의 1글자를 제하고 잘라낸다.
							value = value.substring(0, value.length-1);
						// 그 값으로 내용을 변경한다.
							$("#weightbar").val(value);
					
						
					}
				}
			}
		});
	});
	
		
	
</script>
</head>
<body>
	<form action="${pageContext.request.contextPath}/Calc/BmiResult.jsp"
		method="post">
		<table class="bg-success p-2 text-dark bg-opacity-10">
			<tr>
				<td colspan="4" style="text-align: center; font-size: 25px;">BMI
					계산기</td>
			</tr>
			<tr>
				<td colspan="4" style="vertical-align: middle; text-align: center;">
					성별 : <input type="radio" value="man" id="gender" name="gender"
					checked="checked">남자 &nbsp; <input type="radio"
					value="woman" id="gender" name="gender">여자
				</td>
			</tr>
			<tr>
				<td colspan="3" style="text-align: center">신장 : <input
					type="text" id="heightbar" name="heightbar" readonly="readonly"
					style="width: 300px; text-align: center;" />
				</td>
			</tr>
			<tr>
				<td colspan="3" style="text-align: center">체중 : <input
					type="text" id="weightbar" name="weightbar" readonly="readonly"
					style="width: 300px; text-align: center;" />
				</td>
			</tr>
			<tr>

				<td colspan="2"><input type="button" value="전체 삭제" id="c" name="c"
					onClick="Clear()" class="btn btn-outline-dark" /></td>
				<td colspan="2"><input type="button" value="타겟 변경" id="target"
					name="target" onclick="ChangeMode()" class="btn btn-outline-dark" /></td>


			</tr>
			<tr>
				<td><input type="button" value="7" id="7" name="7"
					class="btn btn-success btn-lg" onClick="ClickNum(this.id)" /></td>
				<td><input type="button" value="8" id="8" name="8"
					class="btn btn-success btn-lg" onClick="ClickNum(this.id)" /></td>
				<td><input type="button" value="9" id="9" name="9"
					class="btn btn-success btn-lg" onClick="ClickNum(this.id)" /></td>
				<td><input type="button" value="←" id="remove" name="remove"
					class="btn btn-outline-dark"></td>
			</tr>
			<tr>
				<td><input type="button" value="4" id="4" name="4"
					class="btn btn-success btn-lg" onClick="ClickNum(this.id)" /></td>
				<td><input type="button" value="5" id="5" name="5"
					class="btn btn-success btn-lg" onClick="ClickNum(this.id)" /></td>
				<td><input type="button" value="6" id="6" name="6"
					class="btn btn-success btn-lg" onClick="ClickNum(this.id)" /></td>
				<td><input type="button" value="+" id="+" name="+"
					class="btn btn-outline-success btn-lg" onClick="add(this.id)" /></td>
			</tr>
			<tr>
				<td><input type="button" value="1" id="1" name="1"
					class="btn btn-success btn-lg" onClick="ClickNum(this.id)" /></td>
				<td><input type="button" value="2" id="2" name="2"
					class="btn btn-success btn-lg" onClick="ClickNum(this.id)" /></td>
				<td><input type="button" value="3" id="3" name="3"
					class="btn btn-success btn-lg" onClick="ClickNum(this.id)" /></td>
				<td><input type="button" value="-" id="-" name="-"
					class="btn btn-outline-success btn-lg" onClick="minus(this.id)" /></td>


			</tr>
			<tr>
				<td></td>
				<td id="btn"><input type="button" value="0" id="0" name="0"
					class="btn btn-success btn-lg" onClick="ClickNum(this.id)" /></td>
				<td></td>
				<td><input type="submit" value="결과전송" id="result" name="result"
					 class="btn btn-outline-dark btn-lg" /></td>
			</tr>
			<tr>
				<td></td>
			</tr>
		</table>
	</form>
	<script type="text/javascript" src="/WebContent/Calc/js/bootstrap.js"></script>

</body>
</html>