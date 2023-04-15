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
    <title>Wanderoo | Edit Restaurant</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/style.css" />
    <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script>
    <!-- change to match your file/naming structure -->
  </head>
  <body>
    <!-- main container -->
    <div class="container">
      <!-- navbar -->
      <div
        class="d-flex justify-content-between align-items-end mb-3"
        id="header"
      >
        <h3 id="logo" class="my-0">Wanderoo.</h3>
        <div class="d-flex flex-sm-row align-items-end">
          <h4 class="my-0 me-4">Welcome, <c:out value="${user.name}" />!</h4>
          <a href="/dashboard" class="btn btn-primary me-2">Back to Home</a>
          <a href="/logout" class="btn btn-primary">Logout</a>
        </div>
      </div>
      <hr />
      <!-- trip name -->
      <h5 class="sub-title"><c:out value="${tripName}"></c:out> Trip</h5>
      <!-- form heading -->
      <h1 class="flex-grow-1">Create a New Restaurant</h1>
      <!-- form card -->
      <div class="card p-3">
        <form:form
          action="/trip/${tripId}/restaurant/${activityId}"
          class="mt-2"
          method="POST"
          modelAttribute="restaurant"
        >
          <input type="hidden" name="_method" value="PUT" />
          <!-- name -->
          <div class="mb-3">
            <form:label path="name" class="form-label">Name:</form:label>
            <form:input type="text" class="form-control" path="name" />
            <form:errors path="name"></form:errors>
          </div>
          <!-- distance from stay -->
          <div class="mb-3">
            <form:label path="distanceFromStay" class="form-label"
              >Distance From Stay (miles):</form:label
            >
            <form:input
              type="number"
              class="form-control"
              path="distanceFromStay"
            />
            <form:errors path="distanceFromStay"></form:errors>
          </div>
          <!-- cuisine type -->
          <div class="mb-3">
            <form:label path="cuisineType" class="form-label"
              >Cuisine Type:</form:label
            >
            <form:input
              type="text"
              class="form-control"
              path="cuisineType"
              name="cuisineType"
            />
            <form:errors path="cuisineType"></form:errors>
          </div>
          <!-- summary -->
          <div class="mb-3">
            <form:label for="summary" class="mb-2" path="summary"
              >Summary:</form:label
            >
            <form:textarea
              class="form-control"
              placeholder="Write a short summary here..."
              name="summary"
              path="summary"
              style="height: 100px"
            ></form:textarea>
          </div>
          <div class="mb-3">
            <form:errors path="summary" class="text-danger mb-3"></form:errors>
          </div>
          <!-- info link -->
          <div class="mb-3">
            <form:label path="infoLink" class="form-label"
              >🔎 Link for more info:</form:label
            >
            <form:input
              type="text"
              class="form-control"
              path="infoLink"
              name="infoLink"
            />
            <form:errors path="infoLink"></form:errors>
          </div>
          <div class="d-flex justify-content-end">
            <a href="/trip/${tripId}/restaurant/list" class="btn me-2"
              >Cancel</a
            >
            <button class="btn btn-primary px-4">Create Restaurant</button>
          </div>
        </form:form>
      </div>
    </div>
  </body>
</html>
