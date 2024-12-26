const products = [
  {
    id: 1,
    img: "/client/img/img-hot-product/AHC/Bộ Sản Phẩm Chống Lão Hóa Da AHC Youthful Skin Starter Kit (4Pc).webp",
    feature: "New",
    brand: "AHC",
    name: "Bộ Sản Phẩm Chống Lão Hóa Da AHC Youthful Skin Starter Kit (4Pc)",
    price: 420000,
    rating: 4,
    count: 26,
    sale: 20,
  },
  {
    id: 2,
    img: "/client/img/img-hot-product/AHC/Kem Dưỡng Da AHC Ampoule Directory PHA Mattifying Gel Cream 30ml.webp",
    feature: "New",
    brand: "AHC",
    name: "Kem Dưỡng Da AHC Ampoule Directory PHA Mattifying Gel Cream 30ml.webp",
    price: 330000,
    rating: 5,
    count: 3,
    sale: 30,
  },
  {
    id: 3,
    img: "/client/img/img-hot-product/AHC/Tinh Chất AHC Dưỡng Chuyên Sâu Dạng Viên Youth Focus Intensive Night Capsule Serum (30 capsules).webp",
    feature: "New",
    brand: "AHC",
    name: "Tinh Chất AHC Dưỡng Chuyên Sâu Dạng Viên Youth Focus Intensive Night Capsule Serum (30 capsules)",
    price: 295000,
    rating: 3,
    count: 4,
    sale: 20,
  },
  {
    id: 4,
    img: "/client/img/img-hot-product/BEPLAIN/Mặt Nạ Đất Sét Beplain Từ Đậu Xanh Hỗ Trợ Thải Độc Da Giảm Mụn Đầu Đen Mung Bean Pore Clay Mask 120ml.webp",
    feature: "New",
    brand: "BEPLAIN",
    name: "Mặt Nạ Đất Sét Beplain Từ Đậu Xanh Hỗ Trợ Thải Độc Da Giảm Mụn Đầu Đen Mung Bean Pore Clay Mask 120ml",
    price: 600000,
    rating: 5,
    count: 5,
    sale: 0,
  },
  {
    id: 5,
    img: "/client/img/img-hot-product/BANILA CO/(Phiên bản Vegan) Sáp Tẩy Trang Thuần Chay Banila Co Cho Da Khô Clean it Zero Nourishing Cleansing Balm 100ml.webp",
    feature: "New",
    brand: "BANILA CO",
    name: "(Phiên bản Vegan) Sáp Tẩy Trang Thuần Chay Banila Co Cho Da Khô Clean it Zero Nourishing Cleansing Balm 100ml",
    price: 600000,
    rating: 4,
    count: 6,
    sale: 0,
  },
  {
    id: 6,
    img: "/client/img/img-hot-product/BANILA CO/(Phiên bản Vegan) Sáp Tẩy Trang Thuần Chay Banila Co Cho Da Nhạy Cảm Clean it Zero Calming Cleansing Balm 100ml.webp",
    feature: "New",
    brand: "BANILA CO",
    name: "(Phiên bản Vegan) Sáp Tẩy Trang Thuần Chay Banila Co Cho Da Nhạy Cảm Clean it Zero Calming Cleansing Balm 100ml",
    price: 600000,
    rating: 5,
    count: 16,
    sale: 20,
  },
  {
    id: 7,
    img: "/client/img/img-hot-product/BANILA CO/(Phiên bản Vegan) Sáp Tẩy Trang Thuần Chay Banila Co Cho Mọi Loại Da Clean it Zero Original Cleansing Balm.webp",
    feature: "New",
    brand: "BANILA CO",
    name: "(Phiên bản Vegan) Sáp Tẩy Trang Thuần Chay Banila Co Cho Mọi Loại Da Clean it Zero Original Cleansing Balm",
    price: 600000,
    rating: 5,
    count: 29,
    sale: 0,
  },
  {
    id: 8,
    img: "/client/img/img-hot-product/BANILA CO/Sáp Tẩy Trang Thuần Chay Banila Co Cho Da Lỗ Chân Lông To Clean it Zero Pore Clarifying Cleansing Balm.webp",
    feature: "New",
    brand: "BANILA CO",
    name: "Sáp Tẩy Trang Thuần Chay Banila Co Cho Da Lỗ Chân Lông To Clean it Zero Pore Clarifying Cleansing Balm",
    price: 600000,
    rating: 5,
    count: 30,
    sale: 0,
  },
  {
    id: 9,
    img: "/client/img/img-hot-product/CLUB CLIO/Kem Nền Bóng Mượt Clio Kill Cover Glow Foundation Spf50+ Pa++++ 38G.webp",
    feature: "New",
    brand: "CLUB CLIO",
    name: "Kem Nền Bóng Mượt Clio Kill Cover Glow Foundation Spf50+ Pa++++",
    price: 600000,
    rating: 5,
    count: 67,
    sale: 0,
  },
  {
    id: 10,
    img: "/client/img/img-hot-product/CLUB CLIO/Kem Nền Che Khuyết Điểm Clio Kill Cover Founwear Foundation SPF30 PA+++ 38g.webp",
    feature: "New",
    brand: "CLUB CLIO",
    name: "Kem Nền Che Khuyết Điểm Clio Kill Cover Founwear Foundation SPF30 PA+++",
    price: 600000,
    rating: 5,
    count: 55,
    sale: 0,
  },
  {
    id: 11,
    img: "/client/img/img-hot-product/CLUB CLIO/Kem Nền Căng Mướt Da Dear Dahlia Skin Paradise Sheer Silk Foundation 30Ml.webp",
    feature: "New",
    brand: "CLUB CLIO",
    name: "Kem Nền Căng Mướt Da Dear Dahlia Skin Paradise Sheer Silk Foundation 30Ml",
    price: 600000,
    rating: 5,
    count: 99,
    sale: 10,
  },
  {
    id: 12,
    img: "/client/img/img-hot-product/DEAR DAHLIA/Bảng Màu Mắt 4 Ô Dear Dahlia Dream Velvet Eyeshadow Palette 5.1g.webp",
    feature: "New",
    brand: "DEAR DAHLIA",
    name: "Bảng Màu Mắt 4 Ô Dear Dahlia Dream Velvet Eyeshadow Palette 5.1g",
    price: 600000,
    rating: 5,
    count: 12,
    sale: 15,
  },
  {
    id: 13,
    img: "/client/img/img-hot-product/DEAR DAHLIA/Son Thỏi Hiệu Ứng Lì Mịn Dear Dahlia Lip Paradise Effortless Matte Lipstick (3,2G).webp",
    feature: "New",
    brand: "DEAR DAHLIA",
    name: "Son Thỏi Hiệu Ứng Lì Mịn Dear Dahlia Lip Paradise Effortless Matte Lipstick (3,2G) ",
    price: 600000,
    rating: 5,
    count: 34,
    sale: 0,
  },
  // Thêm các sản phẩm khác...
];

// Lưu danh sách sản phẩm vào localStorage
localStorage.setItem("products", JSON.stringify(products));

//Lọc sản phẩm bán chạy (10 sản phẩm có số lượng bạn lớn nhất)
const listProductHot = products.sort((a, b) => b.count - a.count).slice(0, 10);
// Các sản phẩm bán chạy
const productContainer = document.querySelector(".list-hot-product");
listProductHot.forEach((product) => {
  let productHotHTML = "";
  if (product.sale > 0) {
    // Nếu sản phẩm có giảm giá
    productHotHTML = `
        <div class="product">
          <a href="info-product.html?id=${product.id}">
            <div class="feature">${product.sale}%</div>
            <div class="img-product">
              <img src="${product.img}" />
              <button class="show-now">Xem ngay</button>
            </div>
            <div class="detail-product">
              <h6>${product.brand}</h6>
              <div>
                <span>${product.name}</span>
              </div>
              <div class="price">
                <span class="old-price" style="text-decoration: line-through;">${product.price.toLocaleString()}<sup>đ</sup></span>
                <span class="official-price">${(
        product.price -
        (product.price * product.sale) / 100
      ).toLocaleString()}<sup>đ</sup></span>
              </div>
              <div>
                <ul class="star-rating ${product.rating}-star">
                  ${'<li><a href="#">&#9733;</a></li>'.repeat(product.rating)}
                  <span class="product-count">(${product.count})</span>
                </ul>
              </div>
            </div>
            <button class="addcart" data-id="${product.id
      }">Thêm vào giỏ</button>
          </a>
        </div>
      `;
  } else {
    // Các sản phẩm còn lại
    productHotHTML = `
        <div class="product">
          <a href="info-product.html?id=${product.id}">
            <div class="feature">${product.feature}</div>
            <div class="img-product">
              <img src="${product.img}" />
              <button class="show-now">Xem ngay</button>
            </div>
            <div class="detail-product">
              <h6>${product.brand}</h6>
              <div>
                <span>${product.name}</span>
              </div>
              <div class="price">
                <span class="old-price">${product.price.toLocaleString()}<sup>đ</sup></span>
              </div>
              <div>
                <ul class="star-rating ${product.rating}-star">
                  ${'<li><a href="#">&#9733;</a></li>'.repeat(product.rating)}
                  <span class="product-count">(${product.count})</span>
                </ul>
              </div>
            </div>
            <button class="addcart" data-id="${product.id
      }">Thêm vào giỏ</button>
          </a>
        </div>
      `;
  }
  // // Gán HTML sản phẩm vào container
  productContainer.innerHTML += productHotHTML;
});

//  lọc sản phẩm sale
const listSaleProduct = products.filter((product) => product.sale > 0);
const productSale = document.querySelector(".list-sale-product");
listSaleProduct.forEach((product) => {
  const productSaleHTML = `
    <div class="product">
      <a href="info-product.html?id=${product.id}">
      <div class="feature">${product.sale}%</div>
        <div class="img-product">
          <img src="${product.img}" />
          <button class="show-now">Xem ngay</button>
        </div>
        <div class="detail-product">
          <h6>${product.brand}</h6>
          <div>
                <span>${product.name}</span>
              </div>
          <div class="price">
            <span class="old-price" style=" text-decoration: line-through;">${product.price.toLocaleString()}<sup>đ</sup></span>
            <span class="official-price">${(
      product.price -
      (product.price * product.sale) / 100
    ).toLocaleString()}<sup>đ</sup></span>
          </div>
          <div>
            <ul class="star-rating ${product.rating}-star">
              ${'<li><a href="#">&#9733;</a></li>'.repeat(product.rating)}
              <span class="product-count">(${product.count})</span>
            </ul>
          </div>
        </div>
        <button class="addcart" data-id="${product.id
    }">Thêm vào giỏ</button>
      </a>
    </div>
  `;
  productSale.innerHTML += productSaleHTML;
});
