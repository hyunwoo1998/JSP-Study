<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
// 변수선언
String id = "aaa";
String passwd = "1234";
int age = 22;

// 출력형식
//  <p> ...님의 비밀번호는 ...이고, 나이는 ... 입니다. </p>
out.print("<p>" + id + "님의 비밀번호는 " + passwd + "이고, 나이는 " + age + " 입니다.</p>");
%>

<p><%=id %>님의 
비밀번호는 <%=passwd %>이고, 
나이는 <%=age %> 입니다.</p>

</body>
</html>









