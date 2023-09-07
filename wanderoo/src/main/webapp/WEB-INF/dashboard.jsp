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
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Wanderoo | Dashboard</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
      crossorigin="anonymous"
    />

    <link rel="stylesheet" href="/css/style2.css" />
    <!-- FONT AWESOME -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
      integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <!-- BOOTSTRAP -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script>
    <!-- FONTS -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  </head>
  <body>
    <div class="container">
      <!-- header -->
      <!-- nav bar -->
      <div
        class="d-flex flex-wrap justify-content-between align-items-center mb-3 header_row"
        id="header"
      >
        <h3 id="logo" class="my-0 flex-grow-1 pt-2">Wanderoo.</h3>
        <div class="d-flex trip_row flex-wrap">
          <a href="/trip/new" class="nav-link">+ New Trip</a>
          <a href="/about" class="nav-link">About</a>
          <a href="/temp" class="nav-link">
            <i class="bi bi-person-fill me-1"></i><c:out value="${user.name}"
          /></a>
          <a href="/logout" class="nav-link logout">Logout</a>
        </div>
      </div>
      <hr class="mt-0" />
      <h1 class="mb-3">Your Trips</h1>
      <div class="d-flex flex-wrap trip_row mx-3">
        <c:forEach var="trip" items="${user.tripsAttending}">
          <!-- trip card -->
          <div class="trip_card card" style="width: 17rem">
            <a href="/trip/${trip.id}">
              <c:if test="${trip.tripMembers.size() == 1}">
                <img
                  src="/images/soloTrip.png"
                  class="card-img-top"
                  alt="..."
                />
              </c:if>
              <c:if test="${trip.tripMembers.size() != 1}">
                <img
                  src="/images/groupTrip.png"
                  class="card-img-top"
                  alt="..."
                />
              </c:if>
              <div class="card-body">
                <div class="d-flex flex-column">
                  <div
                    class="d-flex align-items-center justify-content-between"
                  >
                    <h5 class="flex-flex-1 trip_name">
                      <c:out value="${trip.tripName}"></c:out>
                    </h5>
                    <c:if test="${trip.tripMembers.size() == 1}">
                      <p class="travel-tag flex-shrink-0">SOLO</p>
                    </c:if>
                    <c:if test="${trip.tripMembers.size() != 1}">
                      <p class="travel-tag flex-shrink-0">GROUP</p>
                    </c:if>
                  </div>
                  <div class="card-text">
                    <div class="d-flex align-items-center mb-3">
                      <img
                        src="/images/creator.png"
                        alt=""
                        class="icons me-2"
                      />
                      <h6 class="m-0">
                        <c:out value="${trip.tripCreator.name}"></c:out>
                      </h6>
                    </div>
                    <div class="d-flex align-items-center mb-3">
                      <img src="/images/marker.png" alt="" class="icons me-2" />
                      <h6 class="m-0 fst-italic">
                        <c:out value="${trip.destination}"></c:out>
                      </h6>
                    </div>
                    <!-- trip summary -->
                    <p class="mb-0">
                      <c:out value="${trip.summary}"></c:out>
                    </p>
                  </div>
                </div>
              </div>
              <c:if test="${trip.tripCreator.id != sessionScope.userId}">
                <a href="/trip/${trip.id}" class="btn mt-auto m-3 mt-0"
                  >View Trip</a
                >
              </c:if>
              <c:if test="${trip.tripCreator.id == sessionScope.userId}">
                <a href="/trip/${trip.id}" class="btn mt-auto m-3 my-0"
                  >View Trip</a
                >
                <d class="d-flex flex-wrap m-3 mt-2">
                  <a href="/trip/${trip.id}/edit" class="btn col me-2">Edit</a>
                  <a href="/trip/${trip.id}/delete" class="btn col delete"
                    >Delete</a
                  >
                </d>
              </c:if>
            </a>
          </div>
        </c:forEach>
      </div>
    </div>
  </body>
</html>
