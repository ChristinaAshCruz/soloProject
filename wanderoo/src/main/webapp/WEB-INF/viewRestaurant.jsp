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
    <title>Wanderoo | Restaurant</title>
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
    <!-- icon -->
    <link
      rel="stylesheet"
      href="https://cdn-uicons.flaticon.com/uicons-bold-rounded/css/uicons-bold-rounded.css"
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
      <hr class="mb-3" />
      <!-- content container -->
      <div class="restaurant mx-3">
        <!-- trip name -->
        <div class="body-header d-flex align-items-baseline mb-2">
          <div class="flex-grow-1">
            <!-- <h1 class="mb-0">Activities</h1> -->
            <h5 class="sub-title p-0 m-0">
              <c:out value="${trip.tripName}"></c:out> Trip > Restaurants >
              <c:out value="${restaurant.name}"></c:out>
            </h5>
          </div>
          <!-- buttons -->

          <a href="/trip/${trip.id}/restaurant/list" class="btn"
            >Back To Restaurants</a
          >
        </div>

        <!-- restaurant card -->
        <div class="card col-sm restaurant-detail-card mb-3 p-1">
          <div class="d-flex justify-content-end px-3 pt-3 mb-0">
            <!-- restaurant type tag -->
            <p class="list_tag">
              <c:out value="${restaurant.cuisineType}"></c:out>
            </p>
          </div>
          <div class="card-body">
            <div class="d-flex justify-content-between align-items-end mb-0">
              <!-- restaurant name -->
              <h1><c:out value="${restaurant.name}"></c:out></h1>
              <div>
                <!-- restaurant creator row -->
                <div class="d-flex align-items-center mb-3">
                  <img src="/images/creator.png" alt="" class="icons me-2" />
                  <h6 class="m-0">
                    <c:if
                      test="${restaurant.restaurantCreator.id == sessionScope.userId}"
                    >
                      <i>You</i>
                    </c:if>
                    <c:if
                      test="${restaurant.restaurantCreator.id != sessionScope.userId}"
                    >
                      <c:out
                        value="${restaurant.restaurantCreator.name}"
                      ></c:out>
                    </c:if>
                  </h6>
                </div>
                <!-- distance from stay row -->
                <div class="d-flex align-items-center">
                  <img src="/images/marker.png" alt="" class="icons me-2" />
                  <h6 class="m-0 me-2">
                    <c:out value="${restaurant.distanceFromStay}"></c:out> miles
                    away
                  </h6>
                </div>
              </div>
            </div>
            <p>
              <c:out value="${restaurant.summary}"></c:out>
            </p>
            <!-- restaurant card: button row -->
            <div class="d-flex justify-content-between">
              <!-- left col -->
              <div class="d-flex flex-grow-1 align-items-baseline">
                <c:if test="${ activity.infoLink == null}">
                  <a href="${restaurant.infoLink}" class="btn info_link me-2">
                    <!-- Want more info? -->
                    <p class="p-0 m-0 me-2">
                      <i class="fi fi-br-link-alt me-2 p-0 icon"></i>more info
                    </p>
                  </a>
                </c:if>
                <!-- attending? -->
                <c:if test="${ attendStatus == false}">
                  <a
                    href="/trip/${trip.id}/restaurant/${restaurant.id}/member-attend"
                    class="btn"
                    >Interested in going?</a
                  >
                </c:if>
                <c:if test="${ attendStatus == true}">
                  <p class="p-0 m-0 ms-1">You're attending this event! 😎</p>
                </c:if>
              </div>
              <!-- right col -->
              <div>
                <!-- edit/ delete options only show up if creator is in session -->
                <c:if
                  test="${restaurant.restaurantCreator.id == sessionScope.userId
              }"
                >
                  <a
                    href="/trip/${trip.id}/restaurant/${restaurant.id}/edit"
                    class="btn pt-2 me-1"
                    >Edit</a
                  >
                  <a
                    href="/trip/${trip.id}/restaurant/${restaurant.id}/delete"
                    class="btn delete pt-2"
                    >Delete</a
                  >
                </c:if>
              </div>
            </div>
          </div>
        </div>
        <div class="card p-3">
          <c:if test="${restaurant.membersAttending.size() > 0}">
            <c:forEach var="member" items="${restaurant.membersAttending}">
              <h5>Members Attending this event:</h5>
              <c:if test="${member.id == sessionScope.userId}">
                <li>You</li>
              </c:if>
              <c:if test="${member.id != sessionScope.userId}">
                <li>You</li>
              </c:if>
            </c:forEach>
          </c:if>
          <c:if test="${restaurant.membersAttending.size() == 0}">
            <h6 class="text-center my-0">
              No one is currently interested in this activity 😕
            </h6>
          </c:if>
        </div>
      </div>
    </div>
  </body>
</html>
