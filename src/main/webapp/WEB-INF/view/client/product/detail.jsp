<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <title>${product.name} - Cosmetic Shop</title>
                <link rel="icon" href="<c:url value='/client/img/imgThuonghieu/4.png' />" type="image/png">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link
                    href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                    rel="stylesheet">
                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
                <link href="<c:url value='/client/css/bootstrap.min.css' />" rel="stylesheet">
                <link href="<c:url value='/client/css/style.css' />" rel="stylesheet">
                <link href="<c:url value='/client/css/product.css' />" rel="stylesheet">
                <link href="<c:url value='/client/css/header.css' />" rel="stylesheet">
                <link href="<c:url value='/client/css/footer.css' />" rel="stylesheet">
                <link href="<c:url value='/client/css/common.css' />" rel="stylesheet">
                <link href="<c:url value='/client/css/hot-product.css' />" rel="stylesheet">
                <link href="<c:url value='/client/css/sale-product.css' />" rel="stylesheet">
                <link href="<c:url value='/client/css/responsive-home.css' />" rel="stylesheet">
                <meta name="_csrf" content="${_csrf.token}" />
                <meta name="_csrf_header" content="${_csrf.headerName}" />

                <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.css"
                    rel="stylesheet">
                <style>
                    .review-container {
                        background-color: #fff;
                        border-radius: 8px;
                        padding: 20px;
                        margin-top: 30px;
                    }

                    .review-header {
                        font-size: 1.5rem;
                        color: #d9534f;
                        font-weight: bold;
                    }

                    .review-rating {
                        color: #ffa500;
                        font-size: 2rem;
                    }

                    .review-controls button {
                        margin-right: 10px;
                    }

                    .review-list {
                        margin-top: 20px;
                    }

                    .review-item {
                        padding: 15px;
                        /* border-bottom: 1px solid #ddd; */
                        /* background-color: #f8f9fa; */
                        transition: 0.3s;
                        border-radius: 8px;
                    }

                    .review-item:last-child {
                        border-bottom: none;
                    }

                    .review-user {
                        font-weight: bold;
                    }

                    .review-text {
                        color: #555;
                        margin-top: 5px;
                    }

                    .review-images img {
                        width: 80px;
                        height: 80px;
                        border-radius: 5px;
                        margin: 5px;
                    }
                </style>
            </head>

            <body style="background-color: #f7f4f3; font-family: 'Open Sans', sans-serif; color: #333;">
                <jsp:include page="../layout/header.jsp" />

                <div class="container py-5 mt-5" style="margin-top: 100px!important;">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="border rounded p-4" style="background-color: #fff;">
                                <img src="/images/product/${product.image}" class="img-fluid rounded" alt="Image"
                                    style="border-radius: 8px; width: 100%; height: auto;">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <h3 class="fw-bold mb-3" style="color: #a5678e;">${product.name}</h3>
                            <p class="text-muted mb-3">Brand: ${product.factory}</p>
                            <h4 class="fw-bold mb-3" style="color: #d47fa6;">
                                <fmt:formatNumber type="number" value="${product.price}" /> đ
                            </h4>
                            <p class="mb-4" style="color: #777;">${product.shortDesc}</p>
                            <div class="input-group quantity mb-5" style="width: 100px;">
                                <div class="input-group-btn">
                                    <button class="btn btn-sm btn-minus rounded-circle bg-light border">
                                        <i class="fa fa-minus"></i>
                                    </button>
                                </div>
                                <input type="text" class="form-control form-control-sm text-center border-0" value="1"
                                    data-cart-detail-index="0">
                                <div class="input-group-btn">
                                    <button class="btn btn-sm btn-plus rounded-circle bg-light border">
                                        <i class="fa fa-plus"></i>
                                    </button>
                                </div>
                            </div>

                            <!-- <form action="/add-product-from-view-detail" method="post"
                                modelAttribute="product"> -->
                            <div class="d-flex">
                                <div>
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                    <input class="form-control d-none" type="text" value="${product.id}" name="id" />
                                    <input class="form-control d-none" type="text" name="quantity"
                                        id="cartDetails0.quantity" value="1" />
                                    <button data-product-id="${product.id}"
                                        class="btnAddToCartDetail btn border border-secondary px-4 py-2 mb-4"
                                        style="background-color: #000; color: #fff;">
                                        <i class="fa fa-shopping-bag me-2"></i>
                                        Thêm vào giỏ
                                    </button>
                                </div>
                                <div class="ms-2">
                                    <form action="/favorite-product" method="post">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        <input type="hidden" name="productId" value="${product.id}" />

                                        <button type="submit"
                                            class="btn ${isFavorited ? 'btn-danger' : 'btn-outline-danger'}"
                                            style="margin-right: 10px; margin-top: 2px  ;">
                                            <i class="fa ${isFavorited ? 'fa-heart' : 'fa-heart'}"></i>
                                        </button>
                                    </form>
                                </div>
                                <!-- <button onclick="openChat('${product.id}')">Nhắn với Shop</button> -->



                            </div>

                            <!-- </form> -->
                            <!-- <button class="btn btn-primary btnAddToCartDetail"
                                style="background-color: #a5678e; color: #fff;">
                                <i class="fa fa-shopping-bag me-2"></i> Thêm vào giỏ
                            </button> -->
                        </div>
                    </div>

                    <div class="review-container mt-5">
                        <div class="review-header">ĐÁNH GIÁ SẢN PHẨM</div>
                        <!-- <div class="review-rating">5.0 trên 5</div> -->
                        <!-- <div class="review-controls mt-3">
                            <button class="btn btn-outline-primary">Tất Cả</button>
                            <button class="btn btn-outline-secondary">5 Sao (386)</button>
                            <button class="btn btn-outline-secondary">4 Sao (10)</button>
                            <button class="btn btn-outline-secondary">3 Sao (0)</button>
                            <button class="btn btn-outline-secondary">2 Sao (0)</button>
                            <button class="btn btn-outline-secondary">1 Sao (1)</button>
                        </div> -->
                        <div class="review-list mt-4">
                            <c:forEach var="review" items="${reviews.content}">
                                <div class="review-item d-flex p-3 mb-3" style="border-radius: 8px;">
                                    <div class="me-3">
                                        <img src="<c:url value='/client/img/avatar/5.png' />" alt="Avatar logo"
                                            style="width: 40px; height: 40px; border-radius: 50%; object-fit: cover;" />
                                    </div>
                                    <div style="flex-grow: 1;">
                                        <div class="d-flex justify-content-between">
                                            <div class="review-user">
                                                <div style="font-size: 0.7rem;">${review.user.fullName}</div>
                                                <span class="text-muted"
                                                    style="font-size: 0.7rem;">${review.reviewDate}</span>
                                            </div>
                                            <div class="dropdown">
                                                <button class="btn btn-sm btn-outline-secondary" type="button"
                                                    id="dropdownMenuButton" data-bs-toggle="dropdown"
                                                    aria-expanded="false">
                                                    <i class="fas fa-ellipsis-h"></i>
                                                </button>
                                                <ul class="dropdown-menu dropdown-menu-end"
                                                    aria-labelledby="dropdownMenuButton">
                                                    <c:if test="${userId != null && review.user.id == userId}">
                                                        <li>
                                                            <form action="/delete-review" method="post"
                                                                style="display:inline;">
                                                                <input type="hidden" name="reviewId"
                                                                    value="${review.id}" />
                                                                <input type="hidden" name="productId"
                                                                    value="${product.id}" />
                                                                <input type="hidden" name="${_csrf.parameterName}"
                                                                    value="${_csrf.token}" />
                                                                <button type="submit"
                                                                    class="dropdown-item text-danger">Delete</button>
                                                            </form>
                                                        </li>
                                                    </c:if>
                                                    <li><a class="dropdown-item" href="#">Report</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="review-text mt-2" style="color: #555;">Nội dung:
                                            ${review.reviewText}</div>

                                        <!-- Review images -->
                                        <c:if test="${not empty review.images}">
                                            <div class="review-images mt-3">
                                                <c:forEach var="image" items="${review.images}">
                                                    <img src="/images/review/${image}" alt="Review Image"
                                                        class="review-image" />
                                                </c:forEach>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                                <hr>
                            </c:forEach>
                            <c:if test="${reviews.totalElements == 0}">
                                <p class="text-center text-muted">Chưa có đánh giá nào cho sản phẩm này.</p>
                            </c:if>
                        </div>



                    </div>

                    <!-- Pagination -->
                    <nav aria-label="Page navigation">
                        <ul class="pagination justify-content-center mt-4">
                            <c:if test="${reviews.hasPrevious()}">
                                <li class="page-item">
                                    <a class="page-link"
                                        href="<c:url value='/product/${id}'/>?page=${currentPage - 1}">Previous</a>
                                </li>
                            </c:if>
                            <c:forEach begin="1" end="${reviews.totalPages}" var="i">
                                <li class="page-item ${currentPage == i ? 'active' : ''}">
                                    <a style="background-color: #000;" class="page-link"
                                        href="<c:url value='/product/${id}'/>?page=${i}">${i}</a>
                                </li>
                            </c:forEach>
                            <c:if test="${reviews.hasNext()}">
                                <li class="page-item">
                                    <a class="page-link"
                                        href="<c:url value='/product/${id}'/>?page=${currentPage + 1}">Next</a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                    <div>

                        <c:if test="${not empty pageContext.request.userPrincipal}">
                            <div class="border rounded p-4 mt-4" style="background-color: #f8f9fa;">
                                <h4 class="mb-4 text-center" style="color: #000; font-weight: bold;">Write a
                                    Review
                                </h4>
                                <form action="<c:url value='/create-review' />" method="post"
                                    enctype="multipart/form-data" class="text-center">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                    <input type="hidden" name="productId" value="${product.id}" />

                                    <div class="mb-3">
                                        <label for="rating" class="form-label">Rating (1-5):</label>
                                        <div class="star-rating">
                                            <input type="hidden" id="rating" name="rating" required>
                                            <span class="star" data-value="1">★</span>
                                            <span class="star" data-value="2">★</span>
                                            <span class="star" data-value="3">★</span>
                                            <span class="star" data-value="4">★</span>
                                            <span class="star" data-value="5">★</span>
                                        </div>
                                    </div>

                                    <div class="mb-3">
                                        <label for="reviewText" class="form-label">Your Review:</label>
                                        <textarea id="reviewText" name="reviewText" class="form-control w-75 mx-auto"
                                            rows="3" placeholder="Share your thoughts..." required></textarea>
                                    </div>

                                    <div class="mb-3">
                                        <label for="reviewMedia" class="form-label">Add Images/Videos:</label>
                                        <input type="file" id="reviewMedia" name="reviewMedia"
                                            class="form-control w-75 mx-auto" accept="image/*,video/*" multiple>
                                    </div>

                                    <button type="submit" class="btn btn-primary px-4 py-2 rounded-pill"
                                        style="background-color: #ccc; border: none;">
                                        <i class="fa fa-paper-plane me-2"></i>Submit Review
                                    </button>
                                </form>

                            </div>
                        </c:if>
                        <c:if test="${empty pageContext.request.userPrincipal}">
                            <span>Vui lòng đăng nhập để đánh giá sản phẩm</span>
                        </c:if>

                    </div>
                </div>
                <jsp:include page="../layout/footer.jsp" />



                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                <script src="<c:url value='/client/lib/easing/easing.min.js' />"></script>
                <script src="<c:url value='/client/lib/waypoints/waypoints.min.js' />"></script>
                <script src="<c:url value='/client/lib/lightbox/js/lightbox.min.js' />"></script>
                <script src="<c:url value='/client/lib/owlcarousel/owl.carousel.min.js' />"></script>
                <script src="<c:url value='/client/js/main.js?version=4' />"></script>
                <script
                    src="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.js"></script>

                <script>
                    function openChat(productId) {
                        window.location.href = "/chat?productId=" + productId;
                    }

                </script>


            </body>

            </html>