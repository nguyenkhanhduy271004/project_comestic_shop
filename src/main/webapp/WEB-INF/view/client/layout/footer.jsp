<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!-- Footer Start -->
        <footer>
            <div class="parallax">
                <svg class="waves" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                    viewBox="0 24 150 28" preserveAspectRatio="none" shape-rendering="auto">
                    <defs>
                        <!-- Định nghĩa hình dạng sóng -->
                        <path id="gentle-wave"
                            d="M-160 44c30 0 58-18 88-18s 58 18 88 18 58-18 88-18 58 18 88 18 v44h-352z" />
                    </defs>
                    <g class="parallax-waves">
                        <!-- Lớp sóng thứ nhất -->
                        <use xlink:href="#gentle-wave" x="48" y="0" fill="rgba(244, 119, 140, 0.7)" />
                        <!-- Lớp sóng thứ hai, di chuyển khác nhau -->
                        <use xlink:href="#gentle-wave" x="48" y="3" fill="rgba(244, 119, 140, 0.5)" />
                        <!-- Lớp sóng thứ ba -->
                        <use xlink:href="#gentle-wave" x="48" y="5" fill="rgba(244, 119, 140, 0.3)" />
                        <!-- Lớp sóng thứ tư -->
                        <use xlink:href="#gentle-wave" x="48" y="7" fill="rgba(244, 119, 140, 1)" />
                    </g>
                </svg>
            </div>
            <div class="footer-container d-flex justify-content-center text-center flex-wrap">
                <div class="footer-section">
                    <h3>VỀ CHÚNG TÔI</h3>
                    <ul class="ps-0">
                        <li><a href="<c:url value='/' />">Giới thiệu</a></li>
                        <li><a href="<c:url value='/' />">Khách hàng</a></li>
                        <li><a href="<c:url value='/' />">Đối tác</a></li>
                        <li><a href="<c:url value='/' />">Hệ thống quản lý</a></li>
                        <li><a href="<c:url value='/' />">Tuyển dụng</a></li>
                        <li><a href="<c:url value='/' />">Liên hệ</a></li>
                    </ul>
                </div>

                <div class="footer-section">
                    <h3>HỖ TRỢ KHÁCH HÀNG</h3>
                    <ul class="ps-0">
                        <li><a href="<c:url value='/' />">Hướng dẫn đặt hàng</a></li>
                        <li><a href="<c:url value='/' />">Hướng dẫn thanh toán</a></li>
                        <li><a href="<c:url value='/' />">Câu hỏi thường gặp</a></li>
                        <li><a href="<c:url value='/shop/register' />">Đăng ký shop bán hàng</a></li>

                    </ul>
                </div>

                <div class="footer-section">
                    <h3>LIÊN HỆ</h3>
                    <p>📞 0796572799</p>
                    <p>Cơ sở 1: 123A, Võ Văn Ngân, Linh Chiểu, Huế</p>
                    <p>Cơ sở 2: 123A, Võ Văn Ngân, Linh Chiểu, Quảng Bình</p>
                    <p>Cơ sở 3: 123A, Võ Văn Ngân, Linh Chiểu, Quảng Trị</p>
                    <p>Cơ sở 4: 123A, Võ Văn Ngân, Linh Chiểu, Quảng Nam</p>
                    <p>🟢 Free Ship toàn quốc với đơn hàng từ 999.000 đồng</p>
                    <p>☎️ Hotline: 1900 6868</p>
                    <p>📞 Phản ánh DVKH: 0357.999.999</p>
                    <p>⚪ Lấy Chữ Tâm Để Phục Vụ - Lấy Chữ Tín Để Phát Triển</p>
                </div>

                <div class="footer-section">
                    <h3>CHÍNH SÁCH</h3>
                    <ul class="ps-0">
                        <li><a href="<c:url value='/' />">Chính sách ưu đãi</a></li>
                        <li><a href="<c:url value='/' />">Chính sách bảo mật</a></li>
                        <li><a href="<c:url value='/' />">Chính sách vận chuyển</a></li>
                        <li><a href="<c:url value='/' />">Chính sách đổi trả</a></li>
                        <li><a href="<c:url value='/' />">Chính sách kiểm hàng</a></li>
                        <li><a href="<c:url value='/' />">Chính sách thanh toán</a></li>
                    </ul>
                </div>
            </div>
        </footer>
        <!-- Footer End -->

        <!-- Copyright Start -->
        <!-- <div class="container-fluid copyright bg-dark py-4">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                        <span class="text-light"><a href="https://nguyenduy.vn" target="_blank"><i
                                    class="fas fa-copyright text-light me-2"></i>Central Crew</a>, All right
                            reserved.</span>
                    </div>
                    <div class="col-md-6 my-auto text-center text-md-end text-white">
                        By <a class="border-bottom" href="https://themewagon.com">ThemeWagon</a>
                    </div>
                </div>
            </div>
        </div> -->
        <!-- Copyright End -->