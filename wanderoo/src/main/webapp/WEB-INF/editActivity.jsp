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
    <title>Wanderoo | Edit: <c:out value="${activityName}"></c:out></title>
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
    <!-- main container -->
    <div class="container">
      <!-- nav bar -->
      <div
        class="d-flex flex-wrap justify-content-between align-items-center mb-3 header_row"
        id="header"
      >
        <h3 id="logo" class="my-0 flex-grow-1 pt-2">Wanderoo.</h3>
        <div class="d-flex trip_row flex-wrap">
          <a href="/dashboard" class="nav-link">Back to Trips</a>
          <a href="/about" class="nav-link">About</a>
          <a href="#" class="nav-link">
            <i class="bi bi-person-fill me-1"></i><c:out value="${user.name}"
          /></a>
          <a href="/logout" class="nav-link logout">Logout</a>
        </div>
      </div>
      <hr />
      <!-- form heading -->
      <h1 class="flex-grow-1">Edit: <c:out value="${activityName}"></c:out></h1>
      <!-- form card -->
      <form:form
        action="/trip/${tripId}/activity/${activityId}/edit"
        class="mt-2"
        method="POST"
        modelAttribute="activity"
      >
        <input type="hidden" name="_method" value="PUT" />
        <div class="card p-3">
          <!-- name -->
          <div class="mb-3">
            <form:label path="name" class="form-label">Name:</form:label>
            <form:input type="text" class="form-control" path="name" />
          </div>
          <form:errors
            path="name"
            class="mb-3 alert alert-danger"
          ></form:errors>
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
          </div>
          <form:errors
            path="distanceFromStay"
            class="mb-3 alert alert-danger"
          ></form:errors>
          <!-- activty type -->
          <div class="mb-3">
            <form:label path="activityType" class="form-label"
              >Activity Type:</form:label
            >
            <form:input
              type="text"
              class="form-control"
              path="activityType"
              name="activityType"
            />
          </div>
          <form:errors
            path="activityType"
            class="mb-3 alert alert-danger"
          ></form:errors>
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
          <form:errors
            path="summary"
            class="mb-3 alert alert-danger"
          ></form:errors>
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
          </div>
          <form:errors
            path="infoLink"
            class="mb-3 alert alert-danger"
          ></form:errors>
          <div class="d-flex justify-content-end">
            <a href="/trip/${tripId}/activity/${activityId}" class="btn me-2"
              >Cancel</a
            >
            <button class="btn btn-primary px-4">Update Activity</button>
          </div>
        </div>
      </form:form>
    </div>
  </body>
</html>
