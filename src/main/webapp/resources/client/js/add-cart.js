// Lấy dữ liệu giỏ hàng từ localStorage, nếu không có thì tạo mảng rỗng
let cart = JSON.parse(localStorage.getItem("cart")) || [];

// Cập nhật số lượng trên icon giỏ hàng
function updateCartCount() {
    const cartCountBadge = document.querySelector(".cart-count-badge");
    const totalCount = cart.reduce((acc, product) => acc + product.quantity, 0);
    cartCountBadge.textContent = totalCount;
}

// Khi nhấn vào nút "Thêm vào giỏ"
document.addEventListener("click", function (e) {
    if (e.target.classList.contains("addcart")) {
        const productId = e.target.dataset.id; // Lấy productId từ nút "Thêm vào giỏ"
        const product = products.find((p) => p.id == productId); // Tìm sản phẩm từ danh sách sản phẩm bằng id

        // Kiểm tra xem sản phẩm đã có trong giỏ hàng chưa
        const existingProduct = cart.find((p) => p.id == productId);
        if (existingProduct) {
            existingProduct.quantity += 1; // Nếu có trong giỏ, tăng số lượng
        } else {
            cart.push({ ...product, quantity: 1 }); // Nếu chưa có, thêm sản phẩm vào giỏ với số lượng 1
        }

        // Lưu giỏ hàng vào localStorage
        localStorage.setItem("cart", JSON.stringify(cart));

        // Cập nhật số lượng sản phẩm trên icon giỏ hàng
        updateCartCount();
    }
});

// Cập nhật số lượng sản phẩm hiển thị ban đầu trên icon giỏ hàng
updateCartCount();

// Chuyển hướng tới trang giỏ hàng khi nhấn vào icon giỏ hàng
document.querySelector(".store a").addEventListener("click", function () {
    window.location.href = "http://127.0.0.1:5501/cart-payment.html";
});
