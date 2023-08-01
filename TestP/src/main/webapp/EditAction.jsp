<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
MemberDAO mdao = new MemberDAO();
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String name = request.getParameter("name");
int point = Integer.parseInt(request.getParameter("point"));
mdao.Edit(id, pw, name, point);
%>
<script>
alert('수정되었습니다.');
location.href="Admin.jsp";
</script>