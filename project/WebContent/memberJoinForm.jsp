<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 폼</title>
<style>
	h1{
	
	font-size:35px;
	padding-bottom:25px;
	text-align: left;
	border-bottom:2px solid black;
	
	}
	
	#div1{display: inline-block; 
	border: 1px solid white; 
	padding: 5px;
	
	background-color:#22741C;
	color:white;
	text-align: center;
	width:125px;
	height:25px;
	}
	</style>
</head>
<body>
	<h1>회원가입</h1>
	<form action="memberJoin.jsp" method="post">
		<div id ="div1">이름 </div> <input type="text" style="width:150px;height:18px"name="name" size="10" placeholder="홍길동" autofocus required/><br>
		<div id ="div1">아이디</div><input type="text" style="width:150px;height:18px"name="id" size="10" placeholder="아이디" autofocus required/><br>
		<div id = "div1">비밀번호</div><input type="password" style="width:150px;height:18px" name="pw" placeholder="비밀번호"autofocus required/><br>
		<div id ="div1">핸드폰 </div> <input type="text" style="width:50px;height:18px"name="phone1" size="5" required/> -
		<input type="text" style="width:50px;height:18px" name="phone2" size="5" required/> -
		<input type="text" style="width:50px;height:18px"name="phone3" size="5" required/><br>
		<div id ="div1">이메일 </div> <input type="text" name="email" size="20"/><br>
		<div id ="div1">주소 </div> <input type="text"  style="width:350px;height:18px" name="addr" size="30"/><br>
		<input type="submit" value="확인">
	</form>

</body>
</html>