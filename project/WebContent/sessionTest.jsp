<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% if(session.getAttribute("id") != "yes") { %>
<form method=get action=sessionResult.jsp>
 <table border=1>
 	<tr><td>아이디</td>
 		<td><input type="text" name="id" autofocus placeholder="아이디" required></td>
 	</tr>
 	<tr><td>비밀번호</td>
 		<td><input type="password" name="pw" placeholder="비밀번호" required></td>
 	</tr>
 	<tr>
 		<td colspan=2 align=center><input type="submit" value="로그인"></td>
 	</tr>
 </table>
</form>
<% } else { %>
<form method=get action=Logout.jsp>
 <table border=1>
 	<tr>
 		<td align=center>관리자님 환영!</td>
 	</tr>
 	<tr>
 		<td align=center><input type="submit" value="로그아웃"></td>
 	</tr>
 </table>
</form>
<%} %>
</body>
</html>