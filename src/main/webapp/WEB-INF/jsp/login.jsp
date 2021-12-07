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
    <title>Login - eLasku</title>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Login - eLasku</title>
</head>
<body>

<!-- otetaan mukaan sivulle header-osa -->
<c:import url="header.jsp" charEncoding="UTF-8"></c:import>

    <div class="container-fluid p-5 bg-primary text-white text-center">
	</div>
    
    <div class="container mt-5">
	  <div class="row">
	    <div class="col-sm-4">
	    	</div>
				<div class="col-sm-4 text-center">
				
			          <h2>Login</h2>
						
					    <c:if test="${not empty error }">
					        <p class="text-danger">${error }</p>
					    </c:if>
					    <c:if test="${not empty note }">
					        <p class="text-info">${note }</p>
					    </c:if>
						
					    <form action="/Perform_login" method="POST">
						
					        <div class="form-group m-3">
					            <label for="username">Email:</label>
					            <input type="text" class="form-control" id="userEmail" name="userEmail" value="${param.userEmail}">
					        </div>
					        <div class="form-group m-3">
					            <label for="password">Password:</label>
					            <input type="password" class="form-control" id="password" name="password" value="${param.password}">
					        </div>
					        <button type="submit" class="btn btn-primary m-3">Submit</button>
							
					    </form>

					    <div class="form-group pt-3 m-3">
					        <p>Don't have an account yet? <a href="/register">Sign Up</a></p>
					    </div>
					    
		    	</div>
	    	<div class="col-sm-4">
	    </div>
	  </div>
	</div>

</body>
</html>