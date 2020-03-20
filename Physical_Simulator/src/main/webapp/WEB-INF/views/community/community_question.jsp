<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">
<title>Physical Simulator - Question Community</title>

<!-- Bootstrap core CSS -->
<link href="<c:url value='/resources/css/bootstrap.min.css'/>"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<c:url value='/resources/css/navbar-static-top.css'/>"
	rel="stylesheet">
	
<script src="<c:url value='/resources/js/jquery-3.4.1.js'/>"></script>


<script type="text/javascript">
	function pageProc(currentPage, searchItem, searchKeyword) {
		location.href="<c:url value='/community/community_question' />" +"?currentPage=" + currentPage + "&searchItem=" + searchItem + "&searchKeyword=" + searchKeyword;
	};

	function writeQuest() {
		location.href="<c:url value='/community/write_question'/>"
	};


</script>
</head>


<body>

	<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include> 

	<!-- nav -->
	
	<div class="container theme-showcase" role="main">
		<div class="page-header">
			<h1>Simulate Project - Question</h1>
		</div>
		
		<table class="table table-hover">
			<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
			</thead>
			
			<tbody>
			<c:forEach items="${requestScope.questionList}" var="question">
				<tr>
					<td class="center">${question.boardnum}</td>
					<td class="center"><a href="<c:url value='/community/read_question?boardnum=${question.boardnum}'/>">
					${question.title}</a></td>
					<td>${question.userID}</td>
					<td class="center">${question.hit}</td>
					<td>${question.inputdate}</td>
				</tr>			
			</c:forEach>
			</tbody>
			
			<tr style="text-align: center;">
				<td id="navigator" colspan="5">
					<!-- javascript:pageProc() -> 자바 스크립트를 실행하도록 적는것도 가능.  -->
					<a href="javascript:pageProc(${navi.currentPage - navi.pagePerGroup}, '${searchItem}', '${searchKeyword}')">◁◁ </a> &nbsp;&nbsp;
					<a href="javascript:pageProc(${navi.currentPage - 1}, '${searchItem}', '${searchKeyword}')">◀</a> &nbsp;&nbsp;
						
					<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}"> 
						<c:if test="${counter == navi.currentPage}"><b></c:if>
						
						<a href="javascript:pageProc(${counter}, '${searchItem}', '${searchKeyword}')">${counter}</a>&nbsp;
						
						<c:if test="${counter == navi.currentPage}"></b></c:if>
					</c:forEach>
					&nbsp;&nbsp;
					<a href="javascript:pageProc(${navi.currentPage + 1}, '${searchItem}', '${searchKeyword}')">▶</a> &nbsp;&nbsp;
					<a href="javascript:pageProc(${navi.currentPage + navi.pagePerGroup}, '${searchItem}', '${searchKeyword}')">▷▷</a>
				</td>
			</tr>
		</table>
		<div style="text-align: right;">
			<button type="button" class="btn btn-default btn-sm" onclick="writeQuest()" style="margin-left: 10px;">Write</button>
		</div>
	</div>
	
	
	
	
	
	
	
	
	


<!-- Modals -->
	<jsp:include page="/WEB-INF/views/include/loginModal.jsp"></jsp:include>

	<jsp:include page="/WEB-INF/views/include/logoutModal.jsp"></jsp:include>
<!-- Modal end -->


	<!-- Placed at the end of the document so the pages load faster -->
	
	<script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>

</body>
</html>