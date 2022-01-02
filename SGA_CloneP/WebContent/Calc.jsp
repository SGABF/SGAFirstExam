<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calc</title>
<style type="text/css">
	#numbar{
		width: 500px;
	}
</style>
<script type="text/javascript">
	
</script>
</head>
<body>
	<table>
		<tr>
			<td colspan="4" style="text-align: center">BMI 계산기</td>
		</tr>
		<tr>
			<td colspan="4" style="text-align: center">
				<input type="text" id="numbar" name="numbar"/>
			</td>
		</tr>
		<tr>
			<td><input type="button" value="C(전체 삭제)" id="c" name="c"/></td>
			<td><input type="button" value="%(나머지 연산)" id="reminder" name="reminder"/></td>
			<td><input type="button" value="/" id="div" name="div"/></td>
			<td><input type="button" value="한글자씩 지우는거 여기다가 구현하세요"/></td>
		</tr>
		<tr>
			<td><input type="button" value="7" id="7" name="7"/></td>
			<td><input type="button" value="8" id="8" name="8"/></td>
			<td><input type="button" value="9" id="9" name="9"/></td>
			<td><input type="button" value="*" id="multi" name="multi"/></td>
		</tr>
		<tr>
			<td><input type="button" value="4" id="4" name="4"/></td>
			<td><input type="button" value="5" id="5" name="5"/></td>
			<td><input type="button" value="6" id="6" name="6"/></td>
			<td><input type="button" value="-" id="minus" name="minus"/></td>
		</tr>
		<tr>
			<td><input type="button" value="1" id="1" name="1"/></td>
			<td><input type="button" value="2" id="2" name="2"/></td>
			<td><input type="button" value="3" id="3" name="3"/></td>
			<td><input type="button" value="+" id="plus" name="plus"/></td>
		</tr>
		<tr>
			<td><input type="button" value="(+/-)(부호)" id="sign" name="sign"/></td>
			<td><input type="button" value="0" id="0" name="0"/></td>
			<td><input type="button" value="." id="point" name="point"/></td>
			<td><input type="button" value="=" id="result" name="result"/></td>
		</tr>
	</table>
</body>
</html>