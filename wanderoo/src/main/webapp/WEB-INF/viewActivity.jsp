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
      Wanderoo | <c:out value="${trip.tripName}"></c:out> Trip: Activities
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
    <!-- icon -->
    <link
      rel="stylesheet"
      href="https://cdn-uicons.flaticon.com/uicons-bold-rounded/css/uicons-bold-rounded.css"
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
          <a href="/dashboard" class="me-2 btn btn-primary">Back to Home</a>
          <a href="/logout" class="btn btn-primary">Logout</a>
        </div>
      </div>
      <hr class="mb-3" />
      <!-- content container -->
      <div class="activity mx-3">
        <!-- trip name -->
        <div class="body-header d-flex align-items-baseline mb-2">
          <div class="flex-grow-1">
            <!-- <h1 class="mb-0">Activities</h1> -->
            <h5 class="sub-title p-0 m-0">
              <c:out value="${trip.tripName}"></c:out> Trip > Activities >
              <c:out value="${activity.name}"></c:out>
            </h5>
          </div>
          <!-- buttons -->

          <a href="/trip/1" class="btn btn-primary">Back To Trip</a>
        </div>

        <!-- activity card -->
        <div class="card col-sm activity-detail-card mb-3 p-1">
          <div class="d-flex justify-content-end px-3 pt-3 mb-0">
            <!-- activity type tag -->
            <p class="list_tag">
              <c:out value="${activity.activityType}"></c:out>
            </p>
          </div>
          <div class="card-body">
            <div
              class="d-flex justify-content-between align-items-end card-title mb-0"
            >
              <!-- activity name -->
              <h1><c:out value="${activity.name}"></c:out></h1>
              <div>
                <!-- activity creator row -->
                <div class="d-flex align-items-center mb-3">
                  <img src="/images/creator.png" alt="" class="icons me-2" />
                  <h6 class="m-0">
                    <c:if
                      test="${activity.activityCreator.id == sessionScope.userId}"
                    >
                      <i>You</i>
                    </c:if>
                    <c:if
                      test="${activity.activityCreator.id != sessionScope.userId}"
                    >
                      <c:out value="${activity.activityCreator.name}"></c:out>
                    </c:if>
                  </h6>
                </div>
                <!-- distance from stay row -->
                <div class="d-flex align-items-center">
                  <img src="/images/marker.png" alt="" class="icons me-2" />
                  <h6 class="m-0 me-2">
                    <c:out value="${activity.distanceFromStay}"></c:out> miles
                    away
                  </h6>
                </div>
              </div>
            </div>
            <h4>Activity Summary</h4>
            <p>
              <c:out value="${activity.summary}"></c:out>
            </p>
            <!-- activity card: button row -->
            <div class="d-flex justify-content-between">
              <div class="flex-grow-1">
                <a href="#" class="btn pt-2">{Attend activity}</a>
              </div>
              <div>
                <a href="${activity.infoLink}" class="btn me-2 info_link">
                  <!-- Want more info? -->
                  <div class="d-flex align-items-center">
                    <i class="fi fi-br-link-alt me-2"></i>
                    <p class="pb-1 m-0">more info</p>
                  </div>
                </a>
                <a
                  href="/trip/${trip.id}/activity/${activity.id}/edit"
                  class="btn pt-2"
                  >Edit Activity</a
                >
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
