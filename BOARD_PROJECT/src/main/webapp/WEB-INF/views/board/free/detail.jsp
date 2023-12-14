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
					<div>
						<pre><c:out value="${free.content }"/></pre>
					</div>
				</li>
				
				<li>작성자:<c:out value="${free.writer }"/></li>
				<li>작성일시:<c:out value="${free.write_date2 }"/></li>
			</ul>
		</div>
		<div style="text-align:center">
			<span style="margin:20px">
				<img id="btnRec" src="<c:url value='/cdn/images/rec_cnt.jpg'/>">
				<span id="spanRecCnt">
					<c:out value="${free.rec_cnt }"/>
				</span>
			</span>
			<span style="margin:20px">
				<img id="btnNRec" src="<c:url value='/cdn/images/nrec_cnt.jpg'/>">
				<span id="spanNRecCnt">
					<c:out value="${free.nrec_cnt }"/>
				</span>
			</span>
		</div>
		<div>
			<input type="button" id="btnUpd" value="수정">
			<input type="button" id="btnDel" value="삭제">
		</div>
		<form id="frm1" action="<c:url value='/board/free/delete'/>" method="post">
			<input type="hidden" name="seq" id="seq">
		</form>
		
		<script src="<c:url value='/cdn/js/jquery-3.7.1.min.js'/>"></script>
		<script>
		 	document.getElementById('btnUpd').addEventListener('click',function(){
		 		location.href='<c:url value="/board/free/updateView?seq=${free.seq }"/>';
		 	});
		 	document.getElementById('btnDel').addEventListener('click',function(){
		 		if( confirm('정말 삭제하시겠습니까?') ){
		 			document.getElementById('seq').value = '<c:out value="${free.seq }"/>';
		 			document.getElementById('frm1').submit();
		 		}
		 	});
			document.getElementById('btnRec').addEventListener('click',function(){
			 	$.ajax({
			 		  method: 'POST'
			 		  ,url: '<c:url value="/board/free/updateRec"/>'
			 		  ,data: {
			 			  	seq: '<c:out value="${free.seq }"/>'
			 			  	,recYN: 'Y'
	 			  		}
			 		})
			 		  .done(function( msg ) {
						console.log(msg.data.rec_cnt);
						console.log($('#spanRecCnt'));
		 			  if ('success' == msg.result) {
		 				 $('#spanRecCnt').html(msg.data.rec_cnt);
		 				 $('#spanNRecCnt').html(msg.data.nrec_cnt);
			 		    } else {
			 		    	alert('서버 장애가 발생했습니다. 잠시 후 다시 시도해 주세요.');
			 		    }
		 		  	});
		 	});
			document.getElementById('btnNRec').addEventListener('click',function(){
			 	$.ajax({
			 		  method: 'POST'
			 		  ,url: '<c:url value="/board/free/updateRec"/>'
			 		  ,data: {
			 			  	seq: '<c:out value="${free.seq }"/>'
			 			  	,recYN: 'N'
	 			  		}
			 		})
			 		  .done(function( msg ) {
			 			 if ('success' == msg.result) {
			 				 $('#spanRecCnt').html(msg.data.rec_cnt);
			 				 $('#spanNRecCnt').html(msg.data.nrec_cnt);
				 		    } else {
				 		    	alert('서버 장애가 발생했습니다. 잠시 후 다시 시도해 주세요.');
				 		    }
		 		  	});
		 	});
		 	
		</script>
	</body>
</html>