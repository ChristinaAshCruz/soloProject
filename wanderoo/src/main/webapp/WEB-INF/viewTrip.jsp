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
    <title>Trip: {destination here!}</title>
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
    <div class="container px-4">
      <div
        class="d-flex justify-content-between align-items-end mb-3"
        id="header"
      >
        <h3 id="logo" class="my-0">Wanderoo.</h3>
        <div class="d-flex flex-sm-row align-items-center">
          <h4 class="my-0 me-4">Welcome, <c:out value="${user.name}" />!</h4>
          <a href="/dashboard" class="me-2 btn">Back to Home</a>
          <a href="/" class="btn">Logout</a>
        </div>
      </div>
      <hr class="mb-3 mt-3" />
      <!-- content container -->
      <div class="main mx-4">
        <!-- trip card -->
        <div class="card col-sm trip-detail-card mb-3 p-1">
          <div class="d-flex justify-content-end px-3 pt-3 mb-0">
            <p class="travel-tag">SOLO</p>
          </div>
          <div class="card-body">
            <div
              class="d-flex justify-content-between align-items-end card-title mb-0"
            >
              <h1><c:out value="${trip.tripName}"></c:out> Trip</h1>
              <div>
                <div class="d-flex align-items-center mb-3">
                  <img src="/images/creator.png" alt="" class="icons me-2" />
                  <h6 class="m-0">
                    <c:out value="${trip.tripCreator.name}"></c:out>
                  </h6>
                </div>
                <div class="d-flex align-items-center">
                  <img src="/images/marker.png" alt="" class="icons me-2" />
                  <h6 class="m-0 me-2">Destination:</h6>
                  <h6 class="m-0 fst-italic">
                    <c:out value="${trip.destination}"></c:out>
                  </h6>
                </div>
              </div>
            </div>
            <h4>Trip Summary</h4>
            <p>
              <c:out value="${trip.summary}"></c:out>
            </p>
            <a href="/trip/${trip.id}/edit" class="btn">Edit Trip</a>
          </div>
        </div>
        <!-- list row -->
        <div class="row">
          <!-- column -->
          <div class="col-md-6 mb-3 d-flex align-items-stretch">
            <!-- activity list -->
            <div class="card trip_card">
              <a
                href="/trip/${trip.id}/activitiy/list"
                class="text-decoration-none"
              >
                <img
                  src="/images/activityImg.png"
                  class="card-img-top"
                  alt="..."
                />
                <div class="card-body">
                  <div class="d-flex justify-content-between align-items-end">
                    <h1 class="card-title">Activities</h1>
                    <p class="amount-tag">4</p>
                  </div>
                  <p class="card-text mb-3">
                    A collection of activities and places to see during your
                    trip
                  </p>
                  <a href="/trip/${trip.id}/activitiy/list" class="btn"
                    >View List</a
                  >
                </div>
              </a>
            </div>
          </div>
          <!-- column -->
          <div class="col-md-6 mb-3 d-flex align-items-stretch">
            <!-- restaurant list -->
            <div class="card trip_card">
              <a
                href="/trip/${trip.id}/restaurant/list"
                class="text-decoration-none"
              >
                <img
                  src="/images/restaurantImg.png"
                  class="card-img-top"
                  alt="..."
                />
                <div class="card-body">
                  <div class="d-flex justify-content-between align-items-end">
                    <h1 class="card-title">Restaurants</h1>
                    <p class="amount-tag">5</p>
                  </div>
                  <p class="card-text mb-3">
                    A collection of restaurants and cafés to visit during your
                    trip
                  </p>
                  <a href="/trip/${trip.id}/restaurant/list" class="btn"
                    >View List</a
                  >
                </div>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
