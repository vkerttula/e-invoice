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
    <title>Invoices - eLasku</title>
</head>
<body>
<div class="container-fluid">
    <div class="row flex-nowrap">
		<c:import url="sidebar.jsp" charEncoding="UTF-8"></c:import>
		     <div class="col p-5">
		            <h3>Invoices</h3>
		           	<p class="lead my-2">
		                View and edit your invoices on this page.
		            </p>
		                
					<c:if test="${empty invoices }">
					    	<p>No invoices!</p>
					    </c:if>
					    
					    <c:if test="${not empty invoices }">
					        <table class="table my-4">
					        <tr>
					        	<th>ID</th>
								<th>Invoice number</th>
								<th>Customer's Email</th>
								<th>Reference</th>
								<th>Date</th>
								<th>Due Date</th>
								<th>Status</th>
								<th>Total</th>
								<th></th>
							</tr>
							<c:forEach var="item" items="${invoices }" varStatus="loop">
								<tr>
									<td>${loop.index + 1}</td>
									<td>${item.invoiceNumber }</td>
									<td><a href="/app/customers">${item.customerEmail }</a></td>
									<td>${item.reference }</td>
									<td>${item.invoiceDate }</td>
									<td>${item.dueDate }</td>
									<td>${item.status }</td>
									<td>${item.invoiceSum } €</td>
									<td><a href="/app/invoice/view?id=${loop.index }">View/Edit</a></td>
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
