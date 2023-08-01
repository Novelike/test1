<%@page import="dto.MemberDTO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id"), pw = request.getParameter("pw");
MemberDAO mdao = new MemberDAO();
MemberDTO mdto = mdao.login(id, pw);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<style>
		body {
			width: 1100px;
		}
		#profile {
			float: right;
			font-weight: bold;
		}
		#main {
			margin-top : 100px;
		}
		#img_list {
		}
		.flex {
			display: flex;
			justify-content: center;
		}
		#intro, #java {
			margin-right: 23px;
		}
		#ad {
			float: right;
			border: 1px solid;
			margin-top: 30px;
		}
	</style>
	<%
	if(mdto.getId() == "no") {
	%>
	<script>
		alert('아이디/비밀번호를 다시 확인하세요.');
		location.href="Login.jsp";
	</script>
	<%
	}
	%>
	<%
	if(mdto.getId().equals("admin")) {
	%>
	<script>
	location.href="Admin.jsp";
	</script>
	<%
	}
	%>
	<script>
		function logout(){
			alert('로그아웃 되었습니다.');
			location.href='Login.jsp';
		}
		$(document).ready(function() {
			$('#intro').on('click', function(){
				if(<%=mdto.getPoint()%><100000) {
					alert('포인트가 부족합니다. 광고를 클릭하세요.');
				} else {
					location.href="Purchase.jsp?point=100000&mypoint=<%=mdto.getPoint()%>&id=<%=id%>&pw=<%=pw%>";
				}
			});
			$('#java').click(function() {
				if(<%=mdto.getPoint()%><500000) {
					alert('포인트가 부족합니다. 광고를 클릭하세요.');
				} else {
					location.href="Purchase.jsp?point=500000&mypoint=<%=mdto.getPoint()%>&id=<%=id%>";
				}
			});
			$('#cpp').click(function() {
				if(<%=mdto.getPoint()%><300000) {
					alert('포인트가 부족합니다. 광고를 클릭하세요.');
				} else {
					location.href="Purchase.jsp?point=300000&mypoint=<%=mdto.getPoint()%>&id=<%=id%>";
				}
			});
			$('#ad').click(function() {
				location.href="Advertisement.jsp?mypoint=<%=mdto.getPoint()%>&id=<%=id%>";
			});
		});
	</script>
</head>
<body>
	<h1>메인페이지</h1>
	<div id="profile">
		<div><%=mdto.getName()%>(<%=mdto.getId()%>)님 안녕하세요. <button onclick="logout();">로그아웃</button></div>
		<div>포인트 : <%=mdto.getPoint()%></div>
	</div>
	<div id="main">
		<div style="font-weight: bold; margin-bottom: 10px;">구입할 컨텐츠를 선택하세요.</div>
		<div id="img_list">
			<div class="flex">
				<div role="button" id="intro">
					<img src="img/intro.png">
					<div class="flex" class="point">100,000포인트</div>
				</div>
				<div role="button" id="java">
					<img src="img/java.png">
					<div class="flex" class="point">500,000포인트</div>
				</div>
				<div role="button" id="cpp">
					<img src="img/cpp.png">
					<div class="flex" class="point">300,000포인트</div>
				</div>
			</div>
		</div>
		<div id="ad">
			<div>&lt;광고&gt;</div>
			<img src="img/korea_it.png">
		</div>
	</div>
</body>
</html>