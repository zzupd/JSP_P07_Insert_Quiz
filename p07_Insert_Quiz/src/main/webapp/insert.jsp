<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Connection conn = null;
PreparedStatement pstmt = null;

String title = "연습글입니다.";
String content = "글내용 테스트";
String writer = "테스터01";


try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	String url="jdbc:mysql://localhost:3306/insertQuiz?";
	url += "useSSL=false&";
	url += "useUnicode=true&";
	url += "characterEncoding=UTF8&";
	url += "serverTimezone=Asia/Seoul&";
	url += "allowPublicKeyRetrieval=true";
	
	String uid = "root";
	String upw = "1234";
	
	conn = DriverManager.getConnection(url, uid, upw);
	
	out.print("접속 성공!!");
	
	String sql = "insert into bbs (title, content, writer) values ";
	sql += "(?, ?, ?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, title);
	pstmt.setString(2, content);
	pstmt.setString(3, writer);
	int rtnCnt = pstmt.executeUpdate();
	if (rtnCnt == 1) {
		out.print("정상 입력 완료!");
	} else {
		out.print("입력 실패!");
	}
	
} catch(ClassNotFoundException e) {
	out.print(e.getMessage());
} catch(SQLException e) {
	out.print(e.getMessage());
} 
%>        
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="/style/style.css?v">
</head>
<body>
	<div id="wrap">
		
	</div>
	<!-- div#wrap -->
	<script src="/script/jquery-3.7.1.min.js"></script>
	<script src="/script/script.js"></script>
</body>
</html>    