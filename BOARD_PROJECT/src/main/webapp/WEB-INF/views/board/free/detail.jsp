<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시판</title>
	</head>
	<body>
		<div>
			<H1>자유 게시판</H1>
		</div>
		<div>
			<ul>
				<li>번호:<c:out value="${free.seq }"/></li>
				<li>제목:<c:out value="${free.title }"/></li>
				<li>내용:<br>
					<pre><c:out value="${free.content }"/></pre>
				</li>
				
				<li>작성자:<c:out value="${free.writer }"/></li>
				<li>작성일시:<c:out value="${free.write_date2 }"/></li>
				<li>추천수:<c:out value="${free.rec_cnt }"/></li>
				<li>비추천수:<c:out value="${free.nrec_cnt }"/></li>
			</ul>
		</div>
	</body>
</html>