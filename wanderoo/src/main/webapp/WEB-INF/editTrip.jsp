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
    <title>Wanderoo | Edit Trip</title>
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
    <!-- main container -->
    <div class="container">
      <!-- nav bar -->
      <div
        class="d-flex flex-wrap justify-content-between align-items-center mb-3 header_row"
        id="header"
      >
        <h3 id="logo" class="my-0 flex-grow-1 pt-2">Wanderoo.</h3>
        <div class="d-flex flex-shrink-0">
          <h4 class="my-0">Welcome, <c:out value="${user.name}" />!</h4>
        </div>
        <div class="nav-buttons flex-shrink-0">
          <a href="/dashboard" class="me-1 btn">Back to Home</a>
          <a href="/logout" class="btn">Logout</a>
        </div>
      </div>
      <hr />
      <!-- form heading -->
      <h1>Edit <c:out value="${tripName}"></c:out> Trip</h1>
      <!-- form card -->
      <form:form
        action="/trip/${trip.id}/update"
        class="mt-2"
        method="POST"
        modelAttribute="trip"
      >
        <div class="card p-3">
          <input type="hidden" name="_method" value="PUT" />
          <!-- name -->
          <div class="mb-3">
            <form:label path="tripName" class="form-label col-2"
              >Name:</form:label
            >
            <form:input type="text" class="form-control" path="tripName" />
          </div>
          <!-- error: name -->
          <form:errors
            path="tripName"
            class="py-1 alert alert-danger"
          ></form:errors>
          <!-- destination -->
          <div class="mb-3">
            <form:label path="destination" class="form-label col-2"
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
            <form:label path="lengthOfTrip" class="form-label col-2"
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
            <a href="/trip/${tripId}" class="btn me-2">Cancel</a>
            <button class="btn btn-primary px-4">Edit Trip</button>
          </div>
        </div>
      </form:form>
    </div>
  </body>
</html>
