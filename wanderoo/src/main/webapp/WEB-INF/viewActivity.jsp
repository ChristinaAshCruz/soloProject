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
      <!-- nav bar -->
      <div
        class="d-flex flex-wrap justify-content-between align-items-center mb-3 header_row"
        id="header"
      >
        <h3 id="logo" class="my-0 flex-grow-1 pt-2">Wanderoo.</h3>
        <div class="d-flex flex-shrink-0">
          <h4 class="my-0">Welcome, <c:out value="${user.name}" />!</h4>
        </div>
        <div class="nav-buttons flex-shrink-0">
          <a href="/dashboard" class="me-1 btn">Back to Home</a>
          <a href="/logout" class="btn">Logout</a>
        </div>
      </div>
      <hr class="mb-3" />
      <!-- content container -->
      <div class="activity mx-3">
        <!-- card header row -->
        <div
          class="body-header d-flex flex-wrap align-items-baseline mb-2 header_row"
        >
          <div class="flex-grow-1">
            <!-- <h1 class="mb-0">Activities</h1> -->
            <h5 class="sub-title p-0 m-0">
              <c:out value="${trip.tripName}"></c:out> Trip > Activities >
              <c:out value="${activity.name}"></c:out>
            </h5>
          </div>
          <!-- buttons -->

          <a href="/trip/${trip.id}/activity/list" class="btn"
            >Back To Activities</a
          >
        </div>

        <!-- activity card -->
        <div class="card activity-detail-card mb-3 p-1">
          <div class="d-flex justify-content-end px-3 pt-3 mb-0">
            <!-- activity type tag -->
            <p class="list_tag">
              <c:out value="${activity.activityType}"></c:out>
            </p>
          </div>
          <div class="card-body">
            <div
              class="d-flex flex-wrap justify-content-between align-items-center mb-3"
            >
              <!-- activity name -->
              <div class="d-flex flex-column flex-fill">
                <h1><c:out value="${activity.name}"></c:out></h1>
                <p>
                  <c:out value="${activity.summary}"></c:out>
                </p>
              </div>
              <div class="d-flex flex-column">
                <!-- activity creator row -->
                <!-- <div class="d-flex align-items-center mb-3">
                  <img src="/images/creator.png" alt="" class="icons me-2" />
                  <h6 class="m-0">
                    <c:out value="${trip.tripCreator.name}"></c:out>
                  </h6>
                </div> -->
                <div
                  class="d-flex align-items-center justify-content-around flex-fill"
                >
                  <img src="/images/creator.png" alt="" class="icons me-2" />
                  <h6 class="mb-2 flex-fill">
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
                <div class="d-flex align-items-center justify-content-around">
                  <img src="/images/marker.png" alt="" class="icons me-2" />
                  <h6 class="flex-grow-1">
                    <c:out value="${activity.distanceFromStay}"></c:out> miles
                    away
                  </h6>
                </div>
              </div>
            </div>

            <!-- activity card: button row -->
            <div class="d-flex justify-content-between flex-wrap button-row">
              <!-- left col -->
              <div class="flex-grow-1">
                <c:if test="${ activity.infoLink == null}">
                  <a href="${activity.infoLink}" class="btn info_link me-1">
                    <!-- Want more info? -->
                    <p class="p-0 m-0 me-2">
                      <i class="fi fi-br-link-alt me-2 p-0 icon"></i>more info
                    </p>
                  </a>
                </c:if>
                <c:if test="${ attendStatus == false}">
                  <a
                    href="/trip/${trip.id}/activity/${activity.id}/member-attend"
                    class="btn"
                    >Interested in going?</a
                  >
                </c:if>
                <c:if test="${ attendStatus == true}">
                  <p>You're attending this event! 😎</p>
                </c:if>
              </div>
              <!-- right col -->
              <div>
                <c:if
                  test="${activity.activityCreator.id == sessionScope.userId
              }"
                >
                  <a
                    href="/trip/${trip.id}/activity/${activity.id}/edit"
                    class="btn pt-2 me-1"
                    >Edit</a
                  >
                  <a
                    href="/trip/${trip.id}/activity/${activity.id}/delete"
                    class="btn delete pt-2"
                    >Delete</a
                  >
                </c:if>
              </div>
            </div>
          </div>
        </div>
        <!-- this code block only appears if trip is a group trip -->
        <div class="card p-3">
          <c:if test="${activity.membersAttending.size() > 0}">
            <c:forEach var="member" items="${activity.membersAttending}">
              <h5>Members Attending this event:</h5>
              <c:if test="${member.id == sessionScope.userId}">
                <li>You</li>
              </c:if>
              <c:if test="${member.id != sessionScope.userId}">
                <li>You</li>
              </c:if>
            </c:forEach>
          </c:if>
          <c:if test="${activity.membersAttending.size() == 0}">
            <h6 class="text-center my-0">
              No one is currently interested in this activity 😕
            </h6>
          </c:if>
        </div>
      </div>
    </div>
  </body>
</html>
