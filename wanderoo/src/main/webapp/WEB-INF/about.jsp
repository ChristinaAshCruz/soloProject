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
    <title>About Wanderoo</title>
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
  </head>
  <body>
    <div class="container">
      <!-- navbar -->
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

      <hr class="mt-0" />
      <!-- Container -->
      <div class="row">
        <!-- Column -->
        <div class="col mb-4 d-flex align-items-stretch">
          <!--Card Primary-->
          <div class="trip_card card p-3">
            <h2 class="card-title">About this Project</h2>
            <hr class="my-2" />
            <p class="card-text">
              Wanderoo is a web app was made to make it easier for users to
              coordinate places to eat and activities they would like to do
              during a vacation. It's a hub that they can utilize for solo trips
              and even trips with large groups!
            </p>
            <hr />
            <h6>Sources used:</h6>
            <ul>
              <li>
                Icons by
                <a href="https://www.flaticon.com/" class="text-primary">
                  flaticon
                </a>
                and
                <a href="https://icons.getbootstrap.com/" class="text-primary"
                  >Bootstrap</a
                >
              </li>
              <li>
                design assets by
                <a href="https://storyset.com/" class="text-primary"
                  >Storyset</a
                >
              </li>
            </ul>
            <p class="fst-italic mb-1 d-flex align-items-center">
              <a
                href="https://github.com/ChristinaAshCruz/soloProject"
                class="contact-button-row"
              >
                <i class="bi bi-github me-2"></i>
              </a>
              Coded by Christina Ashley Cruz
            </p>
          </div>
          <!--/.Card Primary-->
        </div>
        <!-- Column -->

        <!-- Column -->
        <div class="col-md-4 mb-4 d-flex align-items-stretch">
          <!--Card Primary-->
          <div class="trip_card card p-3 text-center z-depth-2 col">
            <h2 class="card-title">Contact me!</h2>
            <hr class="my-2" />
            <div class="d-flex contact-button-row justify-content-center">
              <a href="https://www.linkedin.com/in/christina-ashley-cruz/"
                ><i class="bi bi-linkedin contact-button-row"></i
              ></a>
              <a href="https://github.com/ChristinaAshCruz"
                ><i class="bi bi-github contact-button-row"></i
              ></a>
              <a href="mailto:christina.ash.cruz@gmail.com"
                ><i class="bi bi-envelope-fill contact-button-row"></i
              ></a>
            </div>
          </div>
          <!--/.Card Primary-->
        </div>
      </div>
    </div>
  </body>
</html>
