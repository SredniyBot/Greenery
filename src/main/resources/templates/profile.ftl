<#import "parts/common.ftl" as c>
<@c.c "prof">
    <section class="position-relative py-4 py-xl-5" style="margin-bottom: -80px;margin-top: 40px;">
        <div class="container position-relative">
            <div class="row d-flex justify-content-center" style="margin-bottom: -60px;">
                <div class="col-md-8 col-lg-6 col-xl-5 col-xxl-4">
                    <div class="card" style="margin-bottom: 0px;">
                        <div class="card-body p-sm-5">
                            <h3 class="fw-bold text-center" data-aos="fade" style="margin: 35px;">Мой профиль</h3>
                            <form method="post" action="/profile/phoneChange">
                                <input type="hidden" name="_csrf" value="${_csrf.token}"/>

                                <div class="mb-3"><input class="form-control" type="text" id="name-2" name="email" placeholder="Почта"
                                                         value="${user.email}" disabled=""></div>
                                <input class="form-control" type="tel" name="telephone" placeholder="Телефон" required=""
                                       value="${user.phone}"
                                       id="phoneInput"
                                       pattern="^(\+7|7|8)?[\s\-]?\(?9[0-9]{2}\)?[\s\-]?[0-9]{3}[\s\-]?[0-9]{2}[\s\-]?[0-9]{2}$"
                                       title="Неверный формат номера телефона">
                                <div class="d-flex d-lg-flex justify-content-center flex-wrap justify-content-lg-center align-items-lg-center">
                                    <#if pswdMessage??><div class="alert alert-primary" role="alert" style="margin-top: 20px"> ${pswdMessage}</div></#if>
                                    <a class="btn btn-primary" role="button" style="margin: 10px;" href="/profile/passwordReset">Сменить пароль</a>
                                    <button class="invisible" type="submit" id="submitPhoneNumber" style="width: 0;height: 0;padding: 0;margin: 0;"></button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="py-5 mt-5" style="margin-top: 0px;">
        <div class="container d-xl-flex justify-content-xl-center">
            <div class="row text-center d-xl-flex justify-content-xl-center">
                <div class="col-md-12 d-xl-flex justify-content-xl-center">
                    <h3 class="fw-bold text-center" data-aos="fade">Хочу получать рассылку</h3>
                </div>
                <div class="col-md-12 d-lg-flex d-xl-flex justify-content-lg-center justify-content-xl-center" style="margin-top: 20px;">
                    <form class="flex-wrap btn-group" method="post"
                          aria-label="Basic radio toggle button group" role="group" action="/profile/status">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>


                        <input type="radio" id="notif2" class="btn-check" value="2" name="notification" autocomplete="off" ${user.getNotificationStatus()?matches("2")?string("checked","")}>

                        <label class="form-label btn btn-outline-primary" id="all-news" for="notif2" style="min-width: 20px;border-radius: 32px;margin: 10px;">Все новости</label>

                        <input type="radio" id="notif0" class="btn-check" value="0" name="notification" autocomplete="off" ${user.getNotificationStatus()?matches("0")?string("checked","")}>

                        <label class="form-label text-center btn btn-outline-primary" id="nothing-news" for="notif0" style="min-width: 20px;border-radius: 32px;margin: 10px;" >Ничего</label>

                        <input type="radio" id="notif1" class="btn-check" value="1" name="notification" autocomplete="off" ${user.getNotificationStatus()?matches("1")?string("checked","")}>

                        <label class="form-label btn btn-outline-primary" id="best-news" for="notif1" style="min-width: 20px;border-radius: 32px;margin: 10px;" >Лучшие акции</label>


                        <button class="invisible" id="submit-news" type="submit" style="width: 0;height: 0;padding: 0;margin: 0;">Button</button>

                    </form>
                </div>
            </div>
        </div>
    </section>
    <section class="py-5 mt-5" style="margin-top: 0px;">
        <div class="container">
            <div class="row">
                <div class="col">
                    <h3 class="fw-bold text-center" data-aos="fade">Мои предыдущие заказы</h3>
                </div>
            </div>
        </div>
    </section>
    <#if prevOrders?size==0>
        <section class="py-5 mt-5" style="height: auto;margin: 100px 0;">
            <div class="container d-flex d-md-flex flex-column align-items-center flex-wrap m-auto align-items-sm-center justify-content-lg-center align-items-lg-center justify-content-xxl-center"
                 style="margin: 40px 0;padding: 0;">
                <h2 class="d-flex d-sm-flex d-md-flex align-items-center align-items-sm-center justify-content-md-center align-items-md-center"
                    style="margin: 100px 10px 10px;"><strong>Вы ничего не заказывали</strong></h2><img
                        class="d-sm-flex d-lg-flex justify-content-sm-center align-items-sm-center justify-content-lg-center align-items-lg-center"
                        src="http://127.0.0.1:8080/assets/img/plant.png" style="margin: 20px;">
            </div>
        </section>
        <#else >
            <#list prevOrders?reverse as order>
                <div class="container" data-aos="fade" style="box-shadow: 0px 0px var(--bs-primary);border-radius: 30px;padding-top: 48px;border-width: 7px;border-color: var(--bs-primary);">
                    <div class="row mb-5" data-aos="fade" style="margin-bottom: 0px;">
                        <div class="col-md-8 col-xl-6 text-center mx-auto">
                            <div class="d-flex justify-content-center align-self-center flex-nowrap justify-content-xxl-center">
                                <h2>Заказ номер&nbsp;</h2>
                                <h2><strong>${order.getId()}</strong></h2>
                            </div>
                            <p class="w-lg-50" style="color: var(--bs-primary);">${order.getOrderStatus()}</p>
                        </div>
                    </div>
                    <#list order.getProducts() as product>
                        <div class="row mb-5" data-aos="fade" style="margin-top: -40px;">
                            <div class="col-md-8 col-xl-6 text-center d-md-flex justify-content-between m-auto justify-content-md-center align-items-md-center" style="min-width: 100%;">
                                <div class="card d-flex d-xl-flex flex-row flex-grow-1 justify-content-center align-items-center align-content-center flex-wrap mx-auto justify-content-md-center align-items-xl-center" style="min-width: 100%;">
                                    <div class="d-sm-flex flex-grow-0 justify-content-sm-center align-items-sm-center"><img class="fit-cover" style="height: 100px;" src="/downloaded/${product.getProduct().getMainImage()}"></div>
                                    <div class="card-body d-flex d-xl-flex flex-grow-1 flex-wrap align-items-md-center justify-content-lg-center justify-content-xl-center align-items-xl-center p-4">
                                        <div class="d-flex d-xl-flex flex-row flex-grow-1 justify-content-xl-center align-items-xl-center" style="margin-right: 30px;margin-left: 30px;">
                                            <h4>${product.getProduct().getName()}</h4>
                                            <h4>&nbsp;</h4>
                                            <h4><strong>x${product.getQuantity()}</strong></h4>
                                        </div>
                                        <div class="d-flex d-xl-flex justify-content-xl-center" style="margin-right: 30px;margin-left: 30px;">
                                            <h4>${product.getQuantity()*product.getProduct().getCost()}</h4>
                                            <h4>₽<br></h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </#list>
                    <#if order.getDiscount()!=0>
                        <div class="row mb-5" data-aos="fade">
                            <div class="col-md-8 col-xl-6 text-center mx-auto" style="width: 100%;">
                                <div class="d-xl-flex flex-row flex-grow-1 align-items-center justify-content-xl-end align-items-xl-center" style="margin-right: 60px;">
                                    <h3 class="d-flex d-xl-flex justify-content-lg-center justify-content-xl-center" style="color: var(--bs-primary);">Скидка:&nbsp;</h3>
                                    <div class="text-end d-flex d-xl-flex flex-row align-content-center justify-content-lg-center justify-content-xl-center align-items-xl-center">
                                        <h4 class="text-end" style="color: var(--bs-primary);">${order.getDiscount()}</h4>
                                        <h4 class="text-end" style="color: var(--bs-primary);">₽<br></h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </#if>
                    <div class="row mb-5" data-aos="fade" style="margin-top: -50px;">
                        <div class="col-md-8 col-xl-6 text-center mx-auto" style="width: 100%;">
                            <div class="d-xl-flex flex-row flex-grow-1 align-items-center justify-content-xl-end align-items-xl-center" style="margin-right: 60px;">
                                <h2 class="d-flex d-xl-flex justify-content-lg-center justify-content-xl-center"><strong>Итого</strong>:&nbsp;</h2>
                                <div class="text-end d-flex d-xl-flex flex-row align-content-center justify-content-lg-center justify-content-xl-center align-items-xl-center">
                                    <h3 class="text-end">${order.getCost()}</h3>
                                    <h3 class="text-end">₽<br></h3>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr>
                </div>
            </#list>
    </#if>

    <script src="http://127.0.0.1:8080/assets/js/profile.js"></script>

</@c.c>