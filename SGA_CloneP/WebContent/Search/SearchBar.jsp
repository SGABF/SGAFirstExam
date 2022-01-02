<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SearchBar</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/Search/searchBarAction.jsp" method="POST">
		검색 창 : <input type="text" id="searchBar" name="searchBar"> <br />
		<hr/>
		<input type="radio" value="naver" id="searchEngine" name="searchEngine" checked="checked">naver
		<input type="radio" value="daum" id="searchEngine" name="searchEngine">daum
		<input type="submit" value="검색" id="search" name="search">
	</form>
</body>
</html>