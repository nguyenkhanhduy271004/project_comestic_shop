<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <div class="set-carousel" style="padding-top: 140px">
            <div class="container">
                <div class="column1">
                    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel"
                        data-bs-interval="2000">
                        <div class="carousel-indicators">
                            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
                                class="active" aria-current="true" aria-label="Slide 1"></button>
                            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                                aria-label="Slide 2"></button>
                            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                                aria-label="Slide 3"></button>
                        </div>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="<c:url value='/client/img/imgCarousel/1.webp' />" class="d-block w-100"
                                    alt="Slide 1" />

                            </div>
                            <div class="carousel-item">
                                <img src="<c:url value='/client/img/imgCarousel/2.webp' />" class="d-block w-100"
                                    alt="Slide 2" />
                            </div>
                            <div class="carousel-item">
                                <img src="<c:url value='/client/img/imgCarousel/4.webp' />" class="d-block w-100"
                                    alt="Slide 3" />
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                            data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                            data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                </div>
                <div class="column2">
                    <div class="row1">
                        <a href="#">
                            <img src="<c:url value='/client/img/imgCarousel/5.webp' />" />
                        </a>
                    </div>
                    <div class="row2">
                        <a href="#">
                            <img src="<c:url value='/client/img/imgCarousel/6.webp' />" />
                        </a>
                    </div>
                </div>
            </div>
        </div>