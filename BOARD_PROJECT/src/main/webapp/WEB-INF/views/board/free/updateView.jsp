<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시판</title>
		<link rel="shortcut icon" href="/cdn/images/favicon.ico" type="image/x-icon" />
    	<link rel="icon" href="/cdn/images/favicon.ico" type="image/x-icon" />
 		<link rel="stylesheet" href="<c:url value='/cdn/CLEditor1_4_5/jquery.cleditor.css'/>"/>
	</head>
	<body>
		<div>
			<H1>자유 게시판</H1>
		</div>
		<div>
			<form id="frm1" action="<c:url value='/board/free/update'/>" method="post">
				<input type="hidden" name="seq" value="<c:out value="${free.seq }"/>">
				<ul>
					<li>번호:<c:out value="${free.seq }"/></li>
					<li>제목:<input type="text" name="title" value="<c:out value='${free.title }'/>"></li>
					<li>내용:<br>
						<div>
							<textarea name="content" id="content"><c:out value="${free.content }"/></textarea>
						</div>
					</li>
					<li>작성자:<c:out value="${free.writer }"/></li>
					<li>작성일시:<c:out value="${free.write_date2 }"/></li>
					<li>추천수:<c:out value="${free.rec_cnt }"/></li>
					<li>비추천수:<c:out value="${free.nrec_cnt }"/></li>
				</ul>
			</form>
		</div>
		<div>
			<input type="button" id="btnUpd" value="수정 완료">
		</div>
		<script src="<c:url value='/cdn/CLEditor1_4_5/jquery.cleditor.min.js'/>"></script>
		<script>
		 	document.getElementById('btnUpd').addEventListener('click',function(){
		 		if( confirm('정말 수정하시겠습니까?') ){
		 			document.getElementById('frm1').submit();
		 		}
		 	});
		 	
			$(document).ready(function () { $("#content").cleditor(); });
		</script>
	</body>
</html>