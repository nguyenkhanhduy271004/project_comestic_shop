// Lấy dữ liệu giỏ hàng từ localStorage
let cart = JSON.parse(localStorage.getItem("cart")) || [];

function displayCart() {
    const cartTable = document.querySelector("tbody");
    cartTable.innerHTML = ""; // Xóa dữ liệu cũ

    cart.forEach((product) => {
        // Đảm bảo rằng product.price tồn tại, nếu không, dùng giá trị mặc định là 0
        const productPrice = product.price ? product.price : 0;

        const productRow = `
              <tr data-id="${product.id}">
                <td>${product.id}</td>
                <td style="display: flex; align-items: center; justify-content: center;">
                  <div style="display: flex; align-items: center;">
                    <img style="width: 10vw; margin-right: 10px;" src="${
            product.img
        }" alt="${product.name}">
                    <span class="name">${product.name}</span>
                  </div>
                </td>
                <td>
                  <input class="quantity" style="width: 5vw; outline: none" type="number" value="${
            product.quantity
        }" min="1">
                </td>
                <td>
                  <span class="product-price">${productPrice.toLocaleString()}<sup>đ</sup></span>
                </td>
                <td class="delete-product" style="cursor: pointer">xóa</td>
              </tr>
            `;
        cartTable.innerHTML += productRow;
    });

    handleDeleteProduct();
    handleQuantityChange();
    calculateCartTotal(); // Cập nhật tổng tiền ban đầu
}

// Hiển thị giỏ hàng khi trang được tải
displayCart();

// Hàm tính tổng tiền tạm tính và tổng cộng, đồng thời hiển thị tiền giảm
function calculateCartTotal(discountAmount = 0) {
    let total = 0;
    const cartItems = document.querySelectorAll("tbody tr");

    cartItems.forEach(function (item) {
        const priceElement = item.querySelector(".product-price"); // Giá của sản phẩm
        const quantityElement = item.querySelector(".quantity"); // Số lượng
        const price = parseFloat(
            priceElement.innerText.replace(/\./g, "").replace("đ", "")
        );
        const quantity = parseInt(quantityElement.value);

        total += price * quantity; // Tính tổng tiền
    });

    // Tính tiền giảm nếu có mã giảm giá
    const discountValue = total * discountAmount;

    // Cập nhật giá tạm tính, tiền giảm và giá chính thức
    document.querySelector(".temporary-price").innerText =
        total.toLocaleString("de-DE") + "đ";
    document.querySelector(".discount-price").innerText =
        discountValue.toLocaleString("de-DE") + "đ"; // Hiển thị tiền giảm
    document.querySelector(".offical-price").innerText =
        (total - discountValue).toLocaleString("de-DE") + "đ"; // Tổng cộng sau khi áp dụng giảm giá
}

// Hàm xử lý khi thay đổi số lượng sản phẩm
function handleQuantityChange() {
    const quantityInputs = document.querySelectorAll(
        "tbody input[type='number']"
    );

    quantityInputs.forEach(function (input) {
        input.addEventListener("input", function () {
            if (input.value < 1) {
                input.value = 1; // Đảm bảo số lượng tối thiểu là 1
            }
            const row = input.closest("tr");
            const productId = parseInt(row.dataset.id);
            const product = cart.find((p) => p.id === productId);
            product.quantity = parseInt(input.value);

            localStorage.setItem("cart", JSON.stringify(cart)); // Cập nhật giỏ hàng
            calculateCartTotal(); // Cập nhật tổng tiền khi thay đổi số lượng
        });
    });
}

// Hàm xử lý khi xóa sản phẩm
function handleDeleteProduct() {
    const deleteButtons = document.querySelectorAll(".delete-product");

    deleteButtons.forEach(function (button) {
        button.addEventListener("click", function () {
            const row = button.closest("tr"); // Lấy dòng chứa sản phẩm
            const productId = parseInt(row.dataset.id);

            // Xóa sản phẩm khỏi giỏ hàng
            cart = cart.filter((product) => product.id !== productId);

            // Cập nhật lại localStorage
            localStorage.setItem("cart", JSON.stringify(cart));

            // Xóa sản phẩm khỏi giao diện
            row.remove();

            // Cập nhật tổng tiền và số lượng sản phẩm
            calculateCartTotal();
        });
    });
}

// Hàm xử lý khi áp dụng mã giảm giá
function applyDiscount() {
    const discountInput = document.querySelector("input[placeholder='Nhập mã']");
    const discountCode = discountInput.value.trim();
    let discountAmount = 0; // Mặc định không giảm giá

    // Danh sách mã giảm giá hợp lệ và tỷ lệ giảm giá tương ứng
    const discountCodes = {
        DISCOUNT10: 0.1, // Giảm 10%
        DISCOUNT20: 0.2, // Giảm 20%
        DISCOUNT30: 0.3, // Giảm 30%
    };

    // Kiểm tra mã giảm giá có trong danh sách hay không
    if (discountCodes.hasOwnProperty(discountCode)) {
        discountAmount = discountCodes[discountCode]; // Áp dụng mức giảm giá
    } else if (discountCode !== "") {
        alert("Mã giảm giá không hợp lệ."); // Thông báo nếu mã giảm giá không đúng
    }

    // Tính lại tổng tiền và hiển thị tiền giảm cho đơn hàng
    calculateCartTotal(discountAmount);
}

// Lắng nghe sự kiện khi nhấn nút "Apply"
document
    .querySelector("button[type='submit']")
    .addEventListener("click", function (event) {
        event.preventDefault(); // Ngăn chặn hành động submit form mặc định
        applyDiscount(); // Gọi hàm áp dụng mã giảm giá
    });
