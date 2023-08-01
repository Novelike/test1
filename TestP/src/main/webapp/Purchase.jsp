<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int point = Integer.parseInt(request.getParameter("point"));
int mypoint = Integer.parseInt(request.getParameter("mypoint"));
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String content = "";
if(point == 100000) {
	content = "intro";
} else if(point == 500000) {
	content = "java";
} else {
	content = "C++";
}
MemberDAO mdao = new MemberDAO();
mdao.Purchase(point, mypoint, id);
%>
<script>
	alert('컨텐츠(<%=content%>)를 구입하였습니다.');
	location.href="Main.jsp?id=<%=id%>&pw=<%=pw%>";
</script>