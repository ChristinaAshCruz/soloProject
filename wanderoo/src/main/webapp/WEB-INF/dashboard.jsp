<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Project Name here</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/style.css" />
    <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script>
    <!-- change to match your file/naming structure -->
    <!-- FONTS -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,500;1,300;1,400;1,500&family=Syne:wght@700;800&display=swap"
      rel="stylesheet"
    />
  </head>
  <body>
    <div
      class="d-flex justify-content-between align-items-end mb-3"
      id="header"
    >
      <h3 id="logo" class="my-0">Wanderoo.</h3>
      <div class="d-flex flex-sm-row align-items-end">
        <h4 class="my-0 me-4">Welcome, <c:out value="${user.name}" />!</h4>
        <a href="/" class="btn btn-primary me-2">+ New Trip</a>
        <a href="/" class="btn btn-primary">Logout</a>
      </div>
    </div>
    <hr />
    <h1 class="mt-0 mb-3">Your Trips</h1>
    <div class="d-flex flex-sm-row justify-content-center mx-5 trip-row">
      <a href="/" class="trip_card col me-4">
        <div class="card vh-75">
          <img src="/images/soloTrip.png" class="img-fluid" alt="..." />
          <div class="card-body">
            <div
              class="d-flex justify-content-between align-items-end card-title"
            >
              <h1>Card</h1>
              <p class="travel-tag">SOLO</p>
            </div>
            <h5>
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Ducimus
              eos nemo autem pariatur, animi tempora necessitatibus voluptatum
              voluptatem dolore voluptate quam nam minima ipsa repellendus quo
              accusamus mollitia quis ad!
            </h5>
          </div>
        </div>
      </a>
      <a href="/" class="trip_card col me-4">
        <div class="card vh-75">
          <img src="/images/soloTrip.png" class="img-fluid" alt="..." />
          <div class="card-body">
            <div
              class="d-flex justify-content-between align-items-end card-title"
            >
              <h1>Card</h1>
              <p class="travel-tag">SOLO</p>
            </div>
            <h5>
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Ducimus
              eos nemo autem pariatur, animi tempora necessitatibus voluptatum
              voluptatem dolore voluptate quam nam minima ipsa repellendus quo
              accusamus mollitia quis ad!
            </h5>
          </div>
        </div>
      </a>
      <a href="/" class="trip_card col">
        <div class="card vh-75">
          <img src="/images/groupTrip.png" class="img-fluid" alt="..." />
          <div class="card-body">
            <div
              class="d-flex justify-content-between align-items-end card-title"
            >
              <h1>Card</h1>
              <p class="travel-tag">SOLO</p>
            </div>
            <h5>
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Ducimus
              eos nemo autem pariatur, animi tempora necessitatibus voluptatum
              voluptatem dolore voluptate quam nam minima ipsa repellendus quo
              accusamus mollitia quis ad!
            </h5>
          </div>
        </div>
      </a>
    </div>
  </body>
</html>
