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
    <title><c:out value="${trip.tripName}"></c:out> Trip</title>
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
    <div class="container">
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
      <hr class="mb-3 mt-3" />
      <!-- content container -->
      <div class="main mx-4">
        <div class="d-flex flex-wrap trip-detail-row mb-3">
          <!-- trip card -->
          <div class="card col-sm trip-detail-card p-1">
            <div class="d-flex justify-content-end px-3 pt-3 mb-0">
              <p class="travel-tag">
                <c:if test="${tripMemberSize > 1}"> GROUP </c:if>
                <c:if test="${tripMemberSize == 1}"> SOLO </c:if>
              </p>
            </div>

            <div class="card-body">
              <div
                class="d-flex justify-content-between align-items-start mb-3"
              >
                <!-- TRIP NAME COL -->
                <div class="flex-grow-1">
                  <h1 class="card-title">
                    <c:out value="${trip.tripName}"></c:out> Trip
                  </h1>
                  <p>
                    <c:out value="${trip.summary}"></c:out>
                  </p>
                </div>
                <!-- CREATOR + DESTINATION -->
                <div>
                  <div class="d-flex align-items-center mb-3">
                    <img src="/images/creator.png" alt="" class="icons me-2" />
                    <h6 class="m-0">
                      <c:if
                        test="${trip.tripCreator.id == sessionScope.userId}"
                      >
                        You
                      </c:if>
                      <c:if
                        test="${trip.tripCreator.id != sessionScope.userId}"
                      >
                        <c:out value="${trip.tripCreator.name}"></c:out>
                      </c:if>
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
              <!-- TRIP SUMMARY -->

              <!-- button row on main trip card -->
              <div class="d-flex flex-wrap justify-content-between">
                <!-- edit button -->
                <div>
                  <a href="/trip/${trip.id}/edit" class="btn">Edit Trip</a>
                </div>
                <!-- add trip members form -->
                <!-- this feature only appears if tripCreator is in session -->
                <c:if test="${trip.tripCreator.id == sessionScope.userId}">
                  <form
                    action="/trip/${trip.id}/add-members"
                    method="POST"
                    modelAttribute="unaddedMembers"
                  >
                    <div class="d-flex">
                      <select
                        name="userId"
                        id="userId"
                        class="form-select me-2"
                      >
                        <c:if
                          test="${allUsers.size() == trip.tripMembers.size()}"
                        >
                          <option>All users are added!</option>
                        </c:if>
                        <c:if
                          test="${allUsers.size() != trip.tripMembers.size()}"
                        >
                          <option>Add Trip Members</option>
                          <c:forEach var="user" items="${allUsers}">
                            <!-- options will only show if it's not the user in session + is already a trip member -->
                            <c:if
                              test="${!trip.tripMembers.contains(user) && user.id != sessionScope.userId}"
                            >
                              <option value="${user.id}">
                                <c:out value="${user.name}"></c:out>
                              </option>
                            </c:if>
                          </c:forEach>
                        </c:if>
                      </select>
                      <button class="btn">Add</button>
                    </div>
                  </form>
                </c:if>
              </div>
            </div>
          </div>
          <!-- Members card -->
          <!-- will only show if: trip.tripMembers.size() != 1 -->
          <c:if test="${trip.tripMembers.size() != 1}">
            <div class="card p-3">
              <h5 class="card-title">Trip Members:</h5>
              <c:forEach var="member" items="${trip.tripMembers}">
                <li><c:out value="${member.name}"></c:out></li>
              </c:forEach>
            </div>
          </c:if>
        </div>
        <!-- list row -->
        <div class="row gx-3">
          <!-- column -->
          <div class="col-md-6 mb-3 d-flex align-items-stretch">
            <!-- activity list -->
            <div class="card trip_card">
              <a
                href="/trip/${trip.id}/activity/list"
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
                    <p class="amount-tag p-0">
                      <c:out value="${trip.tripActivities.size()}"></c:out>
                    </p>
                  </div>
                  <p class="card-text mb-3">
                    A collection of activities and places to see during your
                    trip
                  </p>
                  <a href="/trip/${trip.id}/activity/list" class="btn"
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
                    <h2 class="card-title">Restaurants</h2>
                    <p class="amount-tag p-0">
                      <c:out value="${trip.tripRestaurants.size()}"></c:out>
                    </p>
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
