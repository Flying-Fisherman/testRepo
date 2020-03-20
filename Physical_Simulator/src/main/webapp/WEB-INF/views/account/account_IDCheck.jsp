<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 重複確認</title>
<script>
	function closeFunc() {
		close();
	};

	function submitId() {
		var useridDoc = opener.document.getElementById("inputID2");
/* 		var signUpBtnDoc = opener.document.getElementById("signUpBtn");
 */		useridDoc.value = "${userID}";
		/* signUpBtnDoc.removeAttribute("disabled"); */
		close();
	};

	function checkNum() {
		var userid = document.getElementById('userid');
		if(userid.value.length < 6 || userid.value.length > 10) {
			alert('IDは6~10文字です。');
			return false;
		};
	};
</script>
</head>
<body>
	<h1>ID 중복체크</h1>
	<form action='<c:url value="/account/account_CheckOverlap"/>' method="post">
		<input type="text" name="userID" id="userid" value="${userID}" required="required">
		<input type="submit" value="重複確認" onclick="return checkNum()">
		<input type="button" id="btn" value="使用" onclick="submitId()" disabled="disabled">
		<input type="button" value="閉め" onclick="closeFunc()">
	</form>
	
	<c:choose>
		<c:when test="${checkRes == true }">
			<p>使用可能なIDです。</p>	
			<script type="text/javascript">
				document.getElementById("btn").removeAttribute("disabled");
			</script>
		</c:when>
		
		<c:when test="${checkRes == false }">
			<p>既に使用中のIDです。</p>		
		</c:when>
	</c:choose>
</body>
</html>
