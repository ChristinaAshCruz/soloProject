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
    <title>Wanderoo | New Trip</title>
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
    <div class="container">
      <div
        class="d-flex justify-content-between align-items-end mb-3"
        id="header"
      >
        <h3 id="logo" class="my-0">Wanderoo.</h3>
        <div class="d-flex flex-sm-row align-items-end">
          <h4 class="my-0 me-4">Welcome, <c:out value="${user.name}" />!</h4>
          <a href="/dashboard" class="btn btn-primary me-2">Back to Home</a>
          <a href="/" class="btn btn-primary">Logout</a>
        </div>
      </div>
      <hr />
      <h1>Create a New Trip</h1>
      <div class="card p-3">
        <form:form
          action="/trip/new"
          class="mt-2"
          method="POST"
          modelAttribute="newTrip"
        >
          <div class="mb-3">
            <form:label for="name" path="name" class="form-label col-2"
              >Name:</form:label
            >
            <input type="text" class="form-control" path="name" name="name" />
            <form:errors path="name"></form:errors>
          </div>
          <div class="mb-3">
            <form:label
              for="destination"
              path="destination"
              class="form-label col-2"
              >Destination:</form:label
            >
            <form:input
              type="text"
              class="form-control"
              path="destination"
              name="destination"
            />
            <form:errors path="destination"></form:errors>
          </div>
          <div class="mb-3">
            <form:label
              for="lengthOfTrip"
              path="lengthOfTrip"
              class="form-label col-2"
              >Trip Length:</form:label
            >
            <input
              type="number"
              class="form-control"
              path="lengthOfTrip"
              name="lengthOfTrip"
            />
            <form:errors path="lengthOfTrip"></form:errors>
          </div>
          <div class="mb-3">
            <form:label for="summary" class="mb-2" path="summary"
              >Trip Summary:</form:label
            >
            <form:textarea
              class="form-control"
              placeholder="Write a short trip summary here..."
              name="summary"
              path="summary"
              style="height: 100px"
            ></form:textarea>
          </div>
          <div class="mb-3">
            <form:errors path="summary" class="text-danger mb-3"></form:errors>
          </div>
          <div class="d-flex justify-content-end">
            <button class="btn btn-primary px-4">Create Trip</button>
          </div>
        </form:form>
      </div>
    </div>
  </body>
</html>
