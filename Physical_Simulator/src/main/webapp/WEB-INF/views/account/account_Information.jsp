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

<title>Physical Simulator - Information</title>

<!-- Bootstrap core CSS -->
<link href="<c:url value='/resources/css/bootstrap.min.css'/>"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<c:url value='/resources/css/navbar-static-top.css'/>"
	rel="stylesheet">

<script src="<c:url value='/resources/js/jquery-3.4.1.js'/>"></script>

<style type="text/css">
.infoName {
	width: 150px;
	height: 100px;
	text-align: left;
	padding-left: 20px !important;
	padding-top: 20px !important;
	font-size: 150%;
	vertical-align: top;
}
;
</style>

<script type="text/javascript">

		$(function() {
			var tempID = '${requestScope.vo.userID}';
			var tempName = '${requestScope.vo.userName}';
			var tempPhone = '${requestScope.vo.userPhone}';
			var tempBirth = '${requestScope.vo.userBirth}';

			tempID = changeData(tempID);
			tempName = changeData(tempName);
			tempPhone = changePhone(tempPhone);
			var tempAge = String(tempBirth).substr(0,4);
			var age = 2020 - parseInt(tempAge)

			$('#tempID').text(tempID);
			$('#tempName').text(tempName);
			$('#tempPhone').text(tempPhone);
			$('#tempAge').text(age);
		});

		function changeData(data) {
			var temp = String(data).length;
			var str = ""
			for (var i = 0 ; i < parseInt(temp) - 2 ; i++) {
				str += "*"	
			};

			data = String(data).replace( String(data).substr(1, parseInt(temp - 2)) , str);

			return data;
		}

		function changePhone(data) {
			var temp = String(data).length;
			var str = ""
			for (var i = 3 ; i < parseInt(temp) - 3 ; i++) {
				str += "*"	
			};

			data = String(data).replace( String(data).substr(4, parseInt(temp) - 7) , str);

			return data;
		}

		var signup = function() {
			location.href = "/myproject/account/account_SignUp"
		}

		var userPage = function() {
			location.href = "/myproject/account/account_MyPage"
		}

		var userInfo = function() {
			location.href = "/myproject/account/account_Information"
		}

		var infoModify = function() {
			location.href = "/myproject/account/account_Modify"
		}
    </script>
</head>

<body>

	<c:if test="${requestScope.modifyRes == true}">
		<script type="text/javascript">
			alert('修正に成功しました。');
		</script>
	</c:if>
	<c:if test="${requestScope.modifyRes == false}">
		<script type="text/javascript">
			alert('修正に失敗しました。');
		</script>
	</c:if>

	<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include> 


	<div class="container">

		<!-- Main component for a primary marketing message or call to action -->
		<div class="jumbotron">
			<div Style="text-align: center;">
				<h1>会 員 情 報</h1>
				<h2>基本情報のみ表示されます。</h2>
			</div>
			<div class="container">
				<div class="col-md-10 col-md-offset-1">
					<table class="table table-hover table-bordered infoTable">
						<tr>
							<th class="infoName">ID</th>
							<td style="vertical-align: middle; background-color: white; padding-left: 20px;">
								<p id="tempID" style="margin-bottom: 5px;"></p>
								<p style="font-size: 120%;">追加情報は本人認証を通じて知ることができます。</p>

							</td>
						</tr>

						<tr>
							<th class="infoName">お名前</th>
							<td style="vertical-align: middle; background-color: white; padding-left: 20px;">
								<p id="tempName" style="margin-bottom: 5px;"></p>
								<p style="font-size: 120%;">追加情報は本人認証を通じて知ることができます。</p>
							</td>
						</tr>

						<tr>
							<th class="infoName">電話番号</th>
							<td style="vertical-align: middle; background-color: white; padding-left: 20px;">
								<p id="tempPhone" style="margin-bottom: 5px;"></p>
								<p style="font-size: 120%;">追加情報は本人認証を通じて知ることができます。</p>
							</td>
						</tr>

						<tr>
							<th class="infoName">お歳</th>
							<td style="vertical-align: middle; background-color: white; padding-left: 20px;">
								<p id="tempAge" style="margin-bottom: 5px;"></p>

							</td>
						</tr>
					</table>
				</div>
				<div class="col-md-2 col-md-offset-10">
					<button type="button" class="btn btn-primary btn-lg"
						onclick="infoModify()">修整</button>
				</div>
			</div>
		</div>

	</div>
	<!-- /container -->

	<!-- Modals -->
	<jsp:include page="/WEB-INF/views/include/loginModal.jsp"></jsp:include>

	<jsp:include page="/WEB-INF/views/include/logoutModal.jsp"></jsp:include>
<!-- Modal end -->


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>
</body>
</html>
