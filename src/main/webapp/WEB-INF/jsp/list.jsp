<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common/tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="common/head.jsp"%>
<title>Seckill List Page</title>
</head>
<body>
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-heading text-center">
				<h2>Seckill List</h2>
			</div>
			<div class="panel-body">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>Name</th>
							<th>Quantity</th>
							<th>Start Time</th>
							<th>End Time</th>
							<th>Create Time</th>
							<th>Detail Page</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="sk" items="${list}">
							<tr>
								<td>${sk.name}</td>
								<td>${sk.number}</td>
								<td>
									<fmt:formatDate value="${sk.startTime}" pattern="yyy-MM-dd HH:mm:ss"/>
								</td>
								<td>
									<fmt:formatDate value="${sk.endTime}" pattern="yyy-MM-dd HH:mm:ss"/>
								</td>
								<td>
									<fmt:formatDate value="${sk.createTime}" pattern="yyy-MM-dd HH:mm:ss"/>
								</td>
								<td>
									<a class="btn btn-info" href="${basePath}seckill/${sk.seckillId}/detail" target="_blank">link</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<!-- jQuery file. Must be introduced before bootstrap.min.js -->
	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<!-- Bootstrap core JavaScript file -->
	<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>