<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시판</title>
	  	<link rel="stylesheet" href="<c:url value='/cdn/css/jquery-ui.min.css'/>">
		<style>
			.spanPage {
			    cursor: pointer; /* 마우스 커서를 포인터로 변경 */
			}
		    .hoveredPage {
	            background-color: blue; /* 마우스 오버 시 배경 색상을 빨간색으로 변경 (원하는 색상으로 수정) */
	            color: #fff; /* 마우스 오버 시 텍스트 색상을 흰색으로 변경 (원하는 색상으로 수정) */
	        }
		</style>
	</head>
	<body>
		<div>
			<h1>자유게시판</h1>
		</div>
		<div>
			기간 선택:
			<input type="text" id="fCalendar" style="width:100px" value="<c:out value='${rp.fWrite }'/>">
			~ <input type="text" id="tCalendar" style="width:100px" value="<c:out value='${rp.tWrite }'/>"> 
		</div>
		<div>
			<input type="text" id="titleSearch" value="<c:out value='${rp.title }'/>" placeholder="제목을 입력하세요" style="width:30%">
			<input type="button" id="btnSearch" value="조회">
		</div>
		<div>
			<ul>
				<c:forEach var="free" items="${list }">
					<li>
						<c:out value="${free.seq }"/> |
						<a href="<c:url value='/board/free/detail?seq=${free.seq }'/>">
							<c:out value="${free.title }"/>
						</a> |
						<c:out value="${free.writer }"/> |
						<c:out value="${free.write_date }"/>
					</li>
				</c:forEach>
			</ul>
		</div>
		<div style="text-align: center">
			<c:forEach var="page" begin="1" end="${totalPage }">
				<c:if test="${page == rp.page}">
					<span class="spanPage" data-page="${page }" style="margin:10px; color:red; font-weight:bold">[${page }]</span>
				</c:if>
				<c:if test="${page != rp.page}">
					<span class="spanPage" data-page="${page }" style="margin:10px;">[${page }]</span>
				</c:if>
			</c:forEach>
		</div>
		<form id="frm1" action="<c:url value='/board/free/listView'/>" method="post">
			<input type="hidden" id="page" name="page">
			<input type="hidden" id="title" name="title">
			<input type="hidden" id="fWrite" name="fWrite">
			<input type="hidden" id="tWrite" name="tWrite">
		</form>
		<script src="<c:url value='/cdn/js/jquery-3.7.1.min.js'/>"></script>
		<script src="<c:url value='/cdn/js/jquery-ui.min.js'/>"></script>
		<script>

			 $( function() {
				    $( "#fCalendar" ).datepicker({
				    	dateFormat: 'yymmdd'
				    });
				    $( "#tCalendar" ).datepicker({
				    	dateFormat: 'yymmdd'
				    });
			  } );
		 
			 $('.spanPage').on('mouseenter', function () {
		            $(this).addClass('hoveredPage'); // 마우스 오버 시 hoveredPage 클래스 추가
		        }).on('mouseleave', function () {
		            $(this).removeClass('hoveredPage'); // 마우스 떠날 때 hoveredPage 클래스 제거
		        });
		
			$('.spanPage').on('click', function(){
				
	            $('.spanPage').removeClass('hoveredPage'); // 다른 페이지를 클릭하면 이전에 마우스 오버한 페이지의 스타일을 초기화

				$('#page').val($(this).data('page')); // this 대신 $('.spanPage')로 써도됨
				$('#title').val($('#titleSearch').val());
				$('#frm1').submit();
			});
		
			$('#btnSearch').on('click', function(){
				$('#title').val($('#titleSearch').val());
				$('#fWrite').val($('#fCalendar').val());
				$('#tWrite').val($('#tCalendar').val());
				$('#frm1').submit();
			});
			
		</script>
		
		
	</body>
</html>