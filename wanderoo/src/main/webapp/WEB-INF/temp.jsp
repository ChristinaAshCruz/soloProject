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
  <body class="p-0 mx-auto d-flex flex-column min-vh-100">
    <div class="container p-4">
      <section>
        <!-- NAVBAR -->
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
      <!-- <hr class="mt-0" /> -->
      <main class="container mt-3 p-0 pb-4 mb-5">
        <!-- TRIP SECTION -->
        <section id="trips" class="d-flex flex-column align-items-center gap-4">
          <h2 class="main-header-style p-0 m-0 mb-2">Your Trips</h2>
          <!-- TRIP ROW -->
          <div class="d-flex flex-column flex-lg-row gap-4">
            <c:forEach var="trip" items="${user.tripsAttending}">
              <!-- place trip view link here -->
              <div
                class="card trip-card d-flex flex-column justify-content-between"
              >
                <a href="/trip/${trip.id}">
                  <c:if test="${trip.tripMembers.size() == 1}">
                    <img
                      src="/images/soloTrip.png"
                      ++
                      alt=""
                      class="card-img-top"
                    />
                  </c:if>
                  <c:if test="${trip.tripMembers.size() != 1}">
                    <img
                      src="/images/groupTrip.png"
                      ++
                      alt=""
                      class="card-img-top"
                    />
                  </c:if>
                  <!-- card body -->
                  <div
                    class="card-body d-flex flex-column justify-content-between gap-3"
                  >
                    <!-- TRIP CARD HEADER -->
                    <div
                      class="d-flex justify-content-between align-items-center gap-1"
                    >
                      <h5 class="p-0 m-0 main-header-style">
                        <c:out value="${trip.tripName}"></c:out>
                      </h5>
                      <c:if test="${trip.tripMembers.size() != 1}">
                        <p class="travel-size-tag m-0 fw-semibold">GROUP</p>
                      </c:if>
                      <c:if test="${trip.tripMembers.size() == 1}">
                        <p class="travel-size-tag m-0 fw-semibold">SOLO</p>
                      </c:if>
                    </div>
                    <!-- TRIP MAIN DETAILS -->
                    <div class="d-flex align-items-center gap-3 fs-6">
                      <!-- TRIP: creator -->
                      <i class="fa-solid fa-user secondary-color p-0 m-0"></i>
                      <p class="p-0 m-0 fw-medium">
                        <c:out value="${trip.tripCreator.name}"></c:out>
                      </p>
                    </div>
                    <div class="d-flex align-items-center gap-3 fs-6">
                      <!-- TRIP: destination -->
                      <i
                        class="fa-solid fa-location-dot secondary-color p-0 m-0"
                      ></i>
                      <p class="p-0 m-0 fw-medium">
                        <c:out value="${trip.destination}"></c:out>
                      </p>
                    </div>
                    <div class="d-flex align-items-center gap-3 fs-6">
                      <i
                        class="fa-solid fa-calendar secondary-color p-0 m-0"
                      ></i>
                      <p class="p-0 m-0 fw-medium">Trip Dates</p>
                    </div>
                    <!-- TRIP: summary -->
                    <p class="m-0 p-0 card-text">
                      <c:out value="${trip.summary}"></c:out>
                    </p>
                  </div>
                  <c:if test="${trip.tripCreator.id != sessionScope.userId}">
                    <!-- <a
                      href="/trip/${trip.id}"
                      class="btn mx-3 mb-3 fs-5 fw-medium"
                      >View Trip</a
                    > -->
                    <a
                      href="/trip/${trip.id}"
                      class="btn mx-3 mb-3 fs-6 fw-medium"
                      title="view trip"
                      ><i class="fa-solid fa-eye me-2"></i> View Trip</a
                    >
                  </c:if>
                  <c:if test="${trip.tripCreator.id == sessionScope.userId}">
                    <a
                      href="/trip/${trip.id}"
                      class="btn mt-auto mx-3 mb-1 fs-6 fw-medium"
                      ><i class="fa-solid fa-eye me-2"></i> View Trip</a
                    >
                    <div class="d-flex m-3 mt-2 gap-3">
                      <a
                        href="/trip/${trip.id}/edit"
                        class="btn col fs-6 fw-medium"
                        ><i class="fa-solid fa-pen-to-square me-2"></i> Edit</a
                      >
                      <a
                        href="/trip/${trip.id}/delete"
                        class="btn col danger fs-6 fw-medium"
                        ><i class="fa-solid fa-trash me-2"></i> Delete</a
                      >
                    </div>
                  </c:if>
                </a>
              </div>
            </c:forEach>
          </div>
        </section>
      </main>
    </div>
    <footer class="footer mt-auto py-4">
      <div
        class="container d-flex justify-content-between align-items-end flex-column gap-1 text-md-none"
      >
        <div>
          <p class="p-0 m-0">© 2023 Christina Ashley Cruz</p>
        </div>
        <div>
          Icons made by
          <a href="https://www.flaticon.com/authors/freepik" title="Freepik">
            Freepik</a
          >
          from
          <a href="https://www.flaticon.com/" title="Flaticon"
            >www.flaticon.com</a
          >
        </div>
        <div>
          <a target="_blank" href="https://icons8.com/icon/90519/spring-boot"
            >Spring Boot</a
          >
          and
          <a target="_blank" href="https://icons8.com/icon/3764/sql">SQL</a>
          icon by
          <a target="_blank" href="https://icons8.com">Icons8</a> icon by
          <a target="_blank" href="https://icons8.com">Icons8</a>
        </div>
      </div>
    </footer>
  </body>
</html>
