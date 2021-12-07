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
		            <h3>New invoice</h3>
		           	<p class="lead my-2">
		                Create new invoice.
		            </p>
		            
		            <c:if test="${not empty info }">
					        <p class="text-info">${info }</p>
					</c:if>
		                
		                    <form action="/app/invoice/new" name="createInvoice" method="post">
								
								<div class="form-group mt-4">
									<h5>Customer</h5>
									<p class="my-2">Select customer from list or create new customer by pressing "Create new customer".</p>
									 <select name="choice" class="form-control" id="choice">
									 	<option value="select-customer" selected>Select customer</option>
							            <c:forEach var="c" items="${customers }">
							            	<option value="${c.customerID }">${c.customerName }, ${c.customerEmail } <c:if test="${c.businessID ne '000000-0'}">, ${c.businessID }</c:if></option> 	
							            </c:forEach>
							        </select>
								</div>
								
								<button id="create-customer" class="btn btn-outline-primary my-4" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-customer" aria-expanded="false" aria-controls="collapse-customer">
								    Create new customer
								</button>
								
								<div class="collapse customer-information" id="collapse-customer">
								        <div class="form-group mt-4">
								            <label for="customerName">Customer (company) name:</label>
								            <input type="text" class="form-control" id="customerName" name="customerName" value="">
								        </div>
								        <div class="form-group">
								            <label for="customerEmail">Email:</label>
								            <input type="text" class="form-control" id="customerEmail" name="customerEmail" value="">
								        </div>
		
								        <div class="form-group my-2">
								            <label for="customerIsCompany">Customer is a company</label>
										    <input type="checkbox" id="customerIsCompany" />
								        </div>
								        <div class="form-group mb-4">
								            <label for="businessID">Business ID:</label>
								            <input type="text" class="form-control" id="businessID" name="businessID" readonly="readonly" value="">
								        </div>
		
								        <div class="form-group mb-4">
								            <label for="address">Address:</label>
								            <input type="text" class="form-control" id="address" name="address" value="">
								            <label for="postalCode">Postal code:</label>
								            <input type="number" class="form-control" id="postalCode" name="postalCode" value="">
								            <label for="city">City:</label>
								            <input type="text" class="form-control" id="city" name="city" value="">
								        </div>
						        </div>
						        <hr>
						        <div class="form-group mt-4">
									<h5>Invoice</h5>
									
									<div class="invoice-information">
										<div class="form-group mt-4">
								            <label for="number">Invoice number:</label>
								            <input required type="text" class="form-control" id="number" readonly="readonly" name="number" value="Generated automatically when sent">
								        </div>
								        <div class="form-group mt-4">
								            <label for="reference">Reference number:</label>
								            <input required type="text" class="form-control" id="reference" name="reference" value="">
								        </div>
								        <div class="form-group">
								            <label for="invoiceDate">Date:</label>
								            <input required type="date" class="form-control" id="invoiceDateString" name="invoiceDateString" value="">
								        </div>
		
								        <div class="form-group mb-4">
								            <label for="dueDate">Due Date:</label>
								            <input type="date" class="form-control" id="dueDateString" name="dueDateString" value="">
								        </div>
										<hr>
								        <div class="defination form-group mb-4">
								            <h5>Definition</h5>
								            
								            <div class="form-group mt-4">
									            <label for="title">Title:</label>
									            <input required type="text" class="form-control" id="title" name="title" value="">
									        </div>
									        <div class="form-group">
									            <label for="definationDate">Definition date:</label>
									            <input required type="date" class="form-control" id="definationDateString" name="definationDateString" value="">
									        </div>
									        <div class="form-group mb-4">
									            <label for="amount">Amount:</label>
									            <input type="text" class="calc amount form-control" id="amount" name="amount" value="">
									        </div>
									        <div class="form-group mb-4">
									            <label for="price">Price:</label>
									            <input type="text" class="calc price form-control" id="price" name="price" value="">

									            <label for="vat">TAX (%):</label>
									            <input type="text" class="calc tax form-control" id="vat" name="vat" value="">
									            
									            <!-- TOTAL -->
									            <input type="hidden" class="tax form-control" name="invoiceSum" id="invoiceSum" name="invoiceSum" value="">
									        </div>
								        </div>
						        	</div>
									
								</div>
								<hr>
								<div class="defination form-group mb-4">
									<h5 class="text-right">Total : <span class="fw-bold" id="total"></span>€ (incl. TAX)</h5>
									<p>
										Without taxes: <span class="fw-bold" id="total-without-taxes"></span>€<br>
										Tax sum: <span class="fw-bold" id="total-taxes"></span>€ (<span id="tax-percentage"></span>%)
									</p>
								</div>
						        
						        <div class="form-group m-3 mb-4 d-flex">
									<div>
										<button type="submit" name="status" value="TEMPLATE" class="btn btn-outline-primary">Save as Template</button>
									</div>
									<div style="margin-left:auto;" class="justify-content-end">
										<button type="submit" name="status" value="SEND" class="btn btn-primary">Send</button>
									</div>
								</div>
								
						    </form>
		        </div>
		    </div>
		</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
	<script type="text/javascript">
	    $(function () {
	    	// For customer is a company box
	        $("#customerIsCompany").click(function () {
	            if ($(this).is(":checked")) {
	                $("#businessID").removeAttr("readonly");
	                $("#businessID").focus();
	            } else {
	                $("#businessID").attr("readonly", "readonly");
	            }
	        });
	        // For create customer button
	        let x = 0;
	        $("#create-customer").click(function () {
	            if (x == 0) {
	                $('#choice').val('select-customer');
	                $("#choice").attr("disabled", "disabled");
	                $('#create-customer').text('Cancel').button("refresh");
	                x++;
	            } else {
	            	$("#choice").removeAttr("disabled");
	            	$('#create-customer').text('Create new customer').button("refresh");
	                x--;
	            }
	        });
	        // For calculating sums and total
	        $('.calc').blur(function () {
	            var sum = 0; var amount = 0; var tax = 0; var total = 0;
	            	$('#total').html(0);
	            	$('#total-without-taxes').html(0);
	            	$('#total-taxes').html(0);
	            	$('#tax-percentage').html(0);
	            	$('input[name=invoiceSum]').val(0);
	            $('.price').each(function() {
	                if($(this).val()!="")
	                 {
	                    sum += parseFloat($(this).val());
	                 }
	            });
	            $('.amount').each(function() {
	                if($(this).val()!="")
	                 {
	                    amount += parseFloat($(this).val());
	                 }
	            });
	            $('.tax').each(function() {
	                if($(this).val()!="")
	                 {
	                    tax += parseFloat($(this).val()) / 100;
	                 }
	            });
	            	total = (sum * amount) * (tax + 1);
	            	$('#total').html(total);
	            	$('#total-without-taxes').html(amount * sum);
	            	$('#total-taxes').html( (total * (1 - (1 / (tax + 1)))).toFixed(2) );
	            	$('#tax-percentage').html(tax * 100);
	            	$('input[name=invoiceSum]').val(total);
	        });
	    });
	</script>
</body>
</html>
