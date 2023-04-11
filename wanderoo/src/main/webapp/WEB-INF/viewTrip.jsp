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
    <title>Trip: {destination here!}</title>
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
    <div class="container px-4">
      <div
        class="d-flex justify-content-between align-items-end mb-3"
        id="header"
      >
        <h3 id="logo" class="my-0">Wanderoo.</h3>
        <div class="d-flex flex-sm-row align-items-center">
          <h4 class="my-0 me-4">Welcome, <c:out value="${user.name}" />!</h4>
          <a href="/dashboard" class="me-2 btn btn-primary">Back to Home</a>
          <a href="/" class="btn btn-primary">Logout</a>
        </div>
      </div>
      <hr class="mb-3" />
      <div class="main mx-4">
        <div class="card col-sm trip-detail-card mb-3">
          <div class="d-flex justify-content-end px-3 pt-3 mb-0">
            <p class="travel-tag">SOLO</p>
          </div>
          <div class="card-body mt-2 pt-0">
            <div
              class="d-flex justify-content-between align-items-center card-title"
            >
              <h1>Graduation Trip</h1>
            </div>
            <div class="d-flex align-items-baseline mb-3">
              <img src="/images/marker.png" alt="" class="icons me-2" />
              <h4 class="m-0 me-2">Destination:</h4>
              <h4 class="m-0 fst-italic">Italy</h4>
            </div>
            <h4>Trip Summary</h4>
            <p class="mb-0">
              Lorem, ipsum dolor sit amet consectetur adipisicing elit. Velit
              adipisci cumque architecto autem mollitia iste ut corporis.
              Explicabo sit natus, libero officiis eum, laborum beatae ipsum,
              enim accusamus odit quidem.
            </p>
          </div>
        </div>
        <div class="row g-3">
          <div class="col-sm">
            <a href="/trip/1" class="trip_card">
              <div class="card">
                <img
                  src="/images/restaurantImg.png"
                  class="img-fluid"
                  alt="..."
                />
                <div class="card-body">
                  <div
                    class="d-flex justify-content-between align-items-end card-title"
                  >
                    <h1>Restaurants</h1>
                    <p class="amount-tag">5</p>
                  </div>
                  <h5>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit.
                    Ducimus eos nemo autem pariatur, animi tempora
                    necessitatibus voluptatum voluptatem dolore voluptate quam
                    nam minima ipsa repellendus quo accusamus mollitia quis ad!
                  </h5>
                </div>
              </div>
            </a>
          </div>
          <div class="col-sm">
            <a href="/trip/1" class="trip_card">
              <div class="card">
                <img
                  src="/images/activityImg.png"
                  class="img-fluid"
                  alt="..."
                />
                <div class="card-body">
                  <div
                    class="d-flex justify-content-between align-items-end card-title"
                  >
                    <h1>Activities</h1>
                    <p class="amount-tag">4</p>
                  </div>
                  <h5>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit.
                    Ducimus eos nemo autem pariatur, animi tempora
                    necessitatibus voluptatum voluptatem dolore voluptate quam
                    nam minima ipsa repellendus quo accusamus mollitia quis ad!
                  </h5>
                </div>
              </div>
            </a>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
