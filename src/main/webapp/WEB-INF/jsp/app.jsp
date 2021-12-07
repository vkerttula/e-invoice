<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="/css/styles.css" rel="stylesheet">
    <title>App - eLasku</title>
</head>
<body>
<div class="container-fluid">
    <div class="row flex-nowrap">
		<c:import url="sidebar.jsp" charEncoding="UTF-8"></c:import>
		     <div class="col p-5">
		            <h1>Welcome, <b>${user.userName}</b></h1>
		            <p class="lead">
		                You are using eLasku version 0.9.1. Store, send and manage your invoices in one place! Please report bugs <a href="#">here</a>. </p>
		            <ul class="my-5 list-unstyled">
		                <li class="my-4">
		                	<h4>Create new invoice</h4><p>Create and send invoices. There is option to save invoice as template, when sending is not needed.</p>
		                	<a href="/app/invoice/new"><button type="button" class="btn btn-primary mb-3">New invoice</button></a>
		                </li>
		                <li class="my-4">
		                	<h4>Manage invoices</h4><p>Manage, edit, delete invoices. Invoice status will be updated automatically when invoice has been sent.</p>
		                	<a href="/app/invoices"><button type="button" class="btn btn-primary mb-3">Manage invoices</button></a>
		                </li>
		                <li class="my-4">
		                	<h4>Manage customers</h4><p>Manage saved customers. Customer information will be used when sending invoices.</p>
		                	<a href="/app/customers"><button type="button" class="btn btn-primary mb-3">Manage Customers</button></a>
		                </li>
		            </ul>
		        </div>
		    </div>
		</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
