<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>


<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">Log - In</h4>
				</div>
				<form action='<c:url value="/account/onLogIn"/>' method="POST">
					<div class="modal-body">


						<p>ID 入力</p>
						<input type="text" name="userID"><br>
						<br>
						<p>PASSWORD 入力</p>
						<input type="password" name="userPW"><br>
						<br>
						<input type="hidden" name="pageLocation" value="" id="pagelocate">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<input type="submit" class="btn btn-primary" value="로 그 인">
					</div>
				</form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	
	<script>
	var locate = window.location.pathname;
	locate = locate.substr(10);
	$('#pagelocate').val(locate);
	</script>