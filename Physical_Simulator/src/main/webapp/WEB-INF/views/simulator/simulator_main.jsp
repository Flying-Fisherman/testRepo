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
<title>Physical Simulator - Simulate Main</title>

<!-- Bootstrap core CSS -->
<link href="<c:url value='/resources/css/bootstrap.min.css'/>"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<c:url value='/resources/css/navbar-static-top.css'/>"
	rel="stylesheet">

<script src="<c:url value='/resources/js/jquery-3.4.1.js'/>"></script>

</head>


<body>
	<!-- nav-include -->
	<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>




	<div class="container theme-showcase" role="main">
		<div class="page-header">
			<h1>Simulate Project - Just See, That's EASY</h1>
		</div>
		<div class="jumbotron" style="height: 300px;">
			<div class="col-md-3">
				<a href="<c:url value='/simulator/simulator_simulate?topic=wheel'/>"> <img
					data-src="<c:url value='/resources/pic/wagon_effect.gif'/>" class="img-thumbnail" alt="AAAAAAA"
					src="<c:url value='/resources/pic/wagon_effect.gif'/>"
					style="height: 150px; width: 200px;">>
					<p>Wagon-Wheel Effect</p>
				</a>
				
			</div>

			<div class="col-md-3">
				<a href="<c:url value='/simulator/simulator_simulate?topic=bal'/>"> <img
					data-src="<c:url value='/resources/pic/ballistics.gif'/>" class="img-thumbnail" alt="AAAAAAA"
					src="<c:url value='/resources/pic/ballistics.gif'/>"
					style="height: 150px; width: 200px;">
					<p>Ballistics With Gravity</p>
				</a>
			</div>

			<div class="col-md-3">
				<a href="<c:url value='#MyFalut....'/>"> <img
					data-src="" class="img-thumbnail" alt="시간이 부족해서 미구현....1">
				</a>
			</div>

			<div class="col-md-3">
				<a href="<c:url value='#MyLose...'/>"> <img
					data-src="" class="img-thumbnail" alt="시간이 부족해서 미구현....2">
				</a>
			</div>
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