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
    <title>
      Wanderoo | <c:out value="${trip.tripName}"></c:out> Trip: Restaurants
    </title>
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
          <a href="/dashboard" class="me-2 btn">Back to Home</a>
          <a href="/" class="btn">Logout</a>
        </div>
      </div>
      <hr class="mb-3" />
      <!-- content container -->
      <div class="restaurants mx-3">
        <!-- trip name -->
        <h5 class="sub-title">
          <c:out value="${trip.tripName}"></c:out> Trip > Restaurants
        </h5>
        <!-- header row -->
        <div
          class="d-flex align-items-center justify-content-between mb-2 flex-wrap"
        >
          <!-- header: LEFT -->
          <div class="flex-grow-1">
            <h1 class="my-0">Restaurants</h1>
          </div>
          <!-- header: right (buttons) -->
          <div class="flex-shrink-0 mb-2">
            <a href="/trip/${trip.id}/restaurant/new" class="btn me-2 my-0"
              >+ New Restaurant</a
            >
            <a href="/trip/${trip.id}" class="btn my-0">Back To Trip</a>
          </div>
        </div>
        <!-- if list is empty -->
        <c:if test="${listSize == 0}">
          <div class="card text-center p-3">
            <h6 class="m-0">🥲 No restaurants added yet...</h6>
          </div>
        </c:if>
        <!-- if list is NOT empty -->
        <c:if test="${listSize > 0}">
          <c:forEach var="restaurant" items="${trip.tripRestaurants}">
            <!-- restaurant card -->
            <div class="restaurant mb-3 trip_card">
              <a href="/trip/${trip.id}/restaurant/${restaurant.id}">
                <div class="list_card card">
                  <div class="card-body">
                    <div class="d-flex">
                      <!-- LEFT column -->
                      <div class="flex-grow-1">
                        <!-- restaurant name -->
                        <h2><c:out value="${restaurant.name}"></c:out></h2>
                        <!-- restaurant summary -->
                        <h6><c:out value="${restaurant.summary}"></c:out></h6>
                      </div>
                      <!-- RIGHT column -->
                      <div class="flex-shrink-0">
                        <!-- activity type -->
                        <p class="list_tag text-center mb-3">
                          <c:out value="${restaurant.cuisineType}"></c:out>
                        </p>
                        <div class="d-flex align-items-center">
                          <!-- distance from stay -->
                          <div>
                            <img
                              src="/images/marker.png"
                              alt=""
                              class="icons"
                            />
                          </div>
                          <div class="flex-grow-1">
                            <p class="p-0 m-0 ms-2">
                              <c:out
                                value="${restaurant.distanceFromStay}"
                              ></c:out>
                              miles
                            </p>
                          </div>
                        </div>
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
