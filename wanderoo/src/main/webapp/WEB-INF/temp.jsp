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
      <!-- <div
        class="border border-danger d-flex flex-column flex-md-row gap-4 justify-content-between align-items-center"
      >
        <h3 id="logo" class="p-0 m-0 fs-2 fw-bold">Wanderoo.</h3>
        <div class="d-flex gap-3">
          <a href="/trip/new" class="nav-link">+ New Trip</a>
          <a href="/about" class="nav-link">About</a>
          <a href="/temp" class="nav-link">
            <i class="bi bi-person-fill me-1"></i><c:out value="${user.name}"
          /></a>
          <a href="/logout" class="nav-link logout">Logout</a>
        </div>
      </div> -->
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
                    >Profile Settings</a
                  >
                </li>
              </ul>
            </div>
          </div>
        </nav>
      </section>
      <!-- <hr class="mt-0" /> -->
      <main class="container mt-3 p-0 pb-4 mb-5">
        <!-- TRIP SECTION -->
        <section id="trips" class="d-flex flex-column align-items-center gap-3">
          <h2 class="main-header-style p-0 m-0">Your Trips</h2>
          <!-- TRIP ROW -->
          <div class="d-flex flex-column flex-md-row gap-4">
            <!-- place trip view link here -->
            <div class="card trip-card">
              <a href="#">
                <img
                  src="/images/soloTrip.png"
                  ++
                  alt=""
                  class="card-img-top"
                />
                <div class="card-body d-flex flex-column gap-3">
                  <!-- TRIP CARD HEADER -->
                  <div
                    class="d-flex justify-content-between align-items-center"
                  >
                    <h3 class="p-0 m-0 main-header-style">Trip Name</h3>
                    <p class="travel-size-tag m-0 fw-semibold">GROUP</p>
                  </div>
                  <!-- TRIP MAIN DETAILS -->
                  <div class="d-flex align-items-center gap-3 fs-6">
                    <i class="fa-solid fa-user secondary-color p-0 m-0"></i>
                    <p class="p-0 m-0 fw-medium">Creator Name</p>
                  </div>
                  <div class="d-flex align-items-center gap-3 fs-6">
                    <i
                      class="fa-solid fa-location-dot secondary-color p-0 m-0"
                    ></i>
                    <p class="p-0 m-0 fw-medium">Location</p>
                  </div>
                  <div class="d-flex align-items-center gap-3 fs-6">
                    <i class="fa-solid fa-calendar secondary-color p-0 m-0"></i>
                    <p class="p-0 m-0 fw-medium">Trip Date</p>
                  </div>
                  <!-- TRIP BIO -->
                  <p class="m-0 p-0 card-text">
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. A
                    voluptatem libero quam optio quo ex exercitationem
                    laudantium reprehenderit, fugiat earum odio nulla tenetur ab
                    quaerat assumenda dolore accusantium non id!
                  </p>
                </div>
                <a href="" class="btn mx-3 mb-3 fw-semibold">View Trip</a>
              </a>
            </div>
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
