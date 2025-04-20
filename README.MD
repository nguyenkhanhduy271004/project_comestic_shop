# README for CosmeticShop Web Application (Spring MVC, JPA, JSP, Bootstrap)

## Overview
The **CosmeticShop** is an e-commerce platform for cosmetics, built with Spring MVC, Spring JPA, JSP, and Bootstrap. It supports multiple roles such as **Guest**, **User**, **Vendor (Seller)**, **Admin**, and **Shipper**. The application offers functionality for product search and filtering, user registration with email OTP verification, login, password recovery, product management, order tracking, payment integration, and more.

## Tech Stack
- **Backend**: Spring MVC, Spring JPA, Spring Security (for Spring Boot)
- **Frontend**: JSP, Bootstrap
- **Database**: MySQL (or any JPA-compatible database)
- **Authentication**: Spring Security (for Spring Boot), OTP via Email
- **Payment Gateway**: VNPAY, MOMO, COD
- **Others**: JavaMailSender (for OTP email)

## Features

### Common Features:
- **Product Search & Filter**: Users can search for products by name, price, category, and rating. Filters include categories, price range, and ratings.
- **User Registration & OTP Verification**: Users can register an account. After registration, an OTP is sent via email for account activation.
- **Login/Logout**: Users can log in using their registered email and password. The password is securely hashed.
- **Password Recovery with OTP**: Users can reset their password via email OTP verification.

### Guest Features:
- **Home Page**: Displays the top 10 products from various shops, sorted from highest to lowest in price or rating.
- **Product Browsing**: Visitors can browse product categories and view detailed information about each product.

### User Features:
- **Homepage**: Displays featured products, including new arrivals, bestsellers, highly rated, and favorites.
- **Pagination/Lazy Loading**: Products are displayed with pagination or lazy loading (20 per page).
- **Profile Management**: Users can manage their profile and shipping addresses.
- **Product Details Page**: Detailed information about products, including reviews, ratings, and availability.
- **Shopping Cart**: Cart is saved to the database. Users can add, remove, or update the quantity of items.
- **Order Management**: Users can place orders, track order statuses (new, confirmed, in transit, delivered, canceled, or returned).
- **Discount Codes**: Users can apply discount codes during checkout.
- **Wishlist & Recently Viewed Products**: Users can add products to their wishlist and view recently viewed products.
- **Review & Rating**: After purchase, users can leave product reviews and ratings, including text and images (minimum 50 characters for text).

### Vendor (Seller) Features:
- **Shop Registration**: Vendors can register a shop to sell products.
- **Shop Dashboard**: Manage the shop’s homepage, including featured products, banners, and promotions.
- **Product Management**: Add, edit, and delete products. Manage inventory, pricing, and product details.
- **Order Management**: View and manage orders for the shop, including statuses like new, confirmed, shipped, delivered, canceled, or returned.
- **Promotions & Discounts**: Vendors can create and manage promotional campaigns, including product discounts and free shipping.
- **Sales Analytics**: Track shop sales, revenue, and product performance.

### Admin Features:
- **User Management**: Admins can search and manage users (suspend, delete, or edit user details).
- **Product Management**: Admins can manage products across all vendors and assign categories.
- **Category Management**: Admins can manage product categories.
- **Discount & Commission Management**: Admins can manage the app's discount and commission structure for vendors.
- **Shipping Management**: Admins can manage shipping partners, shipping fees, and integrations.

### Shipper (Additional Role):
- **Order Assignment**: Shippers can view and manage orders assigned to them for delivery.
- **Order Statistics**: Shippers can track the delivery status and performance of assigned orders.

## Requirements
- **JDK**: Java 8 or higher
- **Maven**: For dependency management and project build.
- **MySQL Database** (or any compatible database)
- **Spring Framework** (Spring MVC, Spring JPA, Spring Security)
- **MailSender**: For OTP email sending functionality
- **Payment Integration**: VNPAY, MOMO (for online payment methods)

## Setting Up the Project

### Step 1: Clone the Repository
Clone the repository from GitHub to your local machine.

git clone https://github.com/nguyenkhanhduy271004/web-final

### Step 2: Configure Database
Create a MySQL database for the project.  
Configure the application.properties or application.yml file with your database credentials.

spring.datasource.url=jdbc:mysql://localhost:3306/cosmeticshop
spring.datasource.username=root
spring.datasource.password=123456
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true

### Step 3: Build the Project
Navigate to the project directory and build the project using Maven.

mvn clean install


### Step 4: Run the Application
Run the application via the Spring Boot Maven plugin or by running the main class.

mvn spring-boot:run

For Spring MVC without Spring Boot:

mvn tomcat7:run

### Step 5: Access the Application
Once the server is running, you can access the application in your browser.

http://localhost:8080

## Database Schema
Here is the basic structure for the CosmeticShop application:

### Tables:
- **Users**: Stores user information such as name, email, password (hashed), role (guest, user, vendor, admin), and OTP details.
- **Products**: Stores product information such as name, description, price, stock, and associated shop.
- **Orders**: Stores order details, including order status (new, confirmed, shipped, delivered, canceled, or returned).
- **Categories**: Stores product categories.
- **Reviews**: Stores product reviews and ratings.
- **Discounts**: Stores discount codes and campaigns.
- **Shops**: Stores vendor shops information (name, address, etc.).
- **Shipping Partners**: Stores information about shipping providers and fees.

## API Endpoints

### Authentication & Authorization
- **POST /api/auth/register**: Register a new user and send OTP to email.
- **POST /api/auth/login**: Login with email and password.
- **POST /api/auth/forgot-password**: Send OTP for password recovery.
- **POST /api/auth/verify-otp**: Verify OTP for account or password recovery.

### Products
- **GET /api/products**: Fetch products (with pagination).
- **GET /api/products/{id}**: Fetch product details by ID.
- **GET /api/products/search**: Search products by name, category, price range, etc.

### Orders
- **POST /api/orders**: Place an order (user).
- **GET /api/orders**: View orders (user/vendor/admin).
- **PUT /api/orders/{id}/status**: Update order status (vendor/admin).
- **GET /api/orders/{id}**: View specific order details.

### Cart & Checkout
- **GET /api/cart**: View cart (user).
- **POST /api/cart**: Add items to the cart (user).
- **DELETE /api/cart/{id}**: Remove item from the cart (user).
- **POST /api/checkout**: Proceed with checkout (user).

### Vendor Features
- **POST /api/vendor/shop**: Register a new shop.
- **POST /api/vendor/product**: Add a new product.
- **GET /api/vendor/orders**: View vendor’s orders.

## How to Run Tests
The project includes unit tests for the core features. To run the tests, use the following Maven command:

mvn test

Tests are located in the `src/test/java` directory.

## Contributing
We welcome contributions to CosmeticShop! To contribute, please follow these steps:

1. Fork the repository.
2. Create a feature branch (`git checkout -b feature-name`).
3. Commit your changes (`git commit -am 'Add new feature'`).
4. Push to the branch (`git push origin feature-name`).
5. Submit a pull request.

## License
This project is licensed under the MIT License - see the LICENSE file for details.

## Conclusion
This CosmeticShop platform is a full-fledged e-commerce solution built using modern Java technologies. It provides a rich set of features for both users and vendors, with an intuitive interface for easy management of products, orders, and payments. If you have any questions or need help setting up the project, feel free to open an issue on GitHub.

Happy coding!
