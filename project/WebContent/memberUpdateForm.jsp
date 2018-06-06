<%@page import="java.util.StringTokenizer"%>
<%@page import="memberinfoEx.MemberInfoDTO"%>
<%@page import="memberinfoEx.MemberInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%
	// memberList.jsp로 부터 넘어온 no의 값
	int no = Integer.parseInt(request.getParameter("no"));
	
	MemberInfoDAO manager = MemberInfoDAO.getInstance();
	// no 값을 전달하여 getMember 메서드 호출하여 리턴 된 값 저장
	MemberInfoDTO member = manager.getMember(no);
	// phone 번호 자르기
	StringTokenizer tokens = new StringTokenizer(member.getPhone());
	String phone1 = tokens.nextToken("-");
	String phone2 = tokens.nextToken("-");
	String phone3 = tokens.nextToken("-");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 수정 폼</title>
</head>
<body>
	<form action="memberUpdate.jsp" method="post">
		<%-- member에 저장된 값을 value 속성을 이용하여 출력 --%>
		<input type="hidden" name="no" value="<%=no%>">
		이름 : <input type="text" name="name" size="10" value="<%=member.getName()%>"><br>
		아이디:<input type="text" name="id" size="10" value="<%=member.getId()%>"><br>
		비밀번호:<input type="password" name="pw" size="10" value="<%=member.getPw()%>"><br>
		핸드폰 : <input type="text" name="phone1" size="5" value="<%=phone1%>"> - 
		<input type="text" name="phone2" size="5" value="<%=phone2%>"> - 
		<input type="text" name="phone3" size="5" value="<%=phone3%>"><br>
		이메일 : <input type="text" name="email" size="20" value="<%=member.getEmail()%>"><br>
		주소 : <input type="text" name="addr" size="30" value="<%=member.getAddr()%>"><br>
		<input type="submit" value="수정">
	</form>
</body>
</html>