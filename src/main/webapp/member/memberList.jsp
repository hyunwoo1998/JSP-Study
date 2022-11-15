<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.example.domain.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="com.example.repository.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
//로그인 검증하기. 세션값 가져오기
String id = (String) session.getAttribute("id");
//로그인 세션값이 없거나 관리자 아이디가 아니면, main.jsp로 이동
if (id == null || !id.equals("admin")) {
	response.sendRedirect("main.jsp");
	return;
}
%>

<%
MemberDAO memberDAO = MemberDAO.getInstance();

List<MemberVO> memberList = memberDAO.getMembers();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>회원목록</h1>
	<hr>
	
	<table border="1">
		<thead>
			<tr>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
				<th>이메일</th>
				<th>이메일 수신</th>
				<th>가입날짜</th>
			</tr>
		</thead>
		<tbody>
		<%
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일 a hh시mm분ss초");
		
		for (MemberVO member : memberList) {
			Timestamp regDate = member.getRegDate();
			String strDate = sdf.format(regDate);
			%>
			<tr>
				<td><%=member.getId() %></td>
				<td><%=member.getPasswd() %></td>
				<td><%=member.getName() %></td>
				<td><%=member.getEmail() %></td>
				<td><%=member.getRecvEmail() %></td>
				<td><%=strDate %></td>
			</tr>
			<%
		} // for
		%>
		</tbody>
	</table>
	
	<h3><a href="main.jsp">메인화면</a></h3>

</body>
</html>









