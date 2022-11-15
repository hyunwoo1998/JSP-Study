<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
// POST 요청일 경우 문자셋 정보를 설정. 유니코드 문자로 변환해줌.
request.setCharacterEncoding("utf-8");

// request : 요청 내장객체.
//           톰캣이 사용자 요청을 받으면 요청정보를 HttpServletRequest 객체로 변환해서
//           호출한 jsp페이지에 request 변수로 전달해줌.
String name = request.getParameter("name");
String strAge = request.getParameter("age"); // "22"
int age = Integer.parseInt(strAge); // 22
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 
	GET요청
	http://localhost:8090/jspStudy/jsp2/exPro1.jsp?name=홍길동&age=22 
	
	POST요청
	http://localhost:8090/jspStudy/jsp2/exForm1.jsp
	-->

	<h1>exPro1.jsp 페이지</h1>
	<hr>

	<p>이름 : <%=name %></p>
	<p>나이 : <%=strAge %></p>
	<p>나이(문자열 + 숫자) : <%=strAge + 10 %></p>
	<p>나이(숫자 + 숫자) : <%=age + 10 %></p>
	
<p>
<%
// 나이가 20세 이상이면 -> "...님은 성인 입니다."
// 나이가 20세 미만이면 -> "...님은 미성년자 입니다."
	if (age >= 20) {
		out.print(name + "님은 성인 입니다.");
	} else { // age < 20
		out.print(name + "님은 미성년자 입니다.");
	}
%>
</p>
<hr>
<%
	if (age >= 20) {
		%><p><%=name %>님은 성인 입니다.</p><%
	} else { // age < 20
		%><p><%=name %>님은 미성년자 입니다.</p><%
	}
%>
	
</body>
</html>








