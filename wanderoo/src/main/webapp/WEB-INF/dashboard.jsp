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
      <div class="d-flex align-items-end">
        <h4 class="my-0 me-4">Welcome, <c:out value="${user.name}" />!</h4>
        <a href="/" class="btn btn-primary me-2">+ New Trip</a>
        <a href="/" class="btn btn-primary">Logout</a>
      </div>
    </div>
    <hr />
    <h1 class="ms-3 my-0">Your Trips</h1>
    <div class="d-flex p-4 px-5">
      <a href="/" class="col-3 me-5 trip_card">
        <div class="card">
          <img
            src="https://i.pinimg.com/originals/74/1c/55/741c555176bd57789559b6ec6eb12ad7.jpg"
            class="img-fluid"
            alt="..."
          />
          <div class="card-body">
            <h1>Card</h1>
            <h5>
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Ducimus
              eos nemo autem pariatur, animi tempora necessitatibus voluptatum
              voluptatem dolore voluptate quam nam minima ipsa repellendus quo
              accusamus mollitia quis ad!
            </h5>
          </div>
        </div>
      </a>
      <a href="/" class="col-3 me-5 trip_card">
        <div class="card">
          <img
            src="https://i.pinimg.com/564x/08/9d/25/089d25d194b153424945fee3a0a335e7.jpg"
            class="img-fluid"
            alt="..."
          />
          <div class="card-body">
            <h1>Card</h1>
            <h5>
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Ducimus
              eos nemo autem pariatur, animi tempora necessitatibus voluptatum
              voluptatem dolore voluptate quam nam minima ipsa repellendus quo
              accusamus mollitia quis ad!
            </h5>
          </div>
        </div>
      </a>
      <a href="/" class="col-3 trip_card">
        <div class="card">
          <img
            src="https://i.pinimg.com/564x/8d/c3/11/8dc3114132d0c28e075baca43649befe.jpg"
            class="img-fluid"
            alt="..."
          />
          <div class="card-body">
            <h1>Card</h1>
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
