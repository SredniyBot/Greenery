<#import "parts/common.ftl" as c>
<@c.c "reg">
    <section class="text-primary py-5 mt-5">
        <div class="container py-5" style="margin-bottom: -100px;">
            <div class="row mb-5">
                <div class="col-md-8 col-xl-6 text-center mx-auto">
                    <h2 class="fw-bold" data-aos="fade"
                        style="--bs-primary: #63b175;--bs-primary-rgb: 99,177,117;color: var(--bs-primary);">Наша микрозелень</h2>
                    <p class="text-muted w-lg-50" data-aos="fade">Вся микрозелень выращивается с соблюдением всех
                        санитарных норм в специально оборудованном помещении</p>
                </div>
            </div>
            <div class="row row-cols-1 row-cols-md-2 mx-auto" style="max-width: 900px;">
                <#list products as product>
                    <div class="col mb-4">
                        <div style="min-width: 420px;"><a href="/product/${product.getLinkName()}"><img class="rounded img-fluid shadow w-100 fit-cover" data-aos="fade"
                                              src="http://127.0.0.1:8080/downloaded/${product.getMainImage()}" style="height: 250px;"></a>
                            <div class="py-4">
                                <div class="d-flex d-lg-flex d-xxl-flex justify-content-between align-items-center flex-nowrap m-auto align-items-lg-center justify-content-xxl-center align-items-xxl-center">
                                    <h4 class="fw-bold d-xxl-flex flex-grow-1 justify-content-xxl-start" data-aos="fade"
                                        style="color: var(--bs-primary);">${product.getName()}</h4>
                                    <h5 class="fw-bold" data-aos="fade"
                                        style="color: var(--bs-gray-600);border-color: var(--bs-gray);"><span
                                                style="font-weight: normal !important;">${product.getCost()}&nbsp;₽</span></h5>
                                </div>
                                <p class="text-muted" data-aos="fade">${product.getShortDescription()}<br></p>
                            </div>
                        </div>
                    </div>
                </#list>
                <div class="col mb-4">
                    <div style="min-width: 420px;"><a><img class="rounded img-fluid shadow w-100 fit-cover" data-aos="fade"
                                 src="http://127.0.0.1:8080/assets/img/sad_plant.webp" style="height: 250px;"></a>
                        <div class="py-4">
                            <h4 class="fw-bold" data-aos="fade" style="color: var(--bs-primary);">Не нашли того, что
                                искали?</h4>
                            <p class="text-muted" data-aos="fade">Скажите нам, чего бы хотелось лично вам, и мы расширим
                                ассортимент!</p>
                            <form class="d-xxl-flex flex-column justify-content-xxl-center" action="/products" method="post">
                                <@c.csrf/>
                                <#if message??><div class="alert alert-primary" role="alert" style="margin-top: 10px;">${message}</div></#if>
                                <input class="form-control" type="text" name="name" placeholder="Название микрозелени" required=""/>
                                <button class="btn btn-primary" type="submit" style="margin:  10px 0;">Отправить</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</@c.c>