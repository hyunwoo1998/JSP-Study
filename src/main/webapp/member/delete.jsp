<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
//로그인 검증하기. 세션값 가져오기
String id = (String) session.getAttribute("id");
//로그인 세션값 없으면, loginForm.jsp로 이동
if (id == null) {
	response.sendRedirect("loginForm.jsp");
	return;
}
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>회원삭제</h1>
	<hr>
	
	<form action="deletePro.jsp" method="post" id="frm">
		아이디 : <input type="text" name="id" value="<%=id %>" readonly><br>
		비밀번호 : <input type="password" name="passwd"><br>
		<input type="button" value="회원삭제" id="btn">
	</form>

	<script>
		var btn = document.getElementById('btn');
		var frm = document.getElementById('frm');
		
		btn.addEventListener('click', function () {
			// alert() - 알림, confirm() - 확인 취소 버튼2개, prompt() - 직접 텍스트상자 입력
			var isDelete = confirm('정말 회원 탈퇴하시겠습니까?'); // true/false 리턴
			console.log('isDelete : ' + isDelete);
			
			if (isDelete == true) {
				frm.submit();
			}
		});
	</script>
</body>
</html>






