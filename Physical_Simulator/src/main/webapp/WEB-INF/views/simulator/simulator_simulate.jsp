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
<title>Physical Simulator - Simulator LAB</title>

<!-- Bootstrap core CSS -->
<link href="<c:url value='/resources/css/bootstrap.min.css'/>"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<c:url value='/resources/css/navbar-static-top.css'/>"
	rel="stylesheet">

<script src="<c:url value='/resources/js/jquery-3.4.1.js'/>"></script>

<script type="text/javascript">

</script>

</head>
<body>
	<!-- nav-include -->
	
	<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
	
	
	<div class="container">
		<div class="jumbotron">
			<c:choose>
				<c:when test="${requestScope.topic == 'wheel' }">
					<jsp:include page="/WEB-INF/views/include/wheel.jsp"></jsp:include>
				</c:when>
				<c:when test="${requestScope.topic == 'bal' }">
					<jsp:include page="/WEB-INF/views/include/ballistics.jsp"></jsp:include>
				</c:when>
				<c:when test="${requestScope.topic == a }">
					<jsp:include page="/WEB-INF/views/include/wheel.jsp"></jsp:include>
				</c:when>
				<c:when test="${requestScope.topic == b }">
					<jsp:include page="/WEB-INF/views/include/wheel.jsp"></jsp:include>
				</c:when>
			</c:choose>
			
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