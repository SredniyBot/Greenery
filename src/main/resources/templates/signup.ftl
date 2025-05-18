<#import "parts/common.ftl" as c>
<@c.c "">
    <section class="py-5 mt-5">
        <div class="container py-5">
            <div class="row mb-4 mb-lg-5">
                <div class="col-md-8 col-xl-6 text-center mx-auto">
                    <p class="fw-bold text-success mb-2">Регистрация</p>
                    <h2 class="fw-bold">Добро пожаловать</h2>
                </div>
            </div>
            <div class="row d-flex justify-content-center">
                <div class="col-md-6 col-xl-4">
                    <div class="card">
                        <div class="card-body text-center d-flex flex-column align-items-center">
                            <div class="bs-icon-xl bs-icon-circle bs-icon-primary shadow bs-icon my-4" style="--bs-primary: #63b175;--bs-primary-rgb: 99,177,117;--bs-dark: #63b175;--bs-dark-rgb: 99,177,117;"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-person">
                                    <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"></path>
                                </svg></div>
                            <form method="post" action="/signup">
                                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                <div class="mb-3"><input class="form-control" type="email" name="email" placeholder="Почта" <#if email??>value="${email}"</#if>></div>
                                <div class="mb-3"><input class="form-control" type="password" name="password" placeholder="Пароль"></div>
                                <div class="mb-3"><input class="form-control" type="password" name="passwordCheck" placeholder="Пароль"></div>
                                <#if passwordsNotEquals??><div class="alert alert-danger" role="alert">${passwordsNotEquals}</div></#if>
                                <#if passwordError??><div class="alert alert-danger" role="alert">${passwordError}</div></#if>
                                <#if emailError??><div class="alert alert-danger" role="alert">${emailError}</div></#if>
                                <div class="mb-3"><button class="btn btn-primary shadow d-block w-100" type="submit" style="--bs-primary: #63b175;--bs-primary-rgb: 99,177,117;--bs-dark: #63b175;--bs-dark-rgb: 99,177,117;background: var(--bs-primary);border-style: none;">Зарегистрироваться</button></div>
                                <p class="text-muted">Уже есть аккаунт?&nbsp;<a href="login">Войти</a></p>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</@c.c>