<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>자유 게시판</title>
		<link rel="shortcut icon" href="/cdn/images/favicon.ico" type="image/x-icon" />
    	<link rel="icon" href="/cdn/images/favicon.ico" type="image/x-icon" />
	</head>
	<body>
		<div>
			<H1>게시글 등록 화면</H1>
		</div>
		<div>
			<form id="frm1" method="post" action="<c:url value='/board/free/write'/>" enctype="multipart/form-data">
				<input type="text" name="title" placeholder="제목"><br><!-- name mapper와 동일하게 넣어서 보낸다 -->
				<input type="file" name="file"><br>
				<textarea name="content"></textarea><br>
				<input id="btnWrite" type="button" value="작성"><br>
			</form>		
		</div>
		<script>
			document.getElementById('btnWrite').addEventListener('click', function(){
				document.getElementById('frm1').submit();
			});
		</script>
	</body>
</html>