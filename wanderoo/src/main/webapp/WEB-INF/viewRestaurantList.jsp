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
    <title>Wanderoo | Graduation Trip: Restaurants</title>
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
    <div class="container px-4">
      <div
        class="d-flex justify-content-between align-items-end mb-3"
        id="header"
      >
        <h3 id="logo" class="my-0">Wanderoo.</h3>
        <div class="d-flex flex-sm-row align-items-center">
          <h4 class="my-0 me-4">Welcome, <c:out value="${user.name}" />!</h4>
          <a href="/dashboard" class="me-2 btn btn-primary">Back to Home</a>
          <a href="/" class="btn btn-primary">Logout</a>
        </div>
      </div>
      <hr class="mb-3" />
      <!-- content container -->
      <div class="activities mx-3">
        <!-- trip name -->
        <h5 class="sub-title"><c:out value="${trip.tripName}"></c:out> Trip</h5>
        <!-- header row -->
        <div class="body-header d-flex align-items-center mb-2">
          <div class="flex-grow-1">
            <h1 class="my-0">Restaurants</h1>
          </div>
          <!-- buttons -->
          <div>
            <a
              href="/trip/${trip.id}/restaurant/new"
              class="btn btn-primary me-2 my-0"
              >+ New Restaurant</a
            >
            <a href="/trip/1" class="btn my-0">Back To Trip</a>
          </div>
        </div>
        <!-- if list is empty -->
        <c:if test="${listSize == 0}">
          <div class="trip_card card text-center p-3">
            <h5 class="m-0">🥲 No restaurants added yet...</h5>
          </div>
        </c:if>
        <!-- if list is NOT empty -->
        <c:if test="${listSize > 0}">
          <c:forEach var="restaurant" items="${trip.tripRestaurants}">
            <!-- activity card -->
            <div class="activity mb-3">
              <a
                href="/trip/${trip.id}/restaurant/${restaurant.id}"
                class="trip_card"
              >
                <div class="trip_card card">
                  <div class="card-body">
                    <div class="d-flex">
                      <div class="flex-grow-1">
                        <!-- restaurant name -->
                        <h2><c:out value="${restaurant.name}"></c:out></h2>
                        <!-- restaurant summary -->
                        <h6><c:out value="${restaurant.summary}"></c:out></h6>
                      </div>
                      <div>
                        <div class="d-flex align-items-center mb-3">
                          <img
                            src="/images/marker.png"
                            alt=""
                            class="icons me-2"
                          />
                          <!-- distance from stay -->
                          <p class="p-0 m-0">
                            <c:out
                              value="${restaurant.distanceFromStay}"
                            ></c:out>
                            miles
                          </p>
                        </div>
                        <!-- activity type -->
                        <p class="travel-tag text-center mb-0">
                          <c:out value="${restaurant.cuisineType}"></c:out>
                        </p>
                      </div>
                    </div>
                  </div>
                </div>
              </a>
            </div>
          </c:forEach>
        </c:if>
      </div>
    </div>
  </body>
</html>
