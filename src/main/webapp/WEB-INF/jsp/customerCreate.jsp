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
    <title>New customer - eLasku</title>
</head>
<body>
<div class="container-fluid">
    <div class="row flex-nowrap">
		<c:import url="sidebar.jsp" charEncoding="UTF-8"></c:import>
		     <div class="col p-5">
		            <h3>New customer</h3>
		           	<p class="lead my-2">
		                Create new customer.
		            </p>
		            
		            <c:if test="${not empty error }">
					        <p class="text-danger">${error }</p>
					</c:if>
		                
		                    <form action="/app/customer/new" method="post">
							
						        <div class="form-group mt-4">
						            <label for="customerName">Customer (company) name:</label>
						            <input required type="text" class="form-control" id="customerName" name="customerName" value="${param.customerName}">
						        </div>
						        <div class="form-group">
						            <label for="customerEmail">Email:</label>
						            <input required type="text" class="form-control" id="customerEmail" name="customerEmail" value="${param.customerEmail}">
						        </div>

						        <div class="form-group my-2">
						            <label for="customerIsCompany">Customer is a company</label>
								    <input type="checkbox" id="customerIsCompany" />
						        </div>
						        <div class="form-group mb-4">
						            <label for="businessID">Business ID:</label>
						            <input type="text" class="form-control" id="businessID" name="businessID" readonly="readonly" value="000000-0">
						        </div>

						        <div class="form-group mb-4">
						            <label for="address">Address:</label>
						            <input required type="text" class="form-control" id="address" name="address" value="${param.address}">
						            <label for="postalCode">Postal code:</label>
						            <input required type="number" class="form-control" id="postalCode" name="postalCode" value="${param.postalCode}">
						            <label for="city">City:</label>
						            <input required type="text" class="form-control" id="city" name="city" value="${param.city}">
						        </div>
						        <button type="submit" class="btn btn-lg btn-primary">Create</button>
								
						    </form>
		        </div>
		    </div>
		</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
	<script type="text/javascript">
	    $(function () {
	        $("#customerIsCompany").click(function () {
	            if ($(this).is(":checked")) {
	                $("#businessID").removeAttr("readonly");
	                $("#businessID").focus();
	            } else {
	                $("#businessID").attr("readonly", "readonly");
	            }
	        });
	    });
	</script>
</body>
</html>
