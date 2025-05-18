<#import "parts/common.ftl" as c>
<@c.c  "reg">

    <section class="py-5 mt-5">
        <div class="container py-5">
            <div class="row mb-4 mb-lg-5">
                <div class="col-md-8 col-xl-6 text-center mx-auto">
                    <p class="fw-bold text-success mb-2">Восстановление пароля</p>
                    <h2 class="fw-bold">Мы отправим вам письмо на почту</h2>
                </div>
            </div>
            <div class="row d-flex justify-content-center">
                <div class="col-md-6 col-xl-4">
                    <div class="card">
                        <div class="card-body text-center d-flex flex-column align-items-center">
                            <div class="bs-icon-xl bs-icon-circle bs-icon-primary shadow bs-icon my-4" style="--bs-primary: #63b175;--bs-primary-rgb: 99,177,117;"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-envelope">
                                    <path fill-rule="evenodd" d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z"></path>
                                </svg></div>
                            <form method="post" action="/restore">
                                <input type="hidden" name="_csrf" value="${_csrf.token}"/>

                                <div class="mb-3"><input class="form-control" type="email" name="email" placeholder="Почта"></div>
                                <div class="mb-3"></div>
                                <#if message??><div class="alert alert-primary" role="alert">${message}</div></#if>
                                <#if emailError??><div class="alert alert-danger" role="alert">${emailError}</div></#if>

                                <div class="mb-3"><button class="btn btn-primary shadow d-block w-100" type="submit" style="background: #63b175;border-style: none;">Отправить письмо</button></div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</@c.c>