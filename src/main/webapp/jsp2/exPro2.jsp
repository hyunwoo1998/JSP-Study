<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
// post 요청 한글처리
request.setCharacterEncoding("utf-8");

// 사용자 입력값 가져오기
String name = request.getParameter("name");
String gender = request.getParameter("gender");

// value값이 여러개일때 getParameterValues 메소드로 배열로 가져옴
String[] hobbies = request.getParameterValues("hobby");

String job = request.getParameter("job");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 
	GET방식 요청시
	http://localhost:8090/jspStudy/jsp2/exPro2.jsp?name=%ED%99%8D%EA%B8%B8%EB%8F%99&gender=female&hobby=%EC%97%AC%ED%96%89&hobby=%EA%B2%8C%EC%9E%84&hobby=%EC%95%BC%EA%B5%AC&job=%ED%9A%8C%EC%82%AC%EC%9B%90
	 -->

	<h1>exPro2.jsp 페이지</h1>
	<hr>
	
	<p>이름 : <%=name %></p>
	<p>성별 : <%=(gender != null) ? gender : "" %></p>
	<p>직업 : <%=(job == null) ? "" : job %></p>
	<p>취미 : 
	<%
	if (hobbies != null) {
		for (String hobby : hobbies) {
			%>
			<%=hobby %> &nbsp;
			<%
		}
	}
	%>
	</p>
	
</body>
</html>





