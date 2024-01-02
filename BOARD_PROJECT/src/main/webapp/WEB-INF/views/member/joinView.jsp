<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<title>회원가입</title>
		<link rel="shortcut icon" href="/cdn/images/favicon.ico" type="image/x-icon" />
    	<link rel="icon" href="/cdn/images/favicon.ico" type="image/x-icon" />
	</head>
	<body>
		<h1>
			회원가입
		</h1>
		<div>
			<form id="frm1" action="<c:url value='/member/join'/>" method="post">
				<input type="text" name="id" placeholder="아이디"><br>
				<input type="password" name="pw" placeholder="비밀번호"><br>
				<input type="text" name="name" placeholder="이름"><br>
				<input type="text" name="age" placeholder="나이"><br>
				
				<input type="button" id="btnJoin" value="회원가입">
			</form>
		</div>
		<script>
			document.getElementById('btnJoin').addEventListener('click',function(){
				document.getElementById('frm1').submit();
			});
		</script>
	</body>
</html>
