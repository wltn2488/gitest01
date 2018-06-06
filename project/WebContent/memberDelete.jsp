<%@page import="memberinfoEx.MemberInfoDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	
	int no = Integer.parseInt(request.getParameter("no"));
	
	MemberInfoDAO manager = MemberInfoDAO.getInstance();
	manager.delete(no);
%>
	<script>
		alert("삭제 완료");
		location.href="memberList.jsp";
	</script>
