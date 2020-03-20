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
<title>Physical Simulator - Account Modify</title>

<!-- Bootstrap core CSS -->
<link href="<c:url value='/resources/css/bootstrap.min.css'/>"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<c:url value='/resources/css/navbar-static-top.css'/>"
	rel="stylesheet">
	
<script src="<c:url value='/resources/js/jquery-3.4.1.js'/>"></script>

<style type="text/css">
	.phoneVar {
		text-align: center;
		font-size: 200%;
	}
	
	.calText {
		text-align: center;
		font-size: 150%;
		padding-left: 0px;
	}
</style>


<script type="text/javascript">
	var signup = function() {
		location.href = "/myproject/account/account_SignUp"
	}

	var userPage = function() {
		location.href = "/myproject/account/account_MyPage"
	}

	var userInfo = function() {
		location.href = "/myproject/account/account_Information"
	}

	$(function() {
		
		calCal();
	});

	function calCal() {
			$('#yearCalc, #monthCalc').change(function() {
				var year = $('#yearCalc option:selected').val();
				var yearCount = 0
				if( year % 4 == 0 && year % 100 != 0 ) {yearCount = 1}

				if ( year % 400 == 0 ) { yearCount = 1 }
				
				var month = $('#monthCalc option:selected').val();
				var dayMax = 0;
				
				if(month <= 7 && month != 2 ) {
					if((parseInt(month) + 1) % 2 == 0){ dayMax = 31; }
					else { dayMax = 30; }
				} else if (month > 7) {
					if(month % 2 == 0) { dayMax = 31; }
					else { dayMax = 30; }
				} else{ dayMax = 28 + yearCount }

				var str = '';
				for(var i = 1 ; i <= dayMax ; i++ ){
					str += '<option value=' + i + '>'+i+'</option>';
				};
				
				$('#dayCalc').html(str);
			});
	};

	function haveValue() {
		var phone1 = document.getElementById('inputPhone1');
		var phone2 = document.getElementById('inputPhone2');
		var phone3 = document.getElementById('inputPhone3');
		var month = $('#monthCalc').val();
		var day = $('#dayCalc').val();
		
		if(month.length < 2) {
			month = "0" + month;
		} 

		if(day.length < 2) {
			day = "0" + day;
		} 
		
		var birth = $('#yearCalc').val() + "-" + month + "-" + day;

		$('#tempBirth').val(birth);

		if(phone2.value.length < 3 || phone2.value.length > 4 || phone3.value.length != 4) {
			alert('電話番号を確認してください。');
			return false;
		};

		if(!isNaN(phone2) || !isNaN(phone3)) {
			alert('電話番号を確認してください。');
			return false;
		};

		var userPhone = phone1.value + phone2.value + phone3.value;
		document.getElementById('phoneAll').value = userPhone;
		
	};

</script>
</head>


<body>

	<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include> 

<form action="<c:url value='/account/account_ModifyProcess'/>" method="POST">
	<div class="container">

		<!-- Main component for a primary marketing message or call to action -->
		<div class="jumbotron" style="background-color: rgb(215, 216, 227);">
		
			<div style="text-align: center;">
				<h1>会 員 情 報 修 正</h1>				
				<h3>基本情報のみ修正可能です。</h3>
				<h3>その他の情報の修正はQ&Aからお問い合わせください。</h3>
			</div>
			
			<br><br><br>
			
			<div class="container">
				<div class="col-md-10 col-md-offset-1">
					<table class="table table-hover table-bordered infoTable">
						<tr>
							<th class="infoName">ID</th>
							<td style="vertical-align: middle; background-color: white;">
							<div class="container col-md-12">
								<div class="col-md-4">
								<input type="text" class="form-control" name="userID" id="inputID1"
								value="${requestScope.vo.userID}" readonly="readonly">
								</div>
							</div>
							</td>
						</tr>

						<tr>
							<th class="infoName">お名前</th>
							<td style="vertical-align: middle; background-color: white;">
							<div class="container col-md-12">
								<div class="col-md-4">
								<input type="text" class="form-control" name="userName" id="inputName"
								placeholder="名前を入力してください" required="required"
								value="${requestScope.vo.userName}">
								</div>
							</div>
							</td>
						</tr>

						<tr>
							<th class="infoName">電話番号</th>
							<td style="vertical-align: middle; background-color: white;">
								<div class="container col-md-12">
									<div class="col-md-2">
									<select id="inputPhone1" class="form-control">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="070">070</option>
										<option value="080">080</option>
										<option value="012">012</option>
									</select>
									</div>
									
									<div class="col-md-1 phoneVar" > - </div>
									
									<div class="col-md-2">
									<input type="text" class="form-control" id="inputPhone2"
										placeholder="3~4字" required="required" />
									</div>
									
									<div class="col-md-1 phoneVar"> - </div>
									
									<div class="col-md-2">
									<input type="text" class="form-control" id="inputPhone3"
										placeholder="4字" required="required" />
									</div>
									
									<input type="hidden" name="userPhone" id="phoneAll">
										
								</div>
							</td>
						</tr>

						<tr>
							<th class="infoName">生年月日</th>
							<td style="vertical-align: middle; background-color: white;">
								<div class="container col-md-12">
									<div class="col-md-2">
									<select class="form-control" id="yearCalc">
										<c:forEach var="i" begin="0" end="100" step="1">
											<option value="${2020 - i}">${2020 - i}</option>
										</c:forEach>
									</select>
									</div>
									
									<div class="col-md-1 calText"> 年 </div>
									
									<div class="col-md-2">
									<select class="form-control" id="monthCalc">
										<c:forEach var="i" begin="1" end="12" step="1">
											<option value="${i}">${i}</option>
										</c:forEach>
									</select>
									</div>
									 
									<div class="col-md-1 calText"> 月 </div>
									
									<div class="col-md-2">
									<select class="form-control" id="dayCalc">
										<c:forEach var="i" begin="1" end="31" step="1">
											<option value="${i}">${i}</option>
										</c:forEach>
									</select>
									</div>
									
									<div class="col-md-1 calText"> 日 </div>
									
									<input type="hidden" name="userBirth" id="tempBirth">
								</div>
							</td>
						</tr>
					</table>
				</div>
				
				<div class="form-group col-md-1 col-md-offset-9">
					<input type="submit" value="修正" onclick="return haveValue()"
					class="btn btn-primary btn-lg" style="margin-left: 70px">
				</div>
				
			</div>
		</div>
	</div>
</form>
	<!-- /container -->

	<!-- Modals -->
	<jsp:include page="/WEB-INF/views/include/loginModal.jsp"></jsp:include>

	<jsp:include page="/WEB-INF/views/include/logoutModal.jsp"></jsp:include>
<!-- Modal end -->

	<!-- Bootstrap core JavaScript
    ================================================== -->

	<!-- Placed at the end of the document so the pages load faster -->
	
	<script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>
	<script type="text/javascript">
	$(function() {
		$('#inputID1').val('${requestScope.vo.userID}');
		$('#inputName').val('${requestScope.vo.userName}');
		
		var phone = '${requestScope.vo.userPhone}';
		var temp1 = phone.substr(0,3);
		var temp2 = phone.substr(-4);
		var tempNum = parseInt(phone.length - 7);
		var temp3 = phone.substr(3, tempNum);
		
		$('#inputPhone1').val(temp1).prop('selected', true);
		$('#inputPhone2').val(temp2)
		$('#inputPhone3').val(temp3)
		
		var birth = '${requestScope.vo.userBirth}';
		var tempYear = birth.substr(0,4);
		var tempMonth = parseInt(birth.substr(5,2));
		var tempDay = parseInt(birth.substr(8,2));
		
		$('#yearCalc').val(tempYear).prop('selected', true);
		$('#monthCalc').val(tempMonth).prop('selected', true);
		$('#dayCalc').val(tempDay).prop('selected', true);
	});
	 
	</script>

</body>
</html>