<%@page import="memberinfoEx.MemberInfoDAO" %>
<%@page import="memberinfoEx.MemberInfoDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%
	// post 방식으로 전송된 값 인코딩 타입 설정
	request.setCharacterEncoding("utf-8");
	
	// form으로 넘어온 값을 변수에 저장
	int no = Integer.parseInt(request.getParameter("no"));
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String phone = request.getParameter("phone1") + "-" + request.getParameter("phone2") + "-" + request.getParameter("phone3");
	String email = request.getParameter("email");
	String addr = request.getParameter("addr");
	
	// DTO 객체에 값을 저장
	MemberInfoDTO data = new MemberInfoDTO();
	data.setNo(no);
	data.setName(name);
	data.setId(id);
	data.setPw(pw);
	data.setPhone(phone);
	data.setEmail(email);
	data.setAddr(addr);
	
	// DAO의 update 메서드 호출 / DTO 객체(data) 전달
	MemberInfoDAO manager = MemberInfoDAO.getInstance();
	manager.update(data);
%>
<%-- memberList.jsp로 이동 --%>
<script>
	alert("수정 완료");
	location.href="memberList.jsp";
</script>

