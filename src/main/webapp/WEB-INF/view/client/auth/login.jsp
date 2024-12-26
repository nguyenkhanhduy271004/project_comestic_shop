<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>Login - Cosmeticshop</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="bg-primary">
                <div id="layoutAuthentication">
                    <div id="layoutAuthentication_content">
                        <main>
                            <div class="container">
                                <div class="row justify-content-center">
                                    <div class="col-lg-5">
                                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                                            <div class="card-header">
                                                <h3 class="text-center font-weight-light my-4">Login</h3>
                                            </div>
                                            <div class="card-body">
                                                <form method="post" action="/login">
                                                    <c:if test="${param.error != null}">
                                                        <div class="my-2" style="color: red;">Invalid email or password.
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${param.logout != null}">
                                                        <div class="my-2" style="color: green;">Logout success.
                                                        </div>
                                                    </c:if>

                                                    <div class="form-floating mb-3">
                                                        <input class="form-control" type="email"
                                                            placeholder="name@example.com" name="username" />
                                                        <label>Email address</label>
                                                    </div>
                                                    <div class="form-floating mb-3">
                                                        <input class="form-control" type="password"
                                                            placeholder="Password" name="password" />
                                                        <label>Password</label>
                                                    </div>
                                                    <div>
                                                        <input type="hidden" name="${_csrf.parameterName}"
                                                            value="${_csrf.token}" />

                                                    </div>

                                                    <div class="mt-4 mb-0">
                                                        <div class="d-grid">
                                                            <button class="btn btn-primary btn-block">
                                                                Login
                                                            </button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="card-footer text-center py-3 d-flex justify-content-between">
                                                <div class="small"><a href="/register">Need an account? Sign up!</a>
                                                </div>
                                                <div class="small"><a href="/forgot-password">Forgot password</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </main>
                    </div>

                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>
            </body>
            <!-- <%--<head>--%>
<%--    <meta charset="UTF-8" />--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0" />--%>
<%--    <title>Document</title>--%>
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login-register.css" />--%>
<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="container" id="container">--%>
<%--    <div class="form-container register-container">--%>
<%--        <!-- Register Form -->--%>
            <%-- <form action="${pageContext.request.contextPath}/register" method="post">--%>
                <%-- <h1>Register here.</h1>--%>
                    <%-- <input type="text" name="name" placeholder="Name" required />--%>
                    <%-- <input type="email" name="email" placeholder="Email" required />--%>
                    <%-- <input type="password" name="password" placeholder="Password" required />--%>
                    <%-- <input type="password" name="re-enterpassword" placeholder="Re-EnterPassword" required />--%>
                    <%-- <button type="submit">Register</button>--%>
                        <%-- <span>or use your account</span>--%>
                            <%-- <div class="social-container">--%>
                                <%-- <a href="#" class="social"><i class="fa-brands fa-facebook-f"></i></a>--%>
                                    <%-- <a href="#" class="social"><i class="fa-brands fa-google"></i></a>--%>
                                        <%-- <a href="#" class="social"><i class="fa-brands fa-linkedin-in"></i></a>--%>
                                            <%-- </div>--%>
                                                <%-- </form>--%>
                                                    <%-- </div>--%>

                                                        <%-- <div class="form-container login-container">--%>
                                                            <%-- <!-- Login Form -->--%>
                                                                <%-- <form
                                                                    action="${pageContext.request.contextPath}/login"
                                                                    method="post">--%>
                                                                    <%-- <h1>Login here.</h1>--%>
                                                                        <%-- <input type="email" name="email"
                                                                            placeholder="Email" required />--%>
                                                                        <%-- <input type="password" name="password"
                                                                            placeholder="Password" required />--%>
                                                                        <%-- <div class="content">--%>
                                                                            <%-- <div class="checkbox">--%>
                                                                                <%-- <input type="checkbox"
                                                                                    name="rememberMe"
                                                                                    id="checkbox" />--%>
                                                                                <%-- <label for="checkbox">Remember
                                                                                    me</label>--%>
                                                                                    <%-- </div>--%>
                                                                                        <%-- <div class="pass-link">--%>
                                                                                            <%-- <a
                                                                                                href="${pageContext.request.contextPath}/forgot-password">Forgot
                                                                                                password?</a>--%>
                                                                                                <%-- </div>--%>
                                                                                                    <%-- </div>--%>
                                                                                                        <%-- <button
                                                                                                            type="submit">Login</button>--%>
                                                                                                            <%-- <span>or
                                                                                                                use your
                                                                                                                account</span>--%>
                                                                                                                <%-- <div
                                                                                                                    class="social-container">--%>
                                                                                                                    <%-- <a
                                                                                                                        href="#"
                                                                                                                        class="social"><i
                                                                                                                            class="fa-brands fa-facebook-f"></i></a>--%>
                                                                                                                        <%-- <a
                                                                                                                            href="#"
                                                                                                                            class="social"><i
                                                                                                                                class="fa-brands fa-google"></i></a>--%>
                                                                                                                            <%-- <a
                                                                                                                                href="#"
                                                                                                                                class="social"><i
                                                                                                                                    class="fa-brands fa-linkedin-in"></i></a>--%>
                                                                                                                                <%--
                                                                                                                                    </div>--%>
                                                                                                                                    <%--
                                                                                                                                        </form>--%>
                                                                                                                                        <%--
                                                                                                                                            </div>--%>

                                                                                                                                            <%-- <div
                                                                                                                                                class="overlay-container">--%>
                                                                                                                                                <%-- <div
                                                                                                                                                    class="overlay">--%>
                                                                                                                                                    <%-- <div
                                                                                                                                                        class="overlay-panel overlay-left">--%>
                                                                                                                                                        <%-- <h1
                                                                                                                                                            class="title">Hello
                                                                                                                                                            <br />friends
                                                                                                                                                            </h1>
                                                                                                                                                            --%>
                                                                                                                                                            <%--
                                                                                                                                                                <p>If
                                                                                                                                                                you
                                                                                                                                                                have
                                                                                                                                                                an
                                                                                                                                                                account,
                                                                                                                                                                login
                                                                                                                                                                here
                                                                                                                                                                and
                                                                                                                                                                have
                                                                                                                                                                fun
                                                                                                                                                                </p>
                                                                                                                                                                --%>
                                                                                                                                                                <%-- <button
                                                                                                                                                                    class="ghost"
                                                                                                                                                                    id="login">Login</button>--%>
                                                                                                                                                                    <%--
                                                                                                                                                                        </div>--%>
                                                                                                                                                                        <%-- <div
                                                                                                                                                                            class="overlay-panel overlay-right">--%>
                                                                                                                                                                            <%-- <h1
                                                                                                                                                                                class="title">Start
                                                                                                                                                                                your
                                                                                                                                                                                <br />journey
                                                                                                                                                                                now
                                                                                                                                                                                </h1>
                                                                                                                                                                                --%>
                                                                                                                                                                                <%--
                                                                                                                                                                                    <p>If
                                                                                                                                                                                    you
                                                                                                                                                                                    don't
                                                                                                                                                                                    have
                                                                                                                                                                                    an
                                                                                                                                                                                    account
                                                                                                                                                                                    yet,
                                                                                                                                                                                    join
                                                                                                                                                                                    us
                                                                                                                                                                                    and
                                                                                                                                                                                    start
                                                                                                                                                                                    your
                                                                                                                                                                                    journey.
                                                                                                                                                                                    </p>
                                                                                                                                                                                    --%>
                                                                                                                                                                                    <%-- <button
                                                                                                                                                                                        class="ghost"
                                                                                                                                                                                        id="register">Register</button>--%>
                                                                                                                                                                                        <%--
                                                                                                                                                                                            </div>--%>
                                                                                                                                                                                            <%--
                                                                                                                                                                                                </div>--%>
                                                                                                                                                                                                <%--
                                                                                                                                                                                                    </div>--%>
                                                                                                                                                                                                    <%--<
                                                                                                                                                                                                        /div>--%>
                                                                                                                                                                                                        <%--<script
                                                                                                                                                                                                            src="${pageContext.request.contextPath}/client/js/convert-login-register.js">
                                                                                                                                                                                                            </script>
                                                                                                                                                                                                            --%>
                                                                                                                                                                                                            </body>
                                                                                                                                                                                                            -->

            </html>