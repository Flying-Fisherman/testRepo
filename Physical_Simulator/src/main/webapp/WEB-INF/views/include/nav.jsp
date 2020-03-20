<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	var signup = function() {
		location.href = "/myproject/account/account_SignUp"
	}

	var userPage = function() {
		location.href = "/myproject/account/account_MyPage"
	}

	var userInfo = function() {
		location.href = "/myproject/account/account_Information"
	}

	function failform() {
		open("<c:url value='/fail'/>",
				"fail",
				"width=300, height=300");
	};
</script>

	<c:if test="${requestScope.logInRes == true}">
		<script type="text/javascript">
			alert('ログインに成功しました。');
		</script>
	</c:if>
	<c:if test="${requestScope.logInRes == false}">
		<script type="text/javascript">
			alert('ログインに失敗しました。');
		</script>
	</c:if>
	<c:if test="${requestScope.logOutRes == true}">
		<script type="text/javascript">
			alert('ログアウトが成功しました。');
		</script>
	</c:if>

	<nav class="navbar navbar-default navbar-static-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> 
					<span class="icon-bar"></span> <span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="<c:url value='/'/>">Physical
					Simulator</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="<c:url value='/simulator/simulator_main'/>">実験 - Simulate</a></li>
					<li><a href="<c:url value='/simulator/simulator_HTU'/>">説明 - How To Use</a></li>
					<li><a href="#" onclick="failform()">出席 - Guesting</a></li>
					<li class="dropdown"><a href="<c:url value='/fail'/>" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">コミュニティー
							- Community <span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="<c:url value='/community/community_question'/>">質問 - Question</a></li>
							<li><a href="#" onclick="failform()">日常 - Daily</a></li>
							<li><a href="#" onclick="failform()">相談 - Advice</a></li>
							<!-- <li class="divider"></li>
							<li class="dropdown-header">Nav header</li>
							<li><a href="#">Separated link</a></li>
							<li><a href="#">One more separated link</a></li> -->
						</ul></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<c:if test="${sessionScope.userID == null}">
						<li style="padding-top: 10px;"><button type="button"
								class="btn btn-primary btn-sm" data-toggle="modal"
								data-target="#loginModal" style="margin-left: 10px;">Log-In</button></li>
						<li style="padding-top: 10px;"><button type="button"
								class="btn btn-primary btn-sm" onclick="signup()"
								style="margin-left: 10px;">Sign-Up</button></li>
					</c:if>
	
					<c:if test="${sessionScope.userID != null}">
						<li style="padding-top: 10px;"><button type="button"
								class="btn btn-default btn-sm" onclick="userPage()"
								style="margin-left: 10px;">マイページ</button></li>
						<li style="padding-top: 10px;"><button type="button"
								class="btn btn-default btn-sm" onclick="userInfo()"
								style="margin-left: 10px;">ID情報</button></li>
						<li style="padding-top: 10px;"><button type="button"
								class="btn btn-primary btn-sm" data-toggle="modal"
								data-target="#logOutModal" style="margin-left: 10px;">Log-Out</button></li>
					</c:if>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>