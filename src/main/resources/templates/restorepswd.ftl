<#import "parts/common.ftl" as c>
<@c.c "reg">
    <section class="py-5 mt-5">
        <div class="container py-5">
            <div class="row mb-4 mb-lg-5">
                <div class="col-md-8 col-xl-6 text-center mx-auto">
                    <#if user??>
                        <p class="fw-bold text-success mb-2">Создание нового пароля</p>
                    <#else >
                            <p class="fw-bold text-success mb-2">Восстановление пароля</p>
                    </#if>

                    <h2 class="fw-bold">Укажите новый пароль</h2>
                </div>
            </div>
            <div class="row d-flex justify-content-center">
                <div class="col-md-6 col-xl-4">
                    <div class="card">
                        <div class="card-body text-center d-flex flex-column align-items-center">
                            <div class="bs-icon-xl bs-icon-circle bs-icon-primary shadow bs-icon my-4" style="--bs-primary: #63b175;--bs-primary-rgb: 99,177,117;"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-pencil">
                                    <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"></path>
                                </svg></div>
                            <#if user??>
                                <form method="post" action="/profile/passwordReset">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                    <div class="mb-3"></div>
                                    <div class="mb-3"><input class="form-control" type="password" name="password" placeholder="Новый пароль"></div>
                                    <div class="mb-3"><input class="form-control" type="password" name="passwordCheck" placeholder="Повторите пароль"></div>
                                    <#if passwordsNotEquals??><div class="alert alert-danger" role="alert">${passwordsNotEquals}</div></#if>
                                    <#if passwordError??><div class="alert alert-danger" role="alert">${passwordError}</div></#if>

                                    <div class="mb-3"><button class="btn btn-primary shadow d-block w-100" type="submit" style="background: #63b175;border-style: none;">Подтвердить</button></div>
                                </form>
                                <#else >
                                <form method="post" action="/restore/user">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                    <#if uuid??><input type="hidden" name="uuid" value="${uuid}"/></#if>

                                    <div class="mb-3"></div>
                                    <div class="mb-3"><input class="form-control" type="password" name="password" placeholder="Новый пароль"></div>
                                    <div class="mb-3"><input class="form-control" type="password" name="passwordCheck" placeholder="Повторите пароль"></div>
                                    <#if passwordsNotEquals??><div class="alert alert-danger" role="alert">${passwordsNotEquals}</div></#if>
                                    <#if passwordError??><div class="alert alert-danger" role="alert">${passwordError}</div></#if>

                                    <div class="mb-3"><button class="btn btn-primary shadow d-block w-100" type="submit" style="background: #63b175;border-style: none;">Восстановить</button></div>
                                </form>
                            </#if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</@c.c>