<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		form {
			text-align: left;
		}
		input[type="submit"] {
			width: -webkit-fill-available;
		}
		button {
			width: -webkit-fill-available;
		}
	</style>
</head>
<body>
	<h1>로그인</h1>
	<form action="Main.jsp">
		<table>
			<tr>
				<th>ID : </th>
				<td>
					<input type="text" name="id">
				</td>
			</tr>
			<tr>
				<th>PW : </th>
				<td>
					<input type="text" name="pw">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="로그인">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button onclick="location.href='SignUp.jsp';" type="button">회원가입</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>