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
<body >
</br></hr></br></hr>
 <div class="container-fluid" style=" text-align: center;" >
	<form  action="${pageContext.request.contextPath}/Search/searchBarAction.jsp" method="POST"> 
		<input  size=35 class="btn btn-outline-primary btn-lg" id="searchBar" name="searchBar" aria-label="Search" placeholder="Search" > 
	
		</br></hr></br></hr>
		<button type="radio" class="btn btn-outline-success" value="naver" id="searchEngine" name="searchEngine" ><img src="Naver.png"></button>
		
		<button type="radio" class="btn btn-outline-info" value="daum" id="searchEngine" name="searchEngine" ><img src="Daum.png"></button>
		
		<button type="radio" class="btn btn-outline-primary" value="google" id="searchEngine" name="searchEngine"><img src="Google.png"></button>
		
</br></br></br></br>
<button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal">도움말</button>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        기본 검색 브라우저는 네이버입니다.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
	</form>
    </div>
 
</body>
</html>