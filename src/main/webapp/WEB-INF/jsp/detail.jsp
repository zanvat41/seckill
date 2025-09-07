<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="common/head.jsp"%>
<title>Seckill Detail Page</title>
</head>
<body>
<input type="hidden" id="basePath" value="${basePath}" />
	<div class="container">
		<div class="panel panel-default text-center">
			<div class="panel-heading">
				<h1>${seckill.name}</h1>
			</div>
			<div class="panel-body">
				<h2 class="text-danger">
					<span class="glyphicon glyphicon-time"></span>
					<span class="glyphicon" id="seckillBox"></span>
				</h2>
			</div>
		</div>
	</div>

	<!-- Login pop-up layer for entering the phone number -->
	<div id="killPhoneModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title text-center">
						<span class="glyphicon glyphicon-phone"></span>Seckill Phone：
					</h3>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-xs-8 col-xs-offset-2">
							<input type="text" name="killphone" id="killphoneKey"
								placeholder="your phone number" class="form-control" />
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<span id="killphoneMessage" class="glyphicon"></span>
					<button type="button" id="killPhoneBtn" class="btn btn-success">
						<span class="glyphicon glyphicon-phone"></span> Submit
					</button>
				</div>
			</div>
		</div>
	</div>

	<!-- jQuery file. Must be introduced before bootstrap.min.js -->
	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<!-- Bootstrap core JavaScript file -->
	<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<!-- jQuery cookie operation plugin -->
	<script src="//cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
	<!-- jQuery countdown plugin -->
	<script src="//cdn.bootcss.com/jquery.countdown/2.1.0/jquery.countdown.min.js"></script>
	<!-- Start writing the interaction logic -->
	<script src="${basePath}resources/js/seckill.js"  type="text/javascript"></script>
	<script type="text/javascript">
		$(function(){
			// Pass parameters using the EL expression
			seckill.detail.init({
				seckillId : ${seckill.seckillId},
				startTime : ${seckill.startTime.time},//毫秒
				endTime : ${seckill.endTime.time}
			});
		});
	</script>
</body>
</html>