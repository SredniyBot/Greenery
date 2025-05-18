<#import "parts/common.ftl" as c>
<@c.c "reg">

    <#if user.getCartOrder().getProducts()?size==0>
        <section class="py-5 mt-5" style="height: auto;margin: 100px 0;">
            <div class="container d-flex d-md-flex flex-column align-items-center flex-wrap m-auto align-items-sm-center justify-content-lg-center align-items-lg-center justify-content-xxl-center"
                 style="margin: 40px 0;padding: 0;">
                <h2 class="d-flex d-sm-flex d-md-flex align-items-center align-items-sm-center justify-content-md-center align-items-md-center"
                    style="margin: 100px 10px 10px;"><strong>Корзина пуста..</strong></h2><img
                        class="d-sm-flex d-lg-flex justify-content-sm-center align-items-sm-center justify-content-lg-center align-items-lg-center"
                        src="http://127.0.0.1:8080/assets/img/plant.png" style="margin: 20px;"><a href="/products">заполнить</a>
            </div>
        </section>
    <#else >
        <section class="py-5 mt-5" style="height: auto;">
            <div class="container d-none d-print-none d-sm-none d-md-flex d-lg-flex d-xl-flex d-xxl-flex align-items-md-center justify-content-xxl-center">
                <div class="d-flex d-md-flex flex-grow-1 flex-shrink-0 flex-nowrap justify-content-md-start align-items-md-center">
                    <h5 class="d-flex d-sm-flex d-md-flex align-items-center align-items-sm-center justify-content-md-center align-items-md-center"
                        style="margin: 10px;">Продукт</h5>
                </div>
                <div class="text-nowrap text-center d-flex d-md-flex flex-nowrap justify-content-md-end align-items-md-center"
                     style="margin: 20px;">
                    <h5 class="d-flex d-sm-flex d-md-flex align-items-center align-items-sm-center justify-content-md-center align-items-md-center">
                        Цена</h5>
                </div>
                <div class="text-nowrap text-center d-flex d-md-flex flex-nowrap justify-content-md-end align-items-md-center"
                     style="margin: 20px;">
                    <h5 class="d-flex d-sm-flex d-md-flex align-items-center align-items-sm-center justify-content-md-center align-items-md-center">
                        Количество</h5>
                </div>
                <div class="text-nowrap text-center d-flex d-md-flex flex-nowrap justify-content-md-end align-items-md-center"
                     style="margin: 20px;">
                    <h5 class="d-flex d-sm-flex d-md-flex align-items-center align-items-sm-center justify-content-md-center align-items-md-center">
                        Всего</h5>
                </div>
            </div>
            <hr class="d-none d-print-block d-md-block d-lg-block d-xl-block d-xxl-block"
                style="margin-top: 0;margin-right: 0;">

            <#list user.getCartOrder().getProducts() as product>
                <div id="product${product?index}div" class="container d-flex d-md-flex justify-content-between flex-wrap align-items-md-center justify-content-xxl-center"
                     style="margin-bottom: 10px;">
                    <div class="d-flex d-md-flex flex-grow-1 flex-shrink-0 flex-nowrap justify-content-md-start align-items-md-center">
                        <img class="rounded" src="/downloaded/${product.getProduct().getMainImage()}" alt="Slide Image"
                             style="max-height: 400px;height: 120px;width: 120px;">
                        <div class="d-flex flex-column flex-grow-1 justify-content-between flex-wrap flex-md-row">
                            <h5 class="d-flex d-sm-flex d-md-flex align-items-center align-items-sm-center justify-content-md-center align-items-md-center"
                                style="margin: 10px;"><strong>${product.getProduct().getName()}</strong></h5>
                            <div class="text-nowrap text-center d-flex d-md-flex flex-nowrap justify-content-md-end align-items-md-center"
                                 style="padding: 0 15px;">
                                <h5 id="product${product?index}cost" class="d-flex d-sm-flex d-md-flex align-items-center align-items-sm-center justify-content-md-center align-items-md-center">
                                    ${product.getProduct().getCost()}</h5>
                                <h5 class="d-flex d-sm-flex d-md-flex align-items-center align-items-sm-center justify-content-md-center align-items-md-center">
                                    ₽<br></h5>
                            </div>
                        </div>
                    </div>




                    <div  class="d-flex flex-row flex-grow-1 justify-content-between align-items-sm-center flex-md-grow-0">
                            <div style="padding: 0 18px;margin: 10px 0;" >
                                <iframe name="iframe1" style="display: none;"></iframe>
                                <div n class="d-flex d-lg-flex justify-content-center align-self-center flex-nowrap align-items-lg-center">
                                    <form action="/cart/commit/${product.getProduct().getLinkName()}" target="iframe1" method="post">
                                        <@c.csrf/>
                                        <button class="btn btn-primary text-center" type="submit" id="product${product?index}commit"
                                                style="position: absolute; left: -9999px;"/>

                                    </form>

                                    <form action="/cart/minus/${product.getProduct().getLinkName()}" target="iframe1" method="post">
                                        <@c.csrf/>
                                        <button class="btn btn-primary text-center" type="submit" id="product${product?index}minus"
                                                style="background: var(--bs-secondary);height: 45px;color: var(--bs-gray);border-radius: 16px 0 0 16px;border-width: 1px;border-color: var(--bs-gray-dark);font-size: 24px;padding: 0 12px 0 14px;">-</button>
                                    </form>

                                    <input class="border rounded-0 border-2 form-control d-flex align-items-lg-center"
                                           type="number" value="${product.getQuantity()}" min="1" max="20" step="1"
                                           style="border-radius: 0;height: 45px;font-size: 20px;padding: 0;font-weight: bold;text-align: center;max-width: 45px;" readonly="" required=""
                                           id="product${product?index}">
                                    <form action="/cart/plus/${product.getProduct().getLinkName()}" target="iframe1" method="post">
                                        <@c.csrf/>
                                        <button class="btn btn-primary text-nowrap text-center" type="submit"
                                                id="product${product?index}plus" style="height: 45px;background: var(--bs-secondary);border-radius: 0 16px 16px 0;color: var(--bs-gray);border-width: 1px;border-color: var(--bs-gray-dark);padding: 0 12px;font-size: 24px;">+</button>
                                    </form>
                                </div>
                                <div class="text-center">
                                    <form action="/cart/delete/${product.getProduct().getLinkName()}" target="iframe1" method="post">
                                        <@c.csrf/>
                                        <button type="submit" id="product${product?index}del" style="padding: 0;background: var(--bs-secondary);border-style: none;color: var(--bs-danger);font-size: 12px;margin: 5px;">УДАЛИТЬ</button>
                                    </form>
                                </div>
                            </div>
                        <div class="text-nowrap text-center d-flex d-md-flex flex-nowrap justify-content-md-end align-items-md-center"
                             style="padding: 21px;">
                            <h5 class="d-flex d-sm-flex d-md-flex align-items-center align-items-sm-center justify-content-md-center align-items-md-center"
                                id="podsolnc-total"
                            ><strong id="product${product?index}sumcost">${product.getQuantity()*product.getProduct().getCost()}</strong></h5>
                            <h5 class="d-flex d-sm-flex d-md-flex align-items-center align-items-sm-center justify-content-md-center align-items-md-center">
                                <strong>₽</strong><br></h5>
                        </div>
                    </div>



                </div>
            </#list>
            <hr class="d-none d-print-block d-md-block d-lg-block d-xl-block d-xxl-block"
                style="margin-top: 0;margin-right: 0;">

            <div class="container d-flex d-md-flex flex-column justify-content-between align-items-center flex-wrap align-items-sm-center align-items-md-end justify-content-xxl-center align-items-xxl-end"
                 style="margin-bottom: 10px;">
                <#if user.getCartOrder().getDiscount()!=0>
                    <div class="d-flex d-md-flex flex-grow-1 flex-shrink-0 flex-nowrap justify-content-md-start align-items-md-center">
                        <h3 class="d-flex d-xl-flex justify-content-lg-center justify-content-xl-center"
                            style="color: var(--bs-primary);">Скидка:&nbsp;</h3>
                        <div class="text-end d-flex d-xl-flex flex-row align-content-center justify-content-lg-center justify-content-xl-center align-items-xl-center">
                            <h4 class="text-end" style="color: var(--bs-primary);">${user.getCartOrder().getDiscount()}</h4>
                            <h4 class="text-end" style="color: var(--bs-primary);">₽<br></h4>
                        </div>
                    </div>
                </#if>
                <div class="d-flex flex-row flex-grow-1 align-items-sm-center flex-md-grow-0">
                    <h2 class="d-flex d-xl-flex justify-content-lg-center justify-content-xl-center"><strong>Итого</strong>:&nbsp;
                    </h2>
                    <div class="text-end d-flex d-xl-flex flex-row align-content-center justify-content-lg-center justify-content-xl-center align-items-xl-center">



                        <h3 class="text-end" id="megacost">${user.getCartOrder().getCost()}</h3>
                        <h3 class="text-end">₽<br></h3>




                    </div>
                </div>
                <button class="btn btn-primary" type="button" style="margin: 20px;">Оформить</button>
            </div>
        </section>
    </#if>


</@c.c>