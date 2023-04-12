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
    <title>Project Name here</title>
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
    <div class="container">
      <div
        class="d-flex justify-content-between align-items-end mb-3"
        id="header"
      >
        <h3 id="logo" class="my-0">Wanderoo.</h3>
        <div class="d-flex flex-sm-row align-items-end">
          <h4 class="my-0 me-4">Welcome, <c:out value="${user.name}" />!</h4>
          <a href="/trip/new" class="btn btn-primary me-2">+ New Trip</a>
          <a href="/" class="btn btn-primary">Logout</a>
        </div>
      </div>
      <hr />
      <h1 class="mb-3">Your Trips</h1>
      <div class="row mx-4">
        <c:forEach var="trip" items="${user.tripsCreated}">
           <!-- column -->
          <div class="col-md-4 mb-4 d-flex align-items-stretch">
            <!-- trip card -->
            <a href="/trip/${trip.id}" class="trip_card card">
              <img src="/images/soloTrip.png" class="card-img-top" alt="..." />
              <div class="card-body">
                <div
                  class="d-flex justify-content-between align-items-center card-title mb-0"
                >
                  <h4 class="flex-grow-1 trip_name">
                    <c:out value="${trip.tripName}"></c:out> Trip
                  </h4>
                  <p class="travel-tag">SOLO</p>
                </div>
                <div class="card-text mb-0">
                  <div class="d-flex align-items-center mb-3">
                    <img src="/images/creator.png" alt="" class="icons me-2" />
                    <h6 class="m-0">Jane Doe</h6>
                  </div>
                  <div class="d-flex align-items-center mb-3">
                    <img src="/images/marker.png" alt="" class="icons me-2" />
                    <h6 class="m-0 me-2">Destination:</h6>
                    <h6 class="m-0 fst-italic">Italy</h6>
                  </div>
                  <p>
                    <c:out value="${trip.summary}"></c:out>
                  </p>
                </div>
              </div>
            </a>
          </div>
        </c:forEach>
        <!-- <div class="col-md-4 mb-4 d-flex align-items-stretch">
          <a href="/" class="trip_card">
            <div class="card">
              <img src="/images/soloTrip.png" class="card-img-top" alt="..." />
              <div class="card-body">
                <div
                  class="d-flex justify-content-between align-items-center card-title"
                >
                  <h5 class="flex-grow-1">Graduation Trip</h5>
                  <p class="travel-tag">SOLO</p>
                </div>
                <p class="card-text">
                  Lorem ipsum dolor sit amet consectetur adipisicing elit.
                  Ducimus eos nemo autem pariatur, animi tempora necessitatibus
                  voluptatum voluptatem dolore voluptate quam nam minima ipsa
                  repellendus quo accusamus mollitia quis ad!
                </p>
              </div>
            </div>
          </a>
        </div>
        <div class="col-md-4 mb-4 d-flex align-items-stretch">
          <a href="/" class="trip_card">
            <div class="card">
              <img src="/images/groupTrip.png" class="card-img-top" alt="..." />
              <div class="card-body">
                <div
                  class="d-flex justify-content-between align-items-center card-title"
                >
                  <h5 class="flex-grow-1">Tokyo</h5>
                  <div class="col d-flex">
                    <p class="travel-tag me-2">GROUP</p>
                    <p class="travel-tag">4</p>
                  </div>
                </div>
                <p class="card-text">
                  Lorem ipsum dolor sit amet consectetur adipisicing elit.
                  Ducimus eos nemo autem pariatur, animi tempora necessitatibus
                  voluptatum voluptatem dolore voluptate quam nam minima ipsa
                  repellendus quo accusamus mollitia quis ad!
                </p>
              </div>
            </div>
          </a>
        </div>
      </div> -->
      <!-- <div class="container">
        <div class="row">
          <div class="col-md-4 mb-4 d-flex align-items-stretch">
            <div class="card">
              <img src="..." class="card-img-top" alt="..." />
              <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">
                  Some quick example text to build on the card title and make up
                  the bulk of the card's content.
                </p>
                <a href="#" class="btn btn-primary">Go somewhere</a>
              </div>
            </div>
          </div>
          <div class="col-md-4 mb-4 d-flex align-items-stretch">
            <div class="card">
              <img src="..." class="card-img-top" alt="..." />
              <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">
                  Some quick example text to build on the card title and make up
                  the bulk of the card's content.
                </p>
                <a href="#" class="btn btn-primary">Go somewhere</a>
              </div>
            </div>
          </div>
          <div class="col-md-4 mb-4 d-flex align-items-stretch">
            <div class="card">
              <img src="..." class="card-img-top" alt="..." />
              <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">
                  Lorem ipsum dolor sit amet consectetur, adipisicing elit.
                  Molestiae eaque animi nobis aliquam, corrupti eum, numquam,
                  officia commodi tempora sit iure cupiditate dicta aspernatur
                  soluta ullam quis? Tempora, id? Blanditiis.
                </p>
                <a href="#" class="btn btn-primary">Go somewhere</a>
              </div>
            </div>
          </div>
        </div>
      </div> -->
    </div>
  </body>
</html>
