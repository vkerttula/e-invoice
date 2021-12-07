<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="/css/styles.css" rel="stylesheet">

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <!-- Container wrapper -->
  <div class="container">
    <!-- Navbar brand -->
    <a class="navbar-brand me-2" href="/">
    	<img class="header-logo" src="/img/eLaskuLogo.png"/>
    </a>

    <!-- Toggle button -->
    <button
      class="navbar-toggler"
      type="button"
      data-mdb-toggle="collapse"
      data-mdb-target="#navbarButtonsExample"
      aria-controls="navbarButtonsExample"
      aria-expanded="false"
      aria-label="Toggle navigation"
    >
      <i class="fas fa-bars"></i>
    </button>
	

    <!-- Collapsible wrapper -->
    <div class="collapse navbar-collapse" id="navbarButtonsExample">
      <!-- Left links -->
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" href="/app">Dashboard</a>
        </li>
      </ul>
      <!-- Left links  NOT LOGGED IN-->
	  <c:if test="${empty user }">
	      <div class="d-flex align-items-center">
			<a href="/login">
			  <button type="button" class="btn btn-link px-3 me-2">
			    Login
			  </button>
			</a>
			<a href="/register">
	          <button type="button" class="btn btn-primary me-3">
	            Sign up for free
	          </button>
			</a>
	      </div>
      </c:if>
      <!-- Left links LOGGED IN-->
	  <c:if test="${not empty user }">
	      <div class="d-flex align-items-center">
	      	<span>
	      		Hi, <b>${user.userName}</b>
	      	</span>
			<a href="/logout">
			  <button type="button" class="btn btn-link px-3 me-2">
			    Logout
			  </button>
			</a>
	      </div>
      </c:if>

      
    </div>
    <!-- Collapsible wrapper -->
  </div>
  <!-- Container wrapper -->
</nav>
<!-- Navbar -->