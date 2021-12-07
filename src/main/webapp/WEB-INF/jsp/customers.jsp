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
    <title>Customers - eLasku</title>
</head>
<body>
<div class="container-fluid">
    <div class="row flex-nowrap">
		<c:import url="sidebar.jsp" charEncoding="UTF-8"></c:import>
		     <div class="col p-5">
		            <h3>Customers</h3>
		           	<p class="lead my-2">
		                View and edit your saved customers on this page.
		            </p>
		                
		                <c:if test="${empty customers }">
					    	<p>No customers!</p>
					    </c:if>
					    
					    <c:if test="${not empty customers }">
					        <table class="table my-4">
					        <tr>
					        	<th>ID</th>
								<th>Name</th>
								<th>Email</th>
								<th>Business ID</th>
								<th>Address</th>
								<th>Postal code</th>
								<th>City</th>
								<th></th>
							</tr>
							<c:forEach var="item" items="${customers }" varStatus="loop">
								<tr>
									<td>${loop.index + 1}</td>
									<td>${item.customerName }</td>
									<td>${item.customerEmail }</td>
									<td>${item.businessID }</td>
									<td>${item.address }</td>
									<td>${item.postalCode }</td>
									<td>${item.city }</td>
									<td><a href="/app/customers?action=delete&id=${loop.index }" onclick="return confirm('Are you sure you want to delete this item?');">Delete</a></td>
								</tr>
							</c:forEach>
							</table>
					    </c:if>
		        </div>
		    </div>
		</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
