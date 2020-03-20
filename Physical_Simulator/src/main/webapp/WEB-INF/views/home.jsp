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
<title>Physical Simulator - Main Page</title>

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

	<c:if test="${requestScope.checkRes == true}">
		<script type="text/javascript">
			alert('会員登録が成功しました。');
		</script>
	</c:if>
	<c:if test="${requestScope.checkRes == false}">
		<script type="text/javascript">
			alert('会員登録に失敗しました。');
		</script>
	</c:if>

	<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include> 

	<div class="container">

		<!-- Main component for a primary marketing message or call to action -->
		<div class="jumbotron"
			style="background-image: url('<c:url value="/resources/pic/Robot.jpg"/>'); background-repeat: no-repeat;">
			<h2 style="font-size: xx-large; padding-left: 220px;">まだ知らない?
				ヒューマン</h2>

			<p style="padding-left: 675px;">あなたの疑問を解いてあげます!</p>
			<p style="padding-left: 675px;">대충 하고 싶은말</p>
			<p style="padding-left: 675px;">대충 도움 많이 된다는 말</p>
			<p style="padding-left: 675px;">
				<a class="btn btn-lg btn-primary" href="<c:url value='/simulator/simulator_main'/>"
					role="button">実験しに行く! &nbsp; &nbsp; &nbsp; &raquo;</a>
			</p>
		</div>

	</div>
	<!-- /container -->

	<div class="container">
		<div class="jumbotron"
			style="background-color: rgb(163, 158, 203); text-align: center;">
			<h1>공 지 사 항</h1>
			<p>아직 만들어진것도 적고 CSS에 재능이 부족하여 모양새가 영 이러하니 부디 너그러이 용서하여 주시길 바랍니다...</p>
			<p>CSS를 어뜨케 해보려 했지만... 어뜨게 당한건 본인이였고...</p>
			<h3>덕분에 공부 빡세게 했으나 시간은 그렇지 못하였습니다</h3>
			<p>왠만한 기능들은 로그인을 하지 않으면 접속할 수 없게 막아놨습니다..(인터세에에에엡트)</p>
			<p>왜냐면 modal로 로그인을 해서 보낼 방법을 아직 못찾았기 때문에 필히 로그인을 해 주시길 바랍니다</p>
			<p>ps. 덕분에 영어와 일본어와 한글이 뒤섞인 혼란스러운 홈페이지를 보고 계십니다......</p>
		</div>
	</div>


	<!-- Bootstrap core JavaScript
    ================================================== -->
<!-- Modals -->
	<jsp:include page="/WEB-INF/views/include/loginModal.jsp"></jsp:include>

	<jsp:include page="/WEB-INF/views/include/logoutModal.jsp"></jsp:include>
<!-- Modal end -->


	<!-- Placed at the end of the document so the pages load faster -->
	
	<script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>

</body>
</html>
