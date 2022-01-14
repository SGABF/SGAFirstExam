<%@page import="kr.green.search.vo.SearchVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URL"%>
<%
	request.setCharacterEncoding("UTF-8");

    SearchVO vo = new SearchVO("");
	String searchBar = null;
	String searchVal = null;
	searchBar = (String)request.getParameter("searchEngine");
	searchVal = (String)request.getParameter("searchBar");
	
	if(searchBar.equals("naver")){
		response.sendRedirect(vo.getNaver(URLEncoder.encode(searchVal,"UTF-8")));
	}
	else if(searchBar.equals("daum")){
		response.sendRedirect(vo.getDaum(URLEncoder.encode(searchVal,"UTF-8")));
	}else if(searchBar.equals("google")){
		response.sendRedirect(vo.getGoogle(URLEncoder.encode(searchVal,"UTF-8")));
	}
	

%>