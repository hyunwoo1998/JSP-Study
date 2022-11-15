<%@page import="com.example.domain.MemberVO"%>
<%@page import="com.example.repository.MemberDAO"%>
<%@page import="java.sql.Timestamp"%>
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
// post 요청 텍스트 데이터 한글처리
request.setCharacterEncoding("utf-8");

// 액션태그 이용해서 폼 파라미터값 가져와서 설정하기
%>

<jsp:useBean id="memberVO" class="com.example.domain.MemberVO" />

<jsp:setProperty property="*" name="memberVO"/>

<%
memberVO.setRegDate(new Timestamp(System.currentTimeMillis()));

// MemberDAO 객체 준비
MemberDAO memberDAO = MemberDAO.getInstance();

// DB 테이블에서 id에 해당하는 데이터 행 가져오기
MemberVO dbMemberVO = memberDAO.getMemberById(memberVO.getId());

// 비밀번호 일치하면 회원정보 수정하기
if (memberVO.getPasswd().equals(dbMemberVO.getPasswd())) {
	
	memberDAO.updateById(memberVO); // 수정
	%>
	<script>
		alert('회원정보 수정성공');
		location.href = 'main.jsp';
	</script>	
	<%
} else {
	%>
	<script>
		alert('비밀번호 틀림');
		history.back(); // 뒤로가기
	</script>
	<%
}
%>








