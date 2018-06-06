<%@page import="memberinfoEx.MemberInfoDAO"%>
<%@page import="memberinfoEx.MemberInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<% 
	request.setCharacterEncoding("utf-8");

	// form 으로 넘어온 값을 변수에 저장
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String phone = request.getParameter("phone1") + "-" + request.getParameter("phone2") + "-" + request.getParameter("phone3");
	String email = request.getParameter("email");
	String addr = request.getParameter("addr");
	
	// DTO 객체에 값을 저장
	MemberInfoDTO data = new MemberInfoDTO();
	data.setName(name);
	data.setId(id);
	data.setPw(pw);
	data.setPhone(phone);
	data.setEmail(email);
	data.setAddr(addr);
	
	// DAO의 insert 메소드 호출 / DTO 객체 전달
	MemberInfoDAO manager = MemberInfoDAO.getInstance();
	manager.insert(data);
%>
	
	<script>
		alert("회원가입 성공");
		location.href="memberList.jsp";
	</script>