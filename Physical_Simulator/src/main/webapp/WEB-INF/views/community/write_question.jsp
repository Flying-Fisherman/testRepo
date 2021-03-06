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
<title>Physical Simulator - Question Write</title>

<!-- Bootstrap core CSS -->
<link href="<c:url value='/resources/css/bootstrap.min.css'/>"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<c:url value='/resources/css/navbar-static-top.css'/>"
	rel="stylesheet">
	
<script src="<c:url value='/resources/js/jquery-3.4.1.js'/>"></script>


<script type="text/javascript">
	function boardWriteConfirm() {
		if(confirm('작성하시겠습니까?')) {
			
			return true;
		}
		return false;
	}
</script>
</head>


<body>

	<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include> 

	<!-- nav -->
	
	<div class="container theme-showcase" role="main">
		<div class="page-header">
			<h1>Simulate Project - What is your Question?</h1>
		</div>
	<form action="<c:url value='/community/write_question_process' />" method="POST">
			<table class="table">
				<tr>
					<th>작성자</th>
					<td>
						${sessionScope.userID}
					</td>
				</tr>
				
				<tr>
					<th>제목</th>
					<td>
						<input type="text" name="title" placeholder="제목 입력" class="form-control"/>
					</td>
				</tr>
				
				<tr>
					<th>내용</th>
					<td>
						<textarea name="content" placeholder="내용을 입력하세요." style="resize: none;" class="form-control" rows="20"></textarea>
					</td>
				</tr>
			</table>
			<input type="submit" value="Write" onclick="return boardWriteConfirm()"/>
			<a href="<c:url value='/community/community_question' />"><input type="button" value="Back"/></a>
		</form>
	</div>
	
	
	
	
	
	
	
	


<!-- Modals -->
	<jsp:include page="/WEB-INF/views/include/loginModal.jsp"></jsp:include>

	<jsp:include page="/WEB-INF/views/include/logoutModal.jsp"></jsp:include>
<!-- Modal end -->


	<!-- Placed at the end of the document so the pages load faster -->
	
	<script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>

</body>
</html>
