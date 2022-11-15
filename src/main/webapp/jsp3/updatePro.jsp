<%@page import="java.sql.Timestamp"%>
<%@page import="com.example.domain.MemberVO"%>
<%@page import="com.example.repository.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
// post 요청 한글처리
request.setCharacterEncoding("utf-8");

// MemberVO 객체 준비
MemberVO memberVO = new MemberVO();

// 사용자 입력값 가져오기 -> MemberVO 객체에 저장하기
memberVO.setId(request.getParameter("id"));
memberVO.setPasswd(request.getParameter("passwd"));
memberVO.setName(request.getParameter("name"));
memberVO.setEmail(request.getParameter("email"));
memberVO.setRecvEmail(request.getParameter("recvEmail"));
memberVO.setRegDate(new Timestamp(System.currentTimeMillis()));

System.out.println(memberVO.toString()); // 서버 콘솔 출력

// MemberDAO 객체 준비
MemberDAO memberDAO = MemberDAO.getInstance();

// update (회원수정) 처리하기
memberDAO.updateById(memberVO);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>회원수정 처리결과</h1>
	<hr>

	<p>회원수정 성공!</p>

</body>
</html>




