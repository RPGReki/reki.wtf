---
title: Login
layout: 2021/base
sitemap: false
robots: noindex
comments: false
permalink: /wp-login-error/
---
<h1>Login</h1>

{:.interface}
> Error
> {:style="background: var(--danger)"}
>
> You did not sign in correctly, or your account is temporarily disabled.
>
> {:.mb-2}
> [Go Back](javascript:history.back()){:onclick="history.back()" .btn .btn-primary}
>

<form name="Login" method="POST" action="/wp-login/?action=login" id="loginform" class="form-horizontal" data-netlify="true" netlify-honeypot="password">
  <fieldset id="login">
    <div>
      <label for="email">Email</span></label>
      <input type="email" name="email" id="email" placeholder="name@domain.tld" aria-required="true" required="true" />
      <label for="password">Password</label>
      <input type="password" name="password" id="password" aria-required="true" required="true" />
    </div>
    <div class="row mx-2">
      <input type="checkbox" name="remember" id="remember" class="col-auto mt-2">
      <label for="remember" class="col">
        Remember me
      </label>
    </div>
    <div>
      <button type="sumbit" id="loginbutton" class="btn btn-primary btn-block">Login</button>
    </div>
  </fieldset>
</form>
