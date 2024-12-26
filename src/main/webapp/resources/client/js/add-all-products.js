const listAllProduct = document.querySelector(".list-all-product");
// Thêm toàn bộ sản phẩm vào danh sách
products.forEach((product) => {
  let productAllHTML = "";
  if (product.sale > 0) {
    // Nếu sản phẩm có giảm giá
    productAllHTML = `
      <div class="product">
        <a href="info-product.html?id=${product.id}">
          <div class="feature">${product.sale}%</div>
          <div class="img-product">
            <img src="${product.img}" />
            <button class="show-now">Xem ngay</button>
          </div>
          <div class="detail-product">
            <h6>${product.brand}</h6>
            <span>${product.name}</span>
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
    productAllHTML = `
        <div class="product">
          <a href="info-product.html?id=${product.id}">
            <div class="feature">${product.feature}</div>
            <div class="img-product">
              <img src="${product.img}" />
              <button class="show-now">Xem ngay</button>
            </div>
            <div class="detail-product">
              <h6>${product.brand}</h6>
              <span>${product.name}</span>
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
  listAllProduct.innerHTML += productAllHTML;
});
