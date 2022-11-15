<%@page import="com.example.domain.MemberVO"%>
<%@page import="com.example.repository.MemberDAO"%>
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

<%
// post 요청 한글처리
request.setCharacterEncoding("utf-8");

// passwd 가져오기
String passwd = request.getParameter("passwd");

// MemberDAO 객체 준비
MemberDAO memberDAO = MemberDAO.getInstance();

MemberVO memberVO = memberDAO.getMemberById(id);

if (passwd.equals(memberVO.getPasswd())) {
	
	memberDAO.deleteById(id); // DB 레코드 삭제
	%>
	<script>
		alert('회원삭제 성공');
		location.href = 'loginForm.jsp';
	</script>
	<%
} else {
	%>
	<script>
		alert('비밀번호 틀림');
		history.back();
	</script>
	<%
}
%>







