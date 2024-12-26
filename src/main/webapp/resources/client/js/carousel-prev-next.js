const listHotProduct = document.querySelector(".list-hot-product");
const nextButton = document.querySelector(".next");
const prevButton = document.querySelector(".prev");

let currentPosition = 0;
const productWidth = 240; // 220px chiều rộng sản phẩm + 20px khoảng cách
const visibleProducts = 5; // Hiển thị tối đa 5 sản phẩm cùng lúc

nextButton.addEventListener("click", () => {
    const maxScroll = listHotProduct.scrollWidth - listHotProduct.clientWidth;
    currentPosition = Math.min(currentPosition + productWidth, maxScroll);
    listHotProduct.scrollTo({
        left: currentPosition,
        behavior: "smooth",
    });
});

prevButton.addEventListener("click", () => {
    currentPosition = Math.max(currentPosition - productWidth, 0);
    listHotProduct.scrollTo({
        left: currentPosition,
        behavior: "smooth",
    });
});
// document.addEventListener("DOMContentLoaded", function () {
//   const listSaleProduct = document.querySelector(".list-sale-product");
//   console.log(listSaleProduct); // Kiểm tra xem phần tử có được tìm thấy không
// });

// Bắt sự kiện cho sản phẩm sale
const listSale = document.querySelector(".list-sale-product");
const nextButtonSale = document.querySelector(".nextSale");
const prevButtonSale = document.querySelector(".prevSale");

let currentSalePosition = 0;
const saleProductWidth = 240; // 220px chiều rộng sản phẩm + 20px khoảng cách
const visibleSaleProducts = 5; // Hiển thị tối đa 5 sản phẩm cùng lúc

nextButtonSale.addEventListener("click", () => {
    const maxSaleScroll = listSale.scrollWidth - listSale.clientWidth;
    currentSalePosition = Math.min(
        currentSalePosition + saleProductWidth,
        maxSaleScroll
    );
    listSale.scrollTo({
        left: currentSalePosition,
        behavior: "smooth",
    });
});

prevButtonSale.addEventListener("click", () => {
    currentSalePosition = Math.max(currentSalePosition - saleProductWidth, 0);
    listSale.scrollTo({
        left: currentSalePosition,
        behavior: "smooth",
    });
});
