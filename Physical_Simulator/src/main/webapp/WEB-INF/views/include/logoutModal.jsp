<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>


<div class="modal fade" id="logOutModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">Log - Out</h4>
				</div>
				<form action='<c:url value="/account/logOut"/>' method="GET">
					<div class="modal-body">
						<h2>ログアウトしますか?</h2>
						<input type="hidden" name="logOutReq" value="false" />
						<input type="hidden" name="pageLocation" value="" id="pagelocate2">
					</div>
					<div class="modal-footer">
						<input type="submit" class="btn btn-primary" value="Yes">
						<button type="button" class="btn btn-default" data-dismiss="modal">No</button>
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
	$('#pagelocate2').val(locate);
	</script>