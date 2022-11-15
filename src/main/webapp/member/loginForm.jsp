<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
// 쿠키값 가져오기
Cookie[] cookies = request.getCookies();

if (cookies != null) {
	for (Cookie cookie : cookies) {
		if (cookie.getName().equals("loginId")) {
			String loginId = cookie.getValue();
			// 쿠키로부터 찾은 로그인 아이디를 세션에 저장해서 로그인 처리.
			session.setAttribute("id", loginId);
			// main.jsp로 이동
			response.sendRedirect("main.jsp");
		}
	}
}
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>로그인</h1>
	<hr>
	
	<form action="loginPro.jsp" method="post">
		아이디 : <input type="text" name="id" required><br>
		비밀번호 : <input type="password" name="passwd" required><br>
		<input type="checkbox" name="rememberMe" value="Y">로그인 상태 유지<br>
		<input type="submit" value="로그인"><br>
		<input type="button" value="회원가입" onclick="location.href = 'joinForm.jsp'">
	</form>
	
	<script>
// 		var btn = document.querySelector('input[type="button"]');
// 		btn.addEventListener('click', function () {
// 			location.href = 'joinForm.jsp';
// 		});
	</script>
</body>
</html>





