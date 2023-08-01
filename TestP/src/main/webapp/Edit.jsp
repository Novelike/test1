<%@page import="dao.sc"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<h1>회원관리-수정관리자</h1>
	<form action="EditAction.jsp">
		<table>
			<tr>
				<th>ID</th>
				<td><input type="text" name="id" value="<%=request.getParameter("id")%>" readonly></td>
			</tr>
			<tr>
				<th>PW</th>
				<td><input type="text" name="pw" value="<%=request.getParameter("pw")%>"></td>
			</tr>
			<tr>
				<th>Name</th>
				<td><input type="text" name="name" value="<%=request.getParameter("name")%>"></td>
			</tr>
			<tr>
				<th>point</th>
				<td><input type="text" name="point" value="<%=request.getParameter("point")%>"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" style="width: -webkit-fill-available;"></td>
			</tr>
		</table>
	</form>
	
</body>
</html>