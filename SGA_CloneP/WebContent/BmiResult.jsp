<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BMI 결과창</title>
</head>
<body>
<%
	String gender = null;
	int height = 0;
	int weight = 0;
	
	gender = (String)request.getParameter("gender");
	height = Integer.parseInt(request.getParameter("heightbar"));
	weight = Integer.parseInt(request.getParameter("weightbar"));
%>
	전체 변수 출력<br />
	성별 : <%= gender %><br />
	신장 : <%= height %><br />
	체중 : <%= weight %><br />
	연산 되나 확인 : <%= height + weight %>
	
	
</body>
</html>