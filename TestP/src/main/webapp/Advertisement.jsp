<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
MemberDAO mdao = new MemberDAO();
int mypoint = Integer.parseInt(request.getParameter("mypoint"));
String id = request.getParameter("id");
int num = mdao.getRandomPoint(mypoint, id);
%>
<script>
	alert('<%=num%>점이 적립되었습니다.');
	location.href="http://www.koreaisacademy.com";
</script>