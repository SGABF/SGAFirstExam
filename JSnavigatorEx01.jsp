<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var msg = "<ul>";
	for(key in navigator){
		msg += "<li>";
		msg += key + " : " + navigator[key];
		msg += "</li>";
	}
	msg += "<ul>";
	document.writeln(msg);
	
	if(navigator['userAgent'].indexOf('Trident')!=-1){
		alert("너 아직도 IE를 쓰니?");
	}else{
		alert('그래 IE는 쓰지말자!!!');
	}
	
</script>
<style type="text/css">

</style>
</head>
<body>
	
</html>