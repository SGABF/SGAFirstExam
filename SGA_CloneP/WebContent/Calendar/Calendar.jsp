<%@page import="java.time.DayOfWeek"%>
<%@page import="java.time.LocalDate"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calendar</title>
<%-- 부트스트랩을 사용하기 위한 준비 시작 --%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%-- 부트스트랩을 사용하기 위한 준비 끝 --%>
<style type="text/css">
table.table1 {
	width: 600px;
	margin: auto;
	border: none;
}

.title1 {
	font-size: 24pt;
	text-align: center;
	border: none;
	background-color: white;
}

table.table1.th {
	border: 1px solid gray;
	width: 100px;
	padding: 10px;
	background-color: silver;
	border-radius: 20px;
}

table.table1 td {
	border: 1px solid gray;
	width: 100px;
	padding: 10px;
	height: 80px;
	line-height: 30px;
	border-radius: 20px;
	text-align: right;
	vertical-align: bottom;
}

table.table2 {
	width: 500px;
	margin: auto;
	border: none;
	text-align: right;
}
</style>
</head>
<body>
	<%
		LocalDate today = LocalDate.now();
	int year = today.getYear();
	int month = today.getMonthValue();
	// 년도와 월을 받아보자
	try {
		year = Integer.parseInt(request.getParameter("yy"));
	} catch (Exception E) { // 숫자로 변환하지 못하면 현재 년도를 가지자
		;
	}
	try {
		month = Integer.parseInt(request.getParameter("mm"));
	} catch (Exception E) {
		;
	}
	// 사용자가 쿼리값을 임의 변경하여 유효하지 않은 값을 만들었다면 보정을 해주어야 한다.
	if (month == 0) {
		month = 12;
		year--;
	}
	if (month == 13) {
		month = 1;
		year++;
	}
	if (month < 1 || month > 12)
		month = today.getMonthValue();
	if (year <= 0)
		year = today.getYear();

	// 1일의 요일과 그달의 마지막 날짜를 구해서 출력해보자
	LocalDate date = LocalDate.of(year, month, 1); // 1일

	// 1. 숫자 요일 구하기
	DayOfWeek dayOfWeek = date.getDayOfWeek();
	int dayOfWeekNumber = dayOfWeek.getValue() % 7; // 일 : 7, 월 : 1 .... 토 : 6 ==> %7하면 일 : 0으로 변경

	// 2. 그달의 마지막 날짜 구하기
	LocalDate date2 = date.plusDays(date.lengthOfMonth() - 1);
	int lastDay = date2.getDayOfMonth();

	// 3. 지난달의 마지막 날짜 구하기
	// 3-1 지난달은?  (year,month,1).minusMonth(1);
	LocalDate date3 = date.minusMonths(1); //

	// 3-2 지난달마지막날짜?  .lengthOfMonth();
	int dayOfLastMonth = date3.lengthOfMonth();
	int lastMonthday = 0;
	%>
	<table class="table1">
		<tr>
			<th colspan="2" class="title1">
				<%-- ?를 링크를 걸면 자기 자신이다. --%> 
				<button type="button" class="btn btn-dark btn-sm" value="<<" onclick=" location.href='?yy=<%=year - 1%>&mm=<%=month%>' "><<</button>
				<button type="button" class="btn btn-dark btn-sm" value="<" onclick=" location.href='?yy=<%=year%>&mm=<%=month - 1%>' "><</button>
			</th>
			<th colspan="3" class="title1"><%=String.format("%04d년 %02d월", year, month)%></th>
			<th colspan="2" class="title1">
			<button type="button" class="btn btn-dark btn-sm" value=">" onclick="location.href='?yy=<%=year%>&mm=<%=month + 1%>'">></button>
			<button type="button" class="btn btn-dark btn-sm"value=">>" onclick="location.href='?yy=<%=year + 1%>&mm=<%=month%>'">>></button>
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
			int dayCount = 1;
			for (int i = 0; i < dayOfWeekNumber; i++) {
				dayCount++;
			}

			for (int i = 0; i < dayOfWeekNumber; i++) {
				lastMonthday = dayOfLastMonth - (dayCount - 2);
				out.println("<td style='opacity:0.5; font-color:'gray' >" + lastMonthday + "</td>");
				dayCount--;
			}
			// 1일 부터 마자막 날짜까자 출력해보자
			for (int i = 1; i <= lastDay; i++) {

				// 토요일 마다 줄바꿈을 해준다.
				date = LocalDate.of(year, month, i); // i일
				dayOfWeek = date.getDayOfWeek();
				dayOfWeekNumber = dayOfWeek.getValue() % 7; // 일요일이 7이다. 이값을 0으로 만든다.
				if (dayOfWeekNumber == 6) {
					out.println("<td style='background-color:skyblue;'>" + i + "</td>"); // 토요일이면
				} else if (dayOfWeekNumber == 0) {
					out.println("<td style='background-color:pink;'>" + i + "</td>"); // 일요일이면
				} else {
					out.println("<td>" + i + "</td>"); // 평일이면
				}
				if (dayOfWeekNumber == 6) { // 토요일이면 
					out.println("</tr>"); // 줄닫고
					if (i != lastDay) { // 마지막날짜가 토요일이 아니면 다음줄이 있다.
				out.println("<tr>"); // 줄열고
					}
				}
			}
			// 마지막 줄을 마무리 해보자
			if (dayOfWeekNumber < 6) { // 마지막칸(토요일)까지 출력되지 않았다면 
				int nextMonthDay = 1;
				for (int i = dayOfWeekNumber + 1; i <= 6; i++) {
					out.println("<td  style='opacity:0.5; font-color:'gray' >" + nextMonthDay + "</td>");
					nextMonthDay++;
				}
			}
			%>

		</tr>
		<form method="POST" action="04_ItemWrite.jsp">
	</table>
	<table class="table2">
		<thead>
			<h2 align="center">What To Do</h2>
		</thead>
		<tr style="text-align: center;">
			<td><b>할일</b></td>
			<td><textarea rows="10" cols="80" name="description"></textarea></td>
		</tr>
		<tr>
			<td colspan="10"><input type="submit" value="등록"><input
				type="reset" value="다시하기"></td>
		</tr>
	</table>
</body>
</html>