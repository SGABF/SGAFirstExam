<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URL"%>
<%
	request.setCharacterEncoding("UTF-8");

	String searchBar = null;
	String searchVal = null;
	String result = null;
	searchBar = (String)request.getParameter("searchEngine");
	searchVal = (String)request.getParameter("searchBar");

	if(searchBar.equals("naver")){
		StringBuilder urlBuilder = new StringBuilder("https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=");
		result = urlBuilder.toString() + URLEncoder.encode(searchVal,"UTF-8");
	}
	else if(searchBar.equals("daum")){
		StringBuilder urlBuilder = new StringBuilder("https://search.daum.net/search?nil_suggest=btn&w=tot&DA=SBC&q=");
		result = urlBuilder.toString() + URLEncoder.encode(searchVal,"UTF-8");
	}else if(searchBar.equals("google")){
		StringBuilder urlBuilder = new StringBuilder("https://www.google.com/search?q=");
		result = urlBuilder.toString() + URLEncoder.encode(searchVal,"UTF-8");
	}
	
	response.sendRedirect(result);

%>