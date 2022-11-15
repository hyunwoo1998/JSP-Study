<%@page import="java.sql.Timestamp"%>
<%@page import="com.example.domain.MemberVO"%>
<%@page import="com.example.repository.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- post 요청 한글처리 --%>
<% request.setCharacterEncoding("utf-8"); %>

<%-- MemberVO 객체 준비 --%>
<jsp:useBean id="memberVO" class="com.example.domain.MemberVO"/>

<%-- 사용자 입력값 가져오기 -> MemberVO 객체에 저장하기 --%>
<jsp:setProperty property="*" name="memberVO"/>

<%-- 회원가입날짜 설정 --%>
<% memberVO.setRegDate(new Timestamp(System.currentTimeMillis())); %>

<%-- MemberDAO 객체 준비 --%>
<% MemberDAO memberDAO = MemberDAO.getInstance(); %>

<%-- insert (회원가입) 처리하기 --%> 
<% memberDAO.insert(memberVO); %>

<script>
	alert('회원가입 성공');
	location.href = 'loginForm.jsp'; // 로그인 화면 요청
</script>








