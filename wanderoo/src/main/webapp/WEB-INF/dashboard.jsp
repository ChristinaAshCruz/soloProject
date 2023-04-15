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
    <div class="container">
      <div
        class="d-flex justify-content-between align-items-end mb-3"
        id="header"
      >
        <h3 id="logo" class="my-0">Wanderoo.</h3>
        <div class="d-flex flex-sm-row align-items-center">
          <h4 class="my-0 me-4">Welcome, <c:out value="${user.name}" />!</h4>
          <a href="/trip/new" class="me-2 btn">+ New Trip</a>
          <a href="/logout" class="btn">Logout</a>
        </div>
      </div>
      <hr />
      <h1 class="mb-3">Your Trips</h1>
      <!-- TRIP ROW -->
      <div class="d-flex flex-wrap trip_row mx-3">
        <c:forEach var="trip" items="${user.tripsCreated}">
          <!-- trip card -->
        <div class="trip_card card" style="width: 23rem;">
          <!-- link wrapper -->
          <a href="/trip/${trip.id}" >
            <!-- trip card background -->
            <img src="/images/soloTrip.png" class="card-img-top" alt="..." />
            <!-- main card content -->
            <div class="card-body">
              <!-- trip row: trip name + travel tag -->
              <div class="d-flex align-items-center justify-content-between">
                <h4 class="flex-flex-1 trip_name"><c:out value="${trip.tripName}"></c:out></h4>
                <!-- need to add c:if here! -->
                  <!-- ex: test=${tripMembersSize > 0} -> show 'GROUP' -->
                <p class="travel-tag flex-shrink-0">SOLO</p>
              </div>
              <!-- trip attributes: trip creator + destination -->
              <div class="card-text">
                <div class="d-flex align-items-center mb-3">
                  <img src="/images/creator.png" alt="" class="icons me-2" />
                  <h6 class="m-0"><c:out value="${trip.tripCreator.name}"></c:out></h6>
                </div>
                <div class="d-flex align-items-center mb-3">
                  <img src="/images/marker.png" alt="" class="icons me-2" />
                  <h6 class="m-0 fst-italic"><c:out value="${trip.destination}"></c:out></h6>
                </div>
                <!-- trip summary -->
                <p>
                  <c:out value="${trip.summary}"></c:out>
                </p>
              </div>
              <a href="/trip/${trip.id}" class="btn btn-primary">View Trip</a>
            </div>
          </div>
        </c:forEach>
      </div>
    </div>
  </body>
</html>
