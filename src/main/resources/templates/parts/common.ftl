<#import "security.ftl" as security>
<#macro c reg>
    <!DOCTYPE html>
    <html lang="ru/"
          style="--bs-primary: #63b175;--bs-primary-rgb: 99,177,117;--bs-secondary: #ffffff;--bs-secondary-rgb: 255,255,255;--bs-dark: #4E9365;--bs-dark-rgb: 78,147,101;">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Greenery</title>
        <link rel="apple-touch-icon" sizes="180x180" href="http://127.0.0.1:8080/assets/favicon_io/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="http://127.0.0.1:8080/assets/favicon_io/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="http://127.0.0.1:8080/assets/favicon_io/favicon-16x16.png">
        <link rel="manifest" href="http://127.0.0.1:8080/assets/favicon_io/site.webmanifest">

        <link rel="stylesheet" href="http://127.0.0.1:8080/assets/bootstrap/css/bootstrap.min.css">
        <#--        <link rel="stylesheet" href="https://cdn.reflowhq.com/v1/toolkit.min.css">-->
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css?family=Inter:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&amp;display=swap">
        <link rel="stylesheet" href="http://127.0.0.1:8080/assets/fonts/fontawesome-all.min.css">
        <link rel="stylesheet"
              href="http://127.0.0.1:8080/assets/css/-Fixed-Navbar-start-with-transparency-background-BS4--transparency-menu.css">
        <link rel="stylesheet" href="http://127.0.0.1:8080/assets/css/Articles-Cards-images.css">
        <link rel="stylesheet" href="http://127.0.0.1:8080/assets/css/canito-detalle-producto.css">
        <link rel="stylesheet" href="http://127.0.0.1:8080/assets/css/Features-Image-icons.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/6.4.8/swiper-bundle.min.css">
        <link rel="stylesheet" href="http://127.0.0.1:8080/assets/css/mystyle.css">
        <link rel="stylesheet" href="http://127.0.0.1:8080/assets/css/mystylebutton.css">
        <link rel="stylesheet" href="http://127.0.0.1:8080/assets/css/Simple-Slider-Simple-Slider.css">
    </head>

    <body style="/*background: url(&quot;design.jpg&quot;);*/background-position: 0 -60px;--bs-primary: #63b175;--bs-primary-rgb: 99,177,117;--bs-secondary: #fff;--bs-secondary-rgb: 255,255,255;--bs-success: #63b175;--bs-success-rgb: 99,177,117;--bs-dark: #525E74;--bs-dark-rgb: 82,94,116;">
    <@navbar reg=reg/>
    <#nested >
    <@footer/>

    <script src="http://127.0.0.1:8080/assets/js/jquery.min.js"></script>
    <script src="http://127.0.0.1:8080/assets/bootstrap/js/bootstrap.min.js"></script>
    <#--    <script src="https://cdn.reflowhq.com/v1/toolkit.min.js"></script>-->
    <script src="http://127.0.0.1:8080/assets/js/bs-init.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
    <script src="http://127.0.0.1:8080/assets/js/-Fixed-Navbar-start-with-transparency-background-BS4-.js"></script>
    <script src="http://127.0.0.1:8080/assets/js/bold-and-bright.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/6.4.8/swiper-bundle.min.js"></script>
    <script src="http://127.0.0.1:8080/assets/js/intslider.js"></script>
    <script src="http://127.0.0.1:8080/assets/js/profile.js"></script>
    <script src="http://127.0.0.1:8080/assets/js/phoneScript.js"></script>
    <script src="http://127.0.0.1:8080/assets/js/Simple-Slider.js"></script>
    <script src="http://127.0.0.1:8080/assets/js/cart.js"></script>

    </body>

    </html>
</#macro>

<#macro footer>
    <footer class="bg-primary-gradient" style="background: #ffffff;">
        <div class="container py-4 py-lg-5">
            <hr>
            <div class="text-muted d-flex justify-content-between align-items-center pt-3">
                <p class="mb-0">Copyright © 2022 Greenery</p>
                <ul class="list-inline mb-0">
                    <li class="list-inline-item">
                        <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor"
                             viewBox="0 0 16 16" class="bi bi-facebook">
                            <path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z"></path>
                        </svg>
                    </li>
                    <li class="list-inline-item">
                        <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor"
                             viewBox="0 0 16 16" class="bi bi-twitter">
                            <path d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334 0-.14 0-.282-.006-.422A6.685 6.685 0 0 0 16 3.542a6.658 6.658 0 0 1-1.889.518 3.301 3.301 0 0 0 1.447-1.817 6.533 6.533 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.325 9.325 0 0 1-6.767-3.429 3.289 3.289 0 0 0 1.018 4.382A3.323 3.323 0 0 1 .64 6.575v.045a3.288 3.288 0 0 0 2.632 3.218 3.203 3.203 0 0 1-.865.115 3.23 3.23 0 0 1-.614-.057 3.283 3.283 0 0 0 3.067 2.277A6.588 6.588 0 0 1 .78 13.58a6.32 6.32 0 0 1-.78-.045A9.344 9.344 0 0 0 5.026 15z"></path>
                        </svg>
                    </li>
                    <li class="list-inline-item">
                        <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor"
                             viewBox="0 0 16 16" class="bi bi-instagram">
                            <path d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z"></path>
                        </svg>
                    </li>
                </ul>
            </div>
        </div>
    </footer>

</#macro>
<#macro navbar reg>

    <nav class="navbar navbar-light navbar-expand-md fixed-top navbar-shrink py-3" id="mainNav"
         style="background: var(--bs-primary);--bs-primary: #63b175;--bs-primary-rgb: 99,177,117;--bs-secondary: #ffffff;--bs-secondary-rgb: 255,255,255;">
        <div class="container"><a class="navbar-brand d-flex align-items-center" href="/"><span
                        class="bs-icon-sm bs-icon-circle bs-icon-primary shadow d-flex justify-content-center align-items-center me-2 bs-icon"
                        style="background: var(--bs-gray-400);width: 40px;height: 40px;"><svg
                            xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24"
                            stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round"
                            stroke-linejoin="round" class="icon icon-tabler icon-tabler-plant"
                            style="color: var(--bs-primary);border-color: var(--bs-primary);font-size: 28px;">
                        <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                        <path d="M7 15h10v4a2 2 0 0 1 -2 2h-6a2 2 0 0 1 -2 -2v-4z"></path>
                        <path d="M12 9a6 6 0 0 0 -6 -6h-3v2a6 6 0 0 0 6 6h3"></path>
                        <path d="M12 11a6 6 0 0 1 6 -6h3v1a6 6 0 0 1 -6 6h-3"></path>
                        <line x1="12" y1="15" x2="12" y2="9"></line>
                    </svg></span><span style="color: var(--bs-secondary);font-size: 25px;">Greenery</span></a>
            <button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1"><span
                        class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navcol-1" style="margin-right: 0;">
                <ul class="navbar-nav mx-auto">
                    <li class="nav-item"><a class="nav-link link-secondary" href="/index"
                                            style="color: var(--bs-secondary);font-size: 20px;">Домой</a></li>
                    <li class="nav-item"></li>
                    <li class="nav-item"><a class="nav-link" href="/products"
                                            style="color: var(--bs-secondary);font-size: 20px;--bs-primary: #63b175;--bs-primary-rgb: 99,177,117;">Товары</a>
                    </li>
                    <#if security.known>
                        <li class="nav-item"><a class="nav-link" href="/cart"
                                                style="color: var(--bs-secondary);font-size: 20px;">Корзина</a>
                        </li></#if>
                    <#if security.admin>
                        <li class="nav-item"><a class="nav-link" href="/product-add"
                                                style="color: var(--bs-secondary);font-size: 20px;">Добавить продукт</a>
                        </li></#if>
                    <li class="nav-item"></li>
                </ul>

                <#if security.known>
                    <#if reg?matches("prof")>
                        <form action="/logout" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <input type="submit"
                                   class="btn btn-primary shadow"
                                   role="button" style="background: #4E9359;border-style: none;" value="Выйти"/>
                        </form>
                    <#else >
                        <a class="btn btn-primary shadow" role="button" href="/profile"
                           style="background: #4E9359;border-style: none;">Мой профиль</a>
                    </#if>
                <#else >
                    <#if reg?matches("reg")>
                        <a class="btn btn-primary shadow" role="button" href="/signup"
                           style="background: #4E9359;border-style: none;">Зарегистрироваться</a>
                    <#else >
                        <a class="btn btn-primary shadow" role="button" href="/login"
                           style="background: #4E9359;border-style: none;">Войти</a>
                    </#if>
                </#if>

            </div>
        </div>
    </nav>
</#macro>
<#macro csrf>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
</#macro>