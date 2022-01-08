<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SearchBar</title>
<%-- 부트스트랩을 사용하기 위한 준비 시작 --%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%-- 부트스트랩을 사용하기 위한 준비 끝 --%>
</head>
<body>
	<form action="${pageContext.request.contextPath}/Search/searchBarAction.jsp" method="POST">
		검색 창 : <input type="text"  class="btn btn-outline-primary id="searchBar" name="searchBar"> 
		
		<button type="radio" class="btn btn-success" value="naver" id="searchEngine" name="searchEngine" >Naver</button>
		
		<button type="radio" class="btn btn-info" value="daum" id="searchEngine" name="searchEngine">Daum</button>
		
		<button type="radio" class="btn btn-primary" value="google" id="searchEngine" name="searchEngine">Google</button>
	</form>
</body>
</html>