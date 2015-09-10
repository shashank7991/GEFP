<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="../css/MyCSS.css" />
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<title>GEFP</title>


<script type="text/javascript">
	$(document).ready(function() {
		$("#keyword").keyup(function() {
			keyword = $(this).val();
			$.post("list.html", {
				'keyWord' : keyword
			}, function(data) {
				$("#table").html(data);
			})
		});
		
		
		$(".chkBox").click(function() {

			
			var userid = $(this).attr("userId");
					var checkpointid = $(this).val();
					var checkpoint_operation = false;
					if ($(this).is(':checked')) {
						checkpoint_operation = true;
					}
					;

					$.ajax({
						type : "POST",
						url : "addusercheckpoint.html",
						data : {
							checkpoint_operation : checkpoint_operation,
							userid : userid,
							checkpointid : checkpointid
						},
						success : function(data) {
						}
					});

				});
		
		
	});
</script>

</head>
<body>
	<div id="banner">
		<div class="header">
			<img src="../images/csula.jpg" alt="Cal State L.A."
				style="width: 41%;">
		</div>
		<div class="header2">
			<h2>Flight Plan</h2>
		</div>
	</div>
	<div class="topmenu">
		<a href="../j_spring_security_logout">Logout</a>
	</div>
	<div id="left-column">
		<div></div>
	</div>
	<div id="center-column">
		<div>
			<div class="box">
				<h1>Plan Name: ${plan.strName}</h1>
				<div>
					<form action="" method="post">
						<table border="1" width="100%" class="table table-condensed">
							<tr class="active">
								<td></td>
								<c:forEach items="${RunwayEntries}" var="runway">
									<th>${runway.strName}</th>
								</c:forEach>
							</tr>
							<c:forEach items="${stages}" var="entry">
								<tr>
									<td>${entry.strName}</td>
									<c:forEach items="${RunwayEntries}" var="runway">
										<td><c:forEach items="${checkPoints}" var="entrychk">
												<c:if test="${entry.stageId == entrychk.objStage.stageId}">
													<c:if
														test="${runway.runwayId == entrychk.objRunway.runwayId}">
														<c:forEach items="${entrychk.lstcheckpoints}"
															var="checkpoint">
															<c:set var="chk_flag" value="0" />
															<c:forEach items="${user.lstofcheckpoints}" var="usrchk">
																<c:if
																	test="${usrchk.checkpointId == checkpoint.checkpointId}">
																	<c:set var="chk_flag" value="1" />
																</c:if>
															</c:forEach>

															<c:if test="${chk_flag == 1}">
																<input type="checkbox" id="chkCheckPoint" class="chkBox"
																	checked="checked" value="${checkpoint.checkpointId}"
																	userid="${user.id}" />

															</c:if>

															<c:if test="${chk_flag == 0}">
																<input type="checkbox" id="chkCheckPoint" class="chkBox"
																	value="${checkpoint.checkpointId}" userid="${user.id}" />

															</c:if>
														${checkpoint.strDescription}

													</c:forEach>

													</c:if>
												</c:if>
											</c:forEach></td>
									</c:forEach>
								</tr>
							</c:forEach>
						</table>
					</form>
					<a href="/gefp">Back</a>
				</div>
			</div>
		</div>
	</div>

</body>
</html>