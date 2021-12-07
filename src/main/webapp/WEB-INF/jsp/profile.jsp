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
		            <h3>Profile</h3>
		            <p class="lead my-2">
		               This is yours, ${user.userName}, profile page. You can view, edit and save your information. Those informations will be used in invoices.<br>To change field, press "Edit".</p>
		            <form action="/app/profile" method="post">
						
					        <div class="form-group m-3">
					            <label for="userEmail">Email:</label>
					            <input type="text" class="form-control" id="userEmail" name="userEmail" readonly="readonly" value="${user.userEmail}">
					        </div>
					        <div class="form-group m-3">
					            <label for="userName">Business name:</label>
					            <input type="text" class="form-control" id="userName" name="userName" readonly="readonly" value="${user.userName}">
					        </div>

					        <div class="form-group m-3 mt-4">
					            <label for="businessID">Business ID:</label>
					            <input type="text" class="form-control" id="businessID" name="businessID" readonly="readonly" value="${user.businessID }">
					        </div>
					        <div class="form-group m-3 mb-4">
					            <label for="bankAccountNumber">Bank Account number:</label>
					            <input type="text" class="form-control" id="bankAccountNumber" name="bankAccountNumber" readonly="readonly" value="${user.bankAccountNumber }">
					        </div>

					        <div class="form-group m-3 mt-4">
					            <label for="address">Address:</label>
					            <input type="text" class="form-control" id="address" name="address" readonly="readonly" value="${user.address }">
					        </div>
					        <div class="form-group m-3">
					            <label for="postalCode">Postal code:</label>
					            <input type="text" class="form-control" id="postalCode" name="postalCode" readonly="readonly" value="${user.postalCode }">
					        </div>
					        <div class="form-group m-3 mb-4">
					            <label for="city">City:</label>
					            <input type="text" class="form-control" id="city" name="city" readonly="readonly" value="${user.city }">
					        </div>

							<div class="form-group m-3 mb-4 d-flex">
					            <button type="button" id="edit" class="btn btn-primary m-3">Edit</button>
					        	<button type="submit" id="save" class="btn btn-secondary m-3 disabled">Save</button>
					        </div>
							
					</form>
		        </div>
		    </div>
		</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
	<script type="text/javascript">
	    $(function () {
        	let x = 0;
	        $("#edit").click(function () {
	            if (x == 0) {
	                $(".form-control").removeAttr("readonly");
	                $("#save").removeClass("btn-secondary disabled");
	                $("#save").addClass("btn-primary");
	                $('#edit').text('Cancel').button("refresh");
	                $("#userEmail").focus();
	                x++;
	            } else {
	                $(".form-control").attr("readonly", "readonly");
	                $('#edit').text('Edit').button("refresh");
	                $("#save").addClass("btn-secondary disabled");
	                x--;
	            }
	        });
	    });
	</script>
</body>
</html>
