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
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0" /> -->
    <title>Wanderoo | New Trip</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css"
    />
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
    <div class="container">
      <!-- nav bar -->
      <div
        class="d-flex flex-wrap justify-content-between align-items-center mb-3 header_row"
        id="header"
      >
        <h3 id="logo" class="my-0 flex-grow-1 pt-2">Wanderoo.</h3>
        <div class="d-flex trip_row flex-wrap">
          <a href="/trip/new" class="nav-link">Back to Trips</a>
          <a href="/about" class="nav-link">About</a>
          <a href="#" class="nav-link">
            <i class="bi bi-person-fill me-1"></i><c:out value="${user.name}"
          /></a>
          <a href="/logout" class="nav-link logout">Logout</a>
        </div>
      </div>
      <hr />
      <h1>Create a New Trip</h1>
      <form:form
        action="/trip/new"
        class="mt-2"
        method="POST"
        modelAttribute="newTrip"
      >
        <div class="card p-3">
          <!-- name -->
          <div class="mb-3">
            <form:label path="tripName" class="form-label">Name:</form:label>
            <form:input type="text" class="form-control" path="tripName" />
          </div>
          <!-- error: name -->
          <form:errors
            path="tripName"
            class="py-1 alert alert-danger"
          ></form:errors>
          <!-- destination -->
          <div class="mb-3">
            <form:label path="destination" class="form-label"
              >Destination:</form:label
            >
            <form:input type="text" class="form-control" path="destination" />
          </div>
          <!-- error: destination -->
          <form:errors
            path="destination"
            class="py-1 alert alert-danger"
          ></form:errors>
          <!-- length of trip -->
          <div class="mb-3">
            <form:label path="lengthOfTrip" class="form-label"
              >Trip Length (# of days):</form:label
            >
            <form:input
              type="number"
              class="form-control"
              path="lengthOfTrip"
            />
          </div>
          <!-- error: lengthOfTrip -->
          <form:errors
            path="lengthOfTrip"
            class="py-1 alert alert-danger"
          ></form:errors>
          <!-- summary -->
          <div class="mb-3">
            <form:label class="mb-2" path="summary">Trip Summary:</form:label>
            <form:textarea
              class="form-control"
              placeholder="Write a short trip summary here..."
              path="summary"
              style="height: 100px"
            ></form:textarea>
          </div>
          <!-- error: trip summary -->
          <form:errors
            path="summary"
            class="py-1 alert alert-danger"
          ></form:errors>
          <div class="d-flex justify-content-end">
            <a href="/dashboard" class="btn me-2">Cancel</a>
            <button class="btn btn-primary px-4">Create Trip</button>
          </div>
        </div>
      </form:form>
    </div>
  </body>
</html>
