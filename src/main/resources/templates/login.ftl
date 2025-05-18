<#import "parts/common.ftl" as c>
<@c.c  "reg">
    <section class="py-5 mt-5">
        <div class="container py-5">
            <div class="row mb-4 mb-lg-5">
                <div class="col-md-8 col-xl-6 text-center mx-auto">
                    <p class="fw-bold text-success mb-2">Вход в аккаунт</p>
                    <h2 class="fw-bold">Добро пожаловать!</h2>
                </div>
            </div>
            <div class="row d-flex justify-content-center">
                <div class="col-md-6 col-xl-4">
                    <div class="card">
                        <div class="card-body text-center d-flex flex-column align-items-center">
                            <div class="bs-icon-xl bs-icon-circle bs-icon-primary shadow bs-icon my-4" style="--bs-primary: #63b175;--bs-primary-rgb: 99,177,117;"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-person">
                                    <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"></path>
                                </svg></div>
                            <form method="post" action="/login">
                                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                <div class="mb-3"><input class="form-control" type="email" name="email" placeholder="Почта" ></div>
                                <div class="mb-3"><input class="form-control" type="password" name="password" placeholder="Пароль"></div>
                                <#if message??><div class="alert alert-primary" role="alert">${message}</div></#if>
                                <#if errorMessage??><div class="alert alert-danger" role="alert">${errorMessage}</div></#if>
                                <div class="mb-3"><button class="btn btn-primary shadow d-block w-100" type="submit" style="--bs-dark: #63b175;--bs-dark-rgb: 99,177,117;background: #63b175;border-style: none;">Войти</button></div>
                                <p class="text-muted">Забыли пароль?&nbsp;<a href="/restore">Восстановить</a></p>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</@c.c>