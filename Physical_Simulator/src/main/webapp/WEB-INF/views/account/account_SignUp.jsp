<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>Physical Simulator - Sign Up</title>

<!-- Bootstrap core CSS -->
<link href="<c:url value='/resources/css/bootstrap.min.css'/>"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<c:url value='/resources/css/navbar-static-top.css'/>"
	rel="stylesheet">
	
<script src="<c:url value='/resources/js/jquery-3.4.1.js'/>"></script>
	
	
<style type="text/css">
#signUpMain {
	background-image: url('<c:url value="/resources/pic/Robot.jpg"/>')
		no-repeat;
	/* 왜 안되지 */
}
;
</style>
<script type="text/javascript">
			
			function idCheckForm() {
				open("<c:url value='/account/account_IDCheck'/>",
						"checkID",
						"width=500, height=200");
			};
	
			function checkpw() {
				if (document.getElementById("inputPW1").value === document.getElementById("checkPW1").value)
					 {return true;}
	
				alert("비밀번호가 일치하지 않습니다");
				return false;
			};

			$(function() {
				calCal();
			});

			function calCal() {
					$('#yearCalc, #monthCalc').change(function() {
						var year = $('#yearCalc option:selected').val();
						var yearCount = 0
						if( year % 4 == 0 && year % 100 != 0 ) {yearCount = 1}
						else if ( year % 400 == 0 ) { yearCount == 1 }
						
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
				var userid = document.getElementById('inputID2');
				var userpw = document.getElementById('inputPW2');
				var checkpw = document.getElementById('checkPW1');
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
				
				if(userid.value.length < 6 || userid.value.length > 10) {
					alert('IDは6~10文字です。');
					return false;
				};

				if(userpw.value.length < 8 || userpw.value.length > 15) {
					alert('PWは8~15文字です。');
					return false;
				};

				if( userpw.value !== checkpw.value ) {
					alert('PWが同じではありません。');
					return false;
				};

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

				
				
				$('#ageSet').val(birth);
			};

			
		

			
			
		</script>
</head>

<body>

	<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include> 
	
	<div class="col-md-6 col-md-offset-3" id="signUpMain">
		<div class="col-md-10 col-md-offset-1">
			<h1>아직도 가입을 안한겁니까. 휴먼</h1>
			<p>지금 가입하면, 가입비가 무료!</p>
		</div>
	</div>

	<form action="<c:url value='/account/account_SignUpProcess'/>"
		method="POST" class="col-md-4 col-md-offset-4">
		<div class="form-group">
			<label for="inputID1">登録するID入力</label>
			<div id="inputID1">
				<div class="col-md-6 col-md-offset-1">
					<div class="col-md-8">
						<input type="text" class="form-control" id="inputID2"
							name="userID" value="" readonly="readonly"
							placeholder="IDを入力してください" onmousedown="idCheckForm()"
							required="required">
					</div>
					<div class="col-md-4">
						<p style="text-align: center;">6~10文字</p>
					</div>
				</div>
				<div class="col-md-5"></div>
				<br>
				<br>
			</div>
		</div>
		<br>

		<div class="form-group">
			<label for="inputPW1">パスワード</label>
			<div id="inputPW1">

				<div class="col-md-6 col-md-offset-1">
					<div class="col-md-8">
						<input type="password" class="form-control" id="inputPW2"
							name="userPW" placeholder="8~15桁の半角英数字" required="required"><br>
						<input type="password" class="form-control" id="checkPW1"
							placeholder="もう一度入力してください" required="required">
					</div>
					<div class="col-md-4">
						<p style="text-align: center;">8~15文字</p>
					</div>
				</div>
				<div class="col-md-5"></div>
				<br>
				<br>
				<br>
				<br>
				<br>
			</div>

		</div>
		<br>

		<div class="form-group">
			<label for="inputName">お名前</label>
			<div id="inputName">
				<div class="col-md-1"></div>
				<div class="col-md-4">
					<input type="text" class="form-control" name="userName"
						placeholder="名前を入力してください" required="required">
				</div>
				<div class="col-md-7"></div>
				<br>
			</div>
		</div>
		<br>
		<br>

		<div class="form-group">
			<label for="inputPhone">電話番号</label>
			<div id="inputPhone">
				<div class="col-md-2 col-md-offset-1">
					<select id="inputPhone1" class="form-control">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="070">070</option>
						<option value="080">080</option>
						<option value="012">012</option>
					</select>
				</div>
				<div class="col-md-1">
					<b style="font-size: 24px">─</b>
				</div>
				<div class="col-md-2">
					<input type="text" class="form-control" id="inputPhone2"
						placeholder="3~4字" required="required" />
				</div>
				<div class="col-md-1">
					<b style="font-size: 24px">─</b>
				</div>
				<div class="col-md-2">
					<input type="text" class="form-control" id="inputPhone3"
						placeholder="4字" required="required" />
				</div>
				<input type="hidden" value="" name="userPhone" id="phoneAll" />
			</div>
		</div>
		<br>
		<br>

		<div class="form-group">
			<label for="inputYMD">生年月日</label>
			<div id="inputYMD">
				<div class="col-md-1 col-md-offset-1">
					<b style="font-size: 18px;">年:</b>
				</div>
				<div class="col-md-2 cal">
					<select class="form-control" id="yearCalc">
						<c:forEach var="i" begin="0" end="100" step="1">
							<option value="${2020 - i}">${2020 - i}</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-md-1">
					<b style="font-size: 18px">月:</b>
				</div>
				<div class="col-md-2 cal">
					<select class="form-control" id="monthCalc">
						<c:forEach var="i" begin="1" end="12" step="1">
							<option value="${i}">${i}</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-md-1">
					<b style="font-size: 18px">日:</b>
				</div>
				<div class="col-md-2">
					<select class="form-control" id="dayCalc">
						<c:forEach var="i" begin="1" end="31" step="1">
							<option value="${i}">${i}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<input type="hidden" value="" name="userBirth" id="ageSet" />
		</div>
		<br>
		<br>

		<div class="form-group">
			<label for="inputQuest">PW探す質問</label>
			<div id="inputQuest">
				<div class="col-md-2">
					<b style="font-size: 12px">質問：</b>
				</div>
				<div class="col-md-4">
					<select name="userQuest" class="form-control">
						<option value="A">お父さんのお名前は？</option>
						<option value="B">お母さんのお名前は？</option>
						<option value="C">卒業した小学校は？</option>
						<option value="D">自分の趣味は？</option>
						<option value="E">自分が生まれた地域は？</option>
					</select>
				</div>
				<div class="col-md-2">
					<b style="font-size: 12px">答え：</b>
				</div>
				<div class="col-md-4">
					<input type="text" name="userAnswer" class="form-control"
						placeholder="入力してください" required="required" />
				</div>
			</div>
		</div>
		<br>
		<br>

		<div class="form-group">
			<input type="submit" value="登録" onclick="return haveValue()"
				class="btn btn-default">
		</div>
	</form>
	
	<!-- Modals -->
	<jsp:include page="/WEB-INF/views/include/loginModal.jsp"></jsp:include>

	<jsp:include page="/WEB-INF/views/include/logoutModal.jsp"></jsp:include>
	<!-- Modal end -->


	<!-- Placed at the end of the document so the pages load faster -->
	
	<script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>
</body>
</html>