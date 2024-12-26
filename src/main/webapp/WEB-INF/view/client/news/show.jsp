<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="Cập nhật tin tức, xu hướng và mẹo làm đẹp từ mỹ phẩm." />
    <meta name="keywords" content="mỹ phẩm, tin tức làm đẹp, sản phẩm chăm sóc da, xu hướng mỹ phẩm" />
    <meta name="author" content="Mỹ Phẩm Xinh" />
    <title>Trang Tin Tức - Mỹ Phẩm Xinh</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/news.css" />
    <style>
        /* General styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            background-color: #f4f4f4;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        /* News section styles */
        .news {
            max-width: 1200px;
            margin: 30px auto;
            padding: 20px;
        }

        .news h1 {
            font-size: 32px;
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        .news-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .news-item {
            width: 30%;
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            transition: transform 0.3s ease;
        }

        .news-item:hover {
            transform: translateY(-5px);
        }

        .news-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .news-content {
            padding: 15px;
        }

        .news-content h2 {
            font-size: 20px;
            color: #333;
            margin-bottom: 10px;
        }

        .news-content .date {
            font-size: 14px;
            color: #888;
            margin-bottom: 15px;
        }

        .news-content .news-excerpt {
            font-size: 16px;
            color: #555;
            margin-bottom: 15px;
        }

        .read-more {
            font-size: 16px;
            color: #f0a500;
            font-weight: bold;
        }

        .read-more:hover {
            text-decoration: underline;
        }

        /* Button styles */
        .more-news {
            text-align: center;
            margin-top: 30px;
        }

        .btn-more-news {
            background-color: #f0a500;
            color: white;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .btn-more-news:hover {
            background-color: #e08d00;
        }

    </style>
</head>
<body>
<!-- Header -->
<jsp:include page="../layout/header.jsp" />

<!-- Main Content -->
<main>
    <section class="news">
        <h1>Tin Tức Mới Nhất</h1>
        <div class="news-container">
            <!-- News Item 1 -->
            <article class="news-item">
                <img
                        src="<%= request.getContextPath() %>/assets/news/1.jpg"
                        alt="Mẹo làm đẹp"
                        class="news-image"
                />
                <div class="news-content">
                    <h2>
                        <a href="<%= request.getContextPath() %>/news/1">Mẹo làm đẹp với các sản phẩm tự nhiên</a>
                    </h2>
                    <p class="date">Ngày 08/12/2024</p>
                    <p class="summary">
                        Khám phá các mẹo làm đẹp đơn giản từ những nguyên liệu tự nhiên
                        dễ tìm. Hãy bắt đầu hành trình làm đẹp ngay hôm nay với các sản
                        phẩm tự nhiên.
                    </p>
                    <a href="<%= request.getContextPath() %>/news/1" class="read-more">Đọc thêm &rarr;</a>
                </div>
            </article>

            <!-- News Item 2 -->
            <article class="news-item">
                <img
                        src="<%= request.getContextPath() %>/assets/news/2.jpg"
                        alt="Xu hướng mỹ phẩm 2025"
                        class="news-image"
                />
                <div class="news-content">
                    <h2>
                        <a href="<%= request.getContextPath() %>/news/2">Xu hướng mỹ phẩm 2025: Những điều cần biết</a>
                    </h2>
                    <p class="date">Ngày 05/12/2024</p>
                    <p class="summary">
                        Chúng ta sẽ chứng kiến những xu hướng mỹ phẩm nào trong năm
                        2025? Hãy cùng khám phá những thay đổi lớn trong ngành làm đẹp
                        sẽ làm bùng nổ thị trường.
                    </p>
                    <a href="<%= request.getContextPath() %>/news/2" class="read-more">Đọc thêm &rarr;</a>
                </div>
            </article>

            <!-- News Item 3 -->
            <article class="news-item">
                <img
                        src="<%= request.getContextPath() %>/assets/news/3.jpg"
                        alt="Cách chọn sản phẩm dưỡng da hiệu quả"
                        class="news-image"
                />
                <div class="news-content">
                    <h2>
                        <a href="<%= request.getContextPath() %>/news/3">Cách chọn sản phẩm dưỡng da hiệu quả cho từng loại da</a>
                    </h2>
                    <p class="date">Ngày 01/12/2024</p>
                    <p class="summary">
                        Tìm hiểu cách chọn các sản phẩm dưỡng da phù hợp với nhu cầu và
                        tình trạng da của bạn. Bước đi đúng đắn sẽ giúp bạn có làn da
                        khỏe mạnh hơn.
                    </p>
                    <a href="<%= request.getContextPath() %>/news/3" class="read-more">Đọc thêm &rarr;</a>
                </div>
            </article>

            <!-- News Item 4 -->
            <article class="news-item">
                <img
                        src="<%= request.getContextPath() %>/assets/news/4.jpg"
                        alt="Top sản phẩm chống nắng 2024"
                        class="news-image"
                />
                <div class="news-content">
                    <h2>
                        <a href="<%= request.getContextPath() %>/news/4">Top sản phẩm chống nắng hiệu quả nhất 2024</a>
                    </h2>
                    <p class="date">Ngày 28/11/2024</p>
                    <p class="summary">
                        Cùng điểm qua những sản phẩm chống nắng được yêu thích nhất và
                        được đánh giá cao trong năm nay để bảo vệ da khỏi tia UV.
                    </p>
                    <a href="<%= request.getContextPath() %>/news/4" class="read-more">Đọc thêm &rarr;</a>
                </div>
            </article>

            <!-- News Item 5 -->
            <article class="news-item">
                <img
                        src="<%= request.getContextPath() %>/assets/news/5.jpg"
                        alt="Các bước skincare ban đêm"
                        class="news-image"
                />
                <div class="news-content">
                    <h2>
                        <a href="<%= request.getContextPath() %>/news/5">Các bước skincare ban đêm chuẩn nhất</a>
                    </h2>
                    <p class="date">Ngày 25/11/2024</p>
                    <p class="summary">
                        Chăm sóc da vào ban đêm giúp tái tạo và phục hồi da tốt hơn. Khám
                        phá các bước skincare ban đêm chuẩn để có làn da mịn màng.
                    </p>
                    <a href="<%= request.getContextPath() %>/news/5" class="read-more">Đọc thêm &rarr;</a>
                </div>
            </article>

            <!-- News Item 6 -->
            <article class="news-item">
                <img
                        src="<%= request.getContextPath() %>/assets/news/6.jpg"
                        alt="Lợi ích của serum trong chăm sóc da"
                        class="news-image"
                />
                <div class="news-content">
                    <h2>
                        <a href="<%= request.getContextPath() %>/news/6">Lợi ích của serum trong chăm sóc da hàng ngày</a>
                    </h2>
                    <p class="date">Ngày 20/11/2024</p>
                    <p class="summary">
                        Serum là sản phẩm dưỡng da rất hiệu quả, giúp giải quyết các vấn
                        đề về da như mụn, nám, lão hóa. Cùng khám phá công dụng và lợi
                        ích của serum.
                    </p>
                    <a href="<%= request.getContextPath() %>/news/6" class="read-more">Đọc thêm &rarr;</a>
                </div>
            </article>

            <!-- Video Section -->
            <div class="video-item">
                <h2>Video: Hướng dẫn trang điểm tự nhiên</h2>
                <video controls>
                    <source src="<%= request.getContextPath() %>/assets/videos/tutorial.mp4" type="video/mp4" />
                    Trình duyệt của bạn không hỗ trợ video.
                </video>
                <p class="video-description">
                    Cùng xem video hướng dẫn cách trang điểm tự nhiên để có một vẻ
                    ngoài hoàn hảo trong mọi hoàn cảnh.
                </p>
            </div>
        </div>
    </section>
</main>

<!-- Footer -->
<footer>
    <jsp:include page="../layout/footer.jsp" />
</footer>
</body>
</html>
