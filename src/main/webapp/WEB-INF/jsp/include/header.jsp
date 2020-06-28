<%@page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="req" value="${pageContext.request}" />
<c:set var="baseURL" value="${req.scheme}://${req.serverName}:${req.serverPort}${req.contextPath}" />    
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>Password Management System</title>
	<link rel='stylesheet' href='<c:url value="/resources/css/style.css" />' type='text/css' media='all' />
	<link href='<c:url value="/resources/css/bootstrap.css" />'  rel="stylesheet" />
	<link href='<c:url value="/resources/js/morris/morris-0.4.3.min.css" />' rel="stylesheet" />
	<link href='<c:url value="/resources/css/custom.css" />' rel="stylesheet" />
	<link href='<c:url value="/resources/css/admin.css" />' rel="stylesheet" />
	<link href='<c:url value="/resources/css/bootstrap-dialog.min.css" />' rel="stylesheet" />
	<link href='http://fonts.googleapis.com/css?family=Open+Sans'  rel='stylesheet' type='text/css' />
	<link href='<c:url value="/resources/css/bootstrap-select.css" />' 	rel="stylesheet" />
	<link href='<c:url value="/resources/css/bootstrap-datepicker3.css" />'  rel="stylesheet" type="text/css">
	<link href='<c:url value="/resources/js/dataTables/dataTables.bootstrap.css" />'   rel="stylesheet" />
	<link href='<c:url value="/resources/css/jquery.dataTables.min.css" />'  rel="stylesheet" />
	<link href="https://cdn.datatables.net/fixedcolumns/3.2.2/css/fixedColumns.dataTables.min.css"  rel="stylesheet" />
	<link href="https://cdn.datatables.net/fixedheader/3.1.2/css/fixedHeader.dataTables.min.css"  rel="stylesheet" />
	<link href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css"   rel="stylesheet" />
	<link href='<c:url value="/resources/css/dataTables.tableTools.css" />'   rel="stylesheet" />
	<link href="https://cdn.datatables.net/select/1.2.1/css/select.dataTables.min.css"   rel="stylesheet" />
	<link href='<c:url value="/resources/css/editor.dataTables.min.css" />'   rel="stylesheet" />
	<link href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css"  rel="stylesheet"  />
	<link href='<c:url value="/resources/css/bootstrap-select.min.css"  />' rel="stylesheet"  />
	
	
	<script src='<c:url value="/resources/js/jquery-1.12.4.js" />'></script>
	<script src='<c:url value="/resources/js/bootstrap.min.js" />'></script>
	<script src='<c:url value="/resources/js/jquery.metisMenu.js" />'></script>
	<script src='<c:url value="/resources/js/morris/raphael-2.1.0.min.js" />'></script>
	<script src='<c:url value="/resources/js/morris/morris.js" />'></script>
	<script src='<c:url value="/resources/js/admin.js" />'></script>
	<script src='<c:url value="/resources/js/bootstrap-dialog.min.js" />'></script>
	<script src='<c:url value="/resources/js/jquery.fileDownload.js" />'></script>
	<script src='<c:url value="/resources/js/dataTables/jquery.dataTables.min.js" />'></script>
	<script	src='<c:url value="/resources/js/dataTables/dataTables.bootstrap.js" />'></script>
	<script src='<c:url value="/resources/js/bootstrap-select.js" />'></script>
	<script src='<c:url value="/resources/js/bootstrap-datepicker.js" />'></script>
	<script src='<c:url value="/resources/js/tabcomplete.min.js" />'></script>
	<script src='<c:url value="/resources/js/livefilter.min.js" />'></script>
    <script src='<c:url value="/resources/js/bootstrap-select.min.js" />'></script>

	<script src='<c:url value="/resources/js/jquery.jeditable.js" />' type="text/javascript" charset="utf-8"></script>
	<script src='<c:url value="/resources/js/validator.min.js" />' type="text/javascript" charset="utf-8"></script>
	<script src="https://cdn.datatables.net/fixedcolumns/3.2.2/js/dataTables.fixedColumns.min.js"></script>
	<script src="https://cdn.datatables.net/fixedheader/3.1.2/js/dataTables.fixedHeader.min.js"></script>
	<script src='<c:url value="/resources/js/dataTables.tableTools.js" />'         type="text/javascript" language="javascript" ></script>
	<script src="https://cdn.datatables.net/select/1.2.1/js/dataTables.select.min.js" type="text/javascript" language="javascript" ></script>
	<script src='<c:url value="/resources/js/dataTables.editor.min.js"  />'        type="text/javascript" language="javascript" ></script>
	<script src="<c:url value='/resources/js/common.js'/>" charset="utf-8"></script>

		
</head>
<body onload="onLoad()">
	<div id="wrapper">
		<nav class="navbar navbar-default navbar-cls-top " role="navigation"
			style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse" onclick="hideAndShow();">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${baseURL}"><h4>BackOfficeSystem</h4></a>
			</div>
			<div
				style="color: white; padding: 15px 50px 5px 50px; float: right; font-size: 16px;">
				<span class="label label-danger"></span>Welcome, <security:authentication property="principal.username" /> <security:authentication property="principal.authorities" />
				<security:authorize access="hasRole('ADMIN')">관리자</security:authorize>	
				<span class="label label-success">Last access : xxxx년 xx월 xx일</span> &nbsp;
				<span class="badge">1</span> <button type="button" 
					class="btn btn-danger square-btn-adjust" onclick="window.location.href='${baseURL}/logout'">Logout</button>
			</div>
		</nav>
<form id="commonForm" name="commonForm"></form>				
				
		