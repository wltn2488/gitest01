<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8");
   String id = request.getParameter("id");
   String pw = request.getParameter("pw");
   
   if(!id.equals("admin")) { %> 
   
   	<script> alert("아이디가 다릅니다!"); 
   			 history.back();
   	</script>
   
	<% } else if (!pw.equals("123456")){ %>
	
	<script> alert("비밀번호가 다릅니다!");
			 history.back();
	</script>
	
<% } 
   
   if(id.equals("admin") && pw.equals("123456")){
	   session.setAttribute("id", "yes");
   response.sendRedirect("loginForm.jsp");
   }
%>

</body>
</html>