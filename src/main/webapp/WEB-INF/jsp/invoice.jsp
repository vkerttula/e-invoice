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
	<link href="/css/invoice.css" rel="stylesheet">
    <title>Invoice - eLasku</title>
</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>
<body>
<div class="container-fluid">
    <div class="row flex-nowrap">
		<c:import url="sidebar.jsp" charEncoding="UTF-8"></c:import>
		     <div class="col p-5">
		     
		     	<a href="/app/invoices"><button type="button" class="my-3 btn btn-outline-primary">◄ Back</button></a>
		     
		            <h3>Invoice ${viewInvoice.invoiceNumber}</h3>
		            <form id="editInvoice" action="/app/invoice/view" method="post">
		            <h5>Status 
		            	<c:if test="${viewInvoice.status eq 'TEMPLATE'}">
		            			<input type="hidden" name=id value="${param.id }">
								<select disabled class="edit-status" name="status">
									<option value="TEMPLATE" selected class="bg-primary">TEMPLATE</option>
									<option value="SEND" class="bg-warning">SEND</option>
									<option value="PAID" class="bg-success">PAID</option>
								</select>
								<span class="fs-1 text-primary"> • </span>
						</c:if>
						<c:if test="${viewInvoice.status eq 'SEND'}">
								<input type="hidden" name=id value="${param.id }">
								<select disabled class="edit-status" name="status">
									<option value="TEMPLATE" class="bg-primary">TEMPLATE</option>
									<option value="SEND" selected class="bg-warning">SEND</option>
									<option value="PAID" class="bg-success">PAID</option>
								</select>
								<span class="fs-1 text-warning"> • </span>
						</c:if>
						<c:if test="${viewInvoice.status eq 'PAID'}">
								<input type="hidden" name=id value="${param.id }">
								<select disabled class="edit-status" name="status">
									<option value="TEMPLATE" class="bg-primary">TEMPLATE</option>
									<option value="SEND" class="bg-warning">SEND</option>
									<option value="PAID" selected class="bg-success">PAID</option>
								</select>
								<span class="fs-1 text-success"> • </span>
						</c:if>
		            </h5>
		            </form>
		            <p class="lead my-2 mb-3">
		               Download as PDF or print invoice by pressing "Print". To change status, press "Edit".
		            </p>
		            
			            <div class="invoice-box" id="invoice-pdf">
						<table>
							<tr class="top">
								<td colspan="6">
									<table>
										<tr>
											<td class="title">
												<img src="/img/eLaskuLogo.png" style="width: 100%; max-width: 186px; max-height: 300px" />
											</td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td class="text-right">
												Invoice number: ${viewInvoice.invoiceNumber }<br />
												Reference number: ${viewInvoice.reference }<br />
												Created: ${viewInvoice.invoiceDate }<br />
												Due: ${viewInvoice.dueDate }
											</td>
										</tr>
									</table>
								</td>
							</tr>
			
							<tr class="information">
								<td colspan="6">
									<table>
										<tr>
												<td class="invoice-titles">
													<b>SENDER</b>
												</td>
												<td class="invoice-titles"></td>
												<td class="invoice-titles"></td>
												<td class="invoice-titles"></td>
												<td class="invoice-titles"></td>
												<td class="invoice-titles">
													<b>RECIPIENT</b>
												</td>
										</tr>
										<tr>
											<td>
												${viewInvoice.user.userName }<br />
												${viewInvoice.user.businessID }<br />
												${viewInvoice.user.address }<br />
												${viewInvoice.user.city }, ${viewInvoice.user.postalCode }<br />
												${viewInvoice.user.userEmail }
											</td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td>
												${customer.customerName }<br />
												<c:if test="${customer.businessID ne '000000-0'}">
													${customer.businessID}<br />
												</c:if>
												${customer.address }<br />
												${customer.city }, ${customer.postalCode }<br />
												${customer.customerEmail }
											</td>
										</tr>
									</table>
								</td>
							</tr>		
			
							<tr class="heading">
								<td>DEFINITION</td>
								<td>DATE</td>
								<td>AMOUNT</td>
								<td>UNIT PRICE</td>
								<td>TAX</td>
								<td>SUM</td>
							</tr>
			
							<c:forEach var="item" items="${viewInvoice.definations }" varStatus="loop">
				            	<tr class="item">
									<td>${item.title}</td>
									<td>${item.definationDate}</td>
									<td>${item.amount}</td>
									<td>${item.price}</td>
									<td>${item.vat}%</td>
									<td>${item.definationSum}</td>
								</tr>
				           	</c:forEach>
			
							<tr class="total">
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td>Total: ${viewInvoice.invoiceSum} €</td>
							</tr>
						</table>
					</div>
					
					<div class="form-group m-3 mb-4 d-flex">
						<div>
							<a href="/app/invoice/delete" onclick="return confirm('Are you sure you want to delete this item?');">
								<button type="button" id="delete" class="btn btn-danger m-3">Delete</button>
							</a>
						</div>
						<div style="margin-left:auto;" class="justify-content-end">
							<button type="button" id="edit" class="btn btn-primary m-3">Edit</button>
							<button type="button" id="print" class="btn btn-primary m-3" onclick="printDiv('Invoice')">Print</button>
							<button type="submit" id="save" form="editInvoice" class="btn btn-secondary m-3 disabled">Save</button>
						</div>
					</div>

		            
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
	                $(".edit-status").removeAttr("disabled");
	                $("#save").removeClass("btn-secondary disabled");
	                $("#save").addClass("btn-primary");
	                $('#edit').text('Cancel').button("refresh");
	                x++;
	            } else {
	                $(".edit-status").attr("disabled", "disabled");
	                $('#edit').text('Edit').button("refresh");
	                $("#save").addClass("btn-secondary disabled");
	                x--;
	            }
	        });
	    });
	</script>
	<script type="text/javascript">
	
		function printDiv(title) {
	
		  let mywindow = window.open('', 'PRINT', 'height=650,width=900,top=100,left=150');
	
		  mywindow.document.write(`<html><head><title>${title}</title>`);
		  mywindow.document.write('</head><body >');
		  mywindow.document.write(document.getElementById('invoice-pdf').innerHTML);
		  mywindow.document.write('</body></html>');
	
		  mywindow.document.close(); // necessary for IE >= 10
		  mywindow.focus(); // necessary for IE >= 10*/
	
		  mywindow.print();
		  mywindow.close();
	
		  return true;
		}
	</script>
</body>
</html>
