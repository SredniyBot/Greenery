<#import "parts/common.ftl" as c>
<@c.c  "reg">
    <form action="/product-add" method="post" enctype="multipart/form-data">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <section class="py-5 mt-5">
            <div class="container py-4 py-xl-5" style="height: auto;">
                <div class="row row-cols-1 row-cols-md-2">
                    <div class="col d-sm-flex d-lg-flex flex-column align-items-sm-center justify-content-md-center justify-content-lg-center align-items-lg-center">
                        <h4 class="text-center">Главное фото</h4>
                        <input class="border rounded form-control form-control-sm" type="file" name="image1"
                                accept="image/*" required="">
                        <h4 class="text-center" style="margin: 10px;">Побочные фото</h4>
                        <input class="border rounded form-control form-control-sm" type="file" name="image2"
                                accept="image/*"  style="margin: 10px;"><input
                                class="border rounded form-control form-control-sm" type="file" name="image3"
                                accept="image/*" >
                    </div>

                    <div class="col d-flex flex-column justify-content-center p-4">
                        <input class="form-control form-control-lg" type="text" name="name"
                                placeholder="Название продукта" minlength="3" maxlength="40" required=""
                                style="font-size: 25px;">
                        <div class="text-center text-md-start d-flex flex-column align-items-start justify-content-sm-center align-items-md-start mb-5"
                             style="margin: 10px;">
                            <div class="d-flex d-sm-flex d-md-flex flex-row align-items-center align-items-sm-center justify-content-md-center align-items-md-center">
                                <input class="form-control form-control-sm" type="number" name="cost" min="10"
                                       max="15000" step="1" placeholder="Цена" style="font-size: 20px;" required="">
                                <h4 class="d-flex justify-content-start m-auto align-items-md-center"><strong>₽</strong><br>
                                </h4>
                            </div>
                        </div>
                        <input class="form-control form-control-sm" type="text" placeholder="Название ссылки"
                               name="linkName" required="" minlength="3" maxlength="50" pattern="[A-Za-z]+">

                    </div>
                </div>
            </div>
            <div class="d-flex d-xxl-flex justify-content-center justify-content-xxl-center" style="margin: 0 40px;">
                <textarea name="shortDescription" class="form-control form-control-lg"
                          placeholder="Краткое описание товара" cols="100" rows="4"
                          style="width: 90%;" required=""></textarea></div>
        </section>
        <div class="container py-4 py-xl-5">
            <div class="row" style="padding: 0;">
                <div class="col-md-8 col-xl-6 mx-auto p-4" style="width: auto;">
                    <div class="d-flex flex-row flex-grow-0 align-items-center align-items-md-start justify-content-lg-start align-items-xl-center justify-content-xxl-center">
                        <div class="bs-icon-xl bs-icon-circle bs-icon-primary d-flex flex-shrink-0 justify-content-center align-items-center me-4 d-inline-block bs-icon xl">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="1em" height="1em"
                                 fill="currentColor">
                                <!--! Font Awesome Free 6.1.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free (Icons: CC BY 4.0, Fonts: SIL OFL 1.1, Code: MIT License) Copyright 2022 Fonticons, Inc. -->
                                <path d="M256 112V128C256 136.8 248.8 144 240 144C195.8 144 160 108.2 160 64V48C160 39.16 167.2 32 176 32C220.2 32 256 67.82 256 112zM104 64C117.3 64 128 74.75 128 88C128 101.3 117.3 112 104 112H56C42.75 112 32 101.3 32 88C32 74.75 42.75 64 56 64H104zM136 136C149.3 136 160 146.7 160 160C160 173.3 149.3 184 136 184H24C10.75 184 0 173.3 0 160C0 146.7 10.75 136 24 136H136zM32 232C32 218.7 42.75 208 56 208H104C117.3 208 128 218.7 128 232C128 245.3 117.3 256 104 256H56C42.75 256 32 245.3 32 232zM272 48C272 39.16 279.2 32 288 32C332.2 32 368 67.82 368 112V128C368 136.8 360.8 144 352 144C307.8 144 272 108.2 272 64V48zM480 112V128C480 136.8 472.8 144 464 144C419.8 144 384 108.2 384 64V48C384 39.16 391.2 32 400 32C444.2 32 480 67.82 480 112zM480 208C480 252.2 444.2 288 400 288C391.2 288 384 280.8 384 272V256C384 211.8 419.8 176 464 176C472.8 176 480 183.2 480 192V208zM352 176C360.8 176 368 183.2 368 192V208C368 252.2 332.2 288 288 288C279.2 288 272 280.8 272 272V256C272 211.8 307.8 176 352 176zM256 208C256 252.2 220.2 288 176 288C167.2 288 160 280.8 160 272V256C160 211.8 195.8 176 240 176C248.8 176 256 183.2 256 192V208zM0 352C0 334.3 14.33 320 32 320H480C497.7 320 512 334.3 512 352C512 411.7 471.1 461.9 415.8 476C415.9 477.3 416 478.7 416 480C416 497.7 401.7 512 384 512H128C110.3 512 96 497.7 96 480C96 478.7 96.08 477.3 96.24 476C40.91 461.9 0 411.7 0 352V352z"></path>
                            </svg>
                        </div>
                        <div class="d-flex flex-column align-items-xl-start justify-content-xxl-center align-items-xxl-start">
                            <h4>С чем приготовить?</h4><textarea class="form-control form-control-lg"
                                                                 placeholder="Описание" name="cookDescription" rows="3"
                                                                 cols="100" style="width: 100%;" required=""></textarea>
                        </div>
                    </div>
                    <hr class="my-5">
                    <div class="d-flex align-items-center align-items-md-start align-items-xl-center justify-content-xxl-center">
                        <div class="bs-icon-xl bs-icon-circle bs-icon-primary d-flex flex-shrink-0 justify-content-center align-items-center order-last ms-4 d-inline-block bs-icon xl">
                            <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor"
                                 viewBox="0 0 16 16" class="bi bi-heart-fill">
                                <path fill-rule="evenodd"
                                      d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"></path>
                            </svg>
                        </div>
                        <div class="d-flex flex-column justify-content-xxl-center">
                            <h4>В чем польза для здоровья?</h4><textarea class="form-control form-control-lg"
                                                                         placeholder="Описание" name="healthDescription"
                                                                         rows="3" cols="100"
                                                                         style="width: 100%;" required=""></textarea>
                        </div>
                    </div>
                    <hr class="my-5">
                    <div class="d-flex align-items-center align-items-md-start align-items-xl-center justify-content-xxl-center">
                        <div class="bs-icon-xl bs-icon-circle bs-icon-primary d-flex flex-shrink-0 justify-content-center align-items-center me-4 d-inline-block bs-icon xl">
                            <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor"
                                 viewBox="0 0 16 16" class="bi bi-shield-fill-check">
                                <path fill-rule="evenodd"
                                      d="M8 0c-.69 0-1.843.265-2.928.56-1.11.3-2.229.655-2.887.87a1.54 1.54 0 0 0-1.044 1.262c-.596 4.477.787 7.795 2.465 9.99a11.777 11.777 0 0 0 2.517 2.453c.386.273.744.482 1.048.625.28.132.581.24.829.24s.548-.108.829-.24a7.159 7.159 0 0 0 1.048-.625 11.775 11.775 0 0 0 2.517-2.453c1.678-2.195 3.061-5.513 2.465-9.99a1.541 1.541 0 0 0-1.044-1.263 62.467 62.467 0 0 0-2.887-.87C9.843.266 8.69 0 8 0zm2.146 5.146a.5.5 0 0 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 7.793l2.646-2.647z"></path>
                            </svg>
                        </div>
                        <div class="d-flex flex-column justify-content-xxl-center align-items-xxl-start">
                            <h4>Где, как и сколько хранить?</h4><textarea class="form-control form-control-lg"
                                                                          placeholder="Описание"
                                                                          name="storageDescription"
                                                                          rows="3" cols="100"
                                                                          style="width: 100%;" required=""></textarea>
                        </div>
                    </div>
                </div>
            </div>
            <div class="d-flex d-xxl-flex justify-content-center align-items-center justify-content-xxl-center"
                 style="margin: 20px;">
                <button class="btn btn-primary btn-lg" type="submit">Добавить товар</button>
            </div>
        </div>
    </form>
</@c.c>