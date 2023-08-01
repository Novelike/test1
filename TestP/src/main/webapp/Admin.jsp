<%@page import="dao.sc"%>
<%@page import="dto.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDAO mdao = new MemberDAO();
	ArrayList<MemberDTO> mdto = mdao.getMember();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		body {
			padding: 20px;
		    width: 500px;
		}
		.top {
			display: flex;
			justify-content: space-between;
		}
		h1 {
		    margin: 5px 0px 0px;
		}
		#login {
			height: 25px;
		}
		table {
			border: 1px solid;
			border-collapse: collapse;
		}
		th, td {
			border: 1px solid;
			width: 80px;
		    height: 30px;
		    text-align: center;
		}
	</style>
</head>
<body>
	<div class="top">
		<h1>회원관리</h1>
		<button onclick="location.href='Login.jsp'" id="login">로그인</button>
	</div>
	<table>
		<tr>
			<th>ID</th>
			<th>PW</th>
			<th>Name</th>
			<th>Point</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<%
		for(int i=0; i<mdto.size(); i++) {
			String id = mdto.get(i).getId();
			String pw = mdto.get(i).getPw();
			String name = mdto.get(i).getName();
			int point = mdto.get(i).getPoint();
		%>
		<tr>
			<td><%=id%></td>
			<td><%=pw%></td>
			<td><%=name%></td>
			<td><%=point%></td>
			<td><button onclick="location.href='Edit.jsp?id=<%=id%>&pw=<%=pw%>&name=<%=name%>&point=<%=point%>'">수정</button></td>
			<td><button onclick="location.href='Delete.jsp?id=<%=id%>'">삭제</button></td>
		</tr>
		<%
		}
		%>
	</table>
	<h1>스케줄러관리</h1>
	<div style="display: flex;">
		<button onclick="location.href='Start.jsp';">스케줄러(20초마다 포인트1 증가) 실행 시작</button>
		<button style="margin-left: 5px;" onclick="location.href='Stop.jsp';">스케줄러 실행 종료</button>
	</div>
</body>
</html>