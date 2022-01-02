<%@page import="java.time.DayOfWeek"%>
<%@page import="java.time.LocalDate"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calendar</title>
<style type="text/css">
	table {	width: 700px;margin: auto; border: none;}
	.title {font-size: 24pt; text-align: center; border: none;background-color: white;}
	th { border: 1px solid gray; width: 100px;padding: 10px; background-color: silver; border-radius: 20px; }
	td { border: 1px solid gray; width: 100px;padding: 10px; height: 80px; line-height: 30px; 
	     border-radius: 20px; text-align: right; vertical-align: bottom; }
	img:hover { cursor: pointer; }
</style>
</head>
<body>
	<%
		LocalDate today = LocalDate.now();
		int year = today.getYear();
		int month = today.getMonthValue();
		// 년도와 월을 받아보자
		try{
			year = Integer.parseInt(request.getParameter("yy"));
		}catch(Exception E){ // 숫자로 변환하지 못하면 현재 년도를 가지자
			;
		}
		try{
			month = Integer.parseInt(request.getParameter("mm"));
		}catch(Exception E){
			;
		}
		// 사용자가 쿼리값을 임의 변경하여 유효하지 않은 값을 만들었다면 보정을 해주어야 한다.
		if(month==0){
			month = 12;
			year--;
		}
		if(month==13){
			month = 1;
			year++;
		}
		if(month<1 || month>12) month = today.getMonthValue();
		if(year<=0) year = today.getYear();
		
		// 1일의 요일과 그달의 마지막 날짜를 구해서 출력해보자
		LocalDate date = LocalDate.of(year, month, 1); // 1일
		
		// 1. 숫자 요일 구하기
		DayOfWeek dayOfWeek = date.getDayOfWeek();
		int dayOfWeekNumber = dayOfWeek.getValue()%7; // 일 : 7, 월 : 1 .... 토 : 6 ==> %7하면 일 : 0으로 변경
		 
		// 2. 그달의 마지막 날짜 구하기
		LocalDate date2 = date.plusDays(date.lengthOfMonth()-1);
		int lastDay = date2.getDayOfMonth();
		
		
		// out.println(dayOfWeekNumber + ", " + lastDay);
	%>
	<table>
		<tr>
			<th colspan="2" class="title">
			<%-- ?를 링크를 걸면 자기 자신이다. --%>
				<input type="button" value="<<" onclick="location.href='?yy=<%=year-1 %>&mm=<%=month %>'" />
				<input type="button" value="<" onclick="location.href='?yy=<%=year %>&mm=<%=month-1 %>'" />
			</th>
			<th colspan="3" class="title"><%=String.format("%04d년 %02d월", year, month) %></th>
			<th colspan="2" class="title">
				<input type="button" value=">" onclick="location.href='?yy=<%=year %>&mm=<%=month+1 %>'"  />
				<input type="button" value=">>" onclick="location.href='?yy=<%=year+1 %>&mm=<%=month %>'"  />
			</th>
		</tr>
		<tr>
			<th>일</th>
			<th>월</th>
			<th>화</th>
			<th>수</th>
			<th>목</th>
			<th>금</th>
			<th>토</th>
		</tr>
		<tr>
			<%
				// 1일의 요일 위치를 맞추기 위해서 공백 셀을 출력한다.
				for(int i=0;i<dayOfWeekNumber;i++){
					out.println("<td>&nbsp;</td>");
				}
				// 1일 부터 마자막 날짜까자 출력해보자
				for(int i=1;i<=lastDay;i++){
					
					// 토요일 마다 줄바꿈을 해준다.
					date = LocalDate.of(year, month, i); // i일
					dayOfWeek = date.getDayOfWeek();
					dayOfWeekNumber = dayOfWeek.getValue()%7; // 일요일이 7이다. 이값을 0으로 만든다.
					if(dayOfWeekNumber==6){
						out.println("<td style='background-color:skyblue;'>" + i + "</td>"); // 토요일이면
					}else if(dayOfWeekNumber==0){
						out.println("<td style='background-color:pink;'>" + i + "</td>"); // 일요일이면
					}else{
						out.println("<td>" + i + "</td>"); // 평일이면
					}
					if(dayOfWeekNumber==6){ // 토요일이면 
						out.println("</tr>"); // 줄닫고
						if(i!=lastDay){ // 마지막날짜가 토요일이 아니면 다음줄이 있다.
							out.println("<tr>"); // 줄열고
						}
					}
				}
				// 마지막 줄을 마무리 해보자
				if(dayOfWeekNumber<6){ // 마지막칸(토요일)까지 출력되지 않았다면 
					for(int i=dayOfWeekNumber+1;i<=6;i++){
						out.println("<td>&nbsp;</td>");
					}
				}
			%>
		</tr>
	</table>
</body>
</html>