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
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0" /> -->
    <title>Wanderoo</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/style2.css" />
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script>
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
  <body class="p-0 mx-auto d-flex flex-column min-vh-100">
    <div class="container p-4">
      <!-- NAVBAR -->
      <section>
        <nav class="navbar navbar-expand-lg bg-body-tertiary">
          <div class="container-fluid px-0 d-flex justify-content-between">
            <a class="navbar-brand fw-bold main-header-style" href="#"
              ><i
                class="fa-solid fa-suitcase-rolling pe-2"
                style="color: #262626"
              ></i
              >Wanderoo</a
            >
            <!-- toggle button that appears when window is small -->
            <button
              class="navbar-toggler"
              type="button"
              data-bs-toggle="collapse"
              data-bs-target="#navbarTogglerDemo02"
              aria-controls="navbarTogglerDemo02"
              aria-expanded="false"
              aria-label="Toggle navigation"
            >
              <span class="navbar-toggler-icon"></span>
            </button>
            <!-- menu that appears when toggle button is clicked -->
            <div
              class="collapse navbar-collapse my-auto"
              id="navbarTogglerDemo02"
            >
              <ul class="navbar-nav ms-auto my-auto mb-2 mb-lg-0 mt-1">
                <li class="nav-item">
                  <a
                    class="nav-link my-auto"
                    aria-current="page"
                    href="/trip/new"
                    >+ New Trip</a
                  >
                </li>
                <li class="nav-item">
                  <a class="nav-link active" href="/dashboard">Dashboard</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/about">About</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link text-danger" href="/temp"
                    ><c:out value="${user.name}"
                  /></a>
                </li>
              </ul>
            </div>
          </div>
        </nav>
      </section>
      <!-- MAIN CONTAINER -->
      <main class="container mt-5 p-0 pb-4 mb-5">
        <!-- <div class="d-flex flex-wrap trip-details mb-3"> -->
        <div class="trip-details">
          <!-- trip card -->
          <div class="card trip-main-details p-1">
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
            <div class="card p-3 trip-members">
              <h5 class="card-title">Trip Members:</h5>
              <c:forEach var="member" items="${trip.tripMembers}">
                <li><c:out value="${member.name}"></c:out></li>
              </c:forEach>
            </div>
          </c:if>
          <!-- </div> -->
          <!-- list row -->
          <!-- <div class="row gx-3"> -->
          <!-- column -->
          <!-- <div class="col-md-6 mb-3 d-flex align-items-stretch"> -->
          <!-- activity list -->
          <div class="card trip-activities">
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
                  A collection of activities and places to see during your trip
                </p>
                <a href="/trip/${trip.id}/activity/list" class="btn"
                  >View List</a
                >
              </div>
            </a>
          </div>
          <!-- </div> -->
          <!-- column -->
          <!-- <div class="col-md-6 mb-3 d-flex align-items-stretch"> -->
          <!-- restaurant list -->
          <div class="card trip-restaurants">
            <a
              href="/trip/${trip.id}/restaurant/list"
              class="text-decoration-none"
            >
              <img
                src="/images/restaurantImg.png"
                class="card-img-top"
                alt="..."
              />
              <div
                class="card-body d-flex flex-column justify-content-between align-items-between"
              >
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
          <!-- </div> -->
        </div>
      </main>
    </div>
  </body>
</html>
