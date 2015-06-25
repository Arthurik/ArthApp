<%--
  Created by IntelliJ IDEA.
  User: salimhanov
  Date: 24.04.2015
  Time: 17:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"  %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  <style type="text/css">
  <%@ include file="../../../resources/bootstrap/css/bootstrap.min.css"%>
  </style>
  <%--<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  --%>
  <style type="text/css">
    body {
      padding-top: 40px;
      padding-bottom: 40px;
      background-color: #f5f5f5;
    }

    .form-signin {
      max-width: 400px;
      padding: 19px 29px 29px;
      margin: 0 auto 20px;
      background-color: #fff;
      border: 1px solid #e5e5e5;
      -webkit-border-radius: 5px;
      -moz-border-radius: 5px;
      border-radius: 5px;
      -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
      -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
      box-shadow: 0 1px 2px rgba(0,0,0,.05);
    }
    .form-signin .form-signin-heading,
    .form-signin .checkbox {
      margin-bottom: 10px;
    }
    .form-signin input[type="text"],
    .form-signin input[type="password"] {
      font-size: 16px;
      height: auto;
      margin-bottom: 15px;
      padding: 7px 9px;
    }

  </style>

</head>
<body>


<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/">Система защиты транспорта</a>
    </div>
    <div class="collapse navbar-collapse">
      <ul class="nav navbar-nav">
        <li class="active"><a href="/">Главная</a></li>
        <li><a href="#about">О системе</a></li>
        <li><a href="#contact">Контакты</a></li>
      </ul>
    </div><!--/.nav-collapse -->
  </div>
</div>


<div class="container">

  <form class="form-signin" name="f" action="/j_spring_security_check" method="POST">
    <h2 class="form-signin-heading">Авторизация</h2>
      <input type="text" class="input-block-level" placeholder="Имя пользователя" name="username" id="username">
    <input type="password" class="input-block-level" placeholder="Пароль" name="password" id="password">
    <label class="checkbox">
      <input type="checkbox" name="_spring_security_remember_me" value="_spring_security_remember_me"> Запомнить меня
    </label>
    <label  >
      <a href="/users?new">Регистрация</a>
    </label>
    <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}" />
    <button class="btn btn-large btn-primary" type="submit">Вход</button>
  </form>
<%--
<div>
  ${}

</div>
--%>
<%--
  <form name='f' action='/j_spring_security_chain' method='POST'>
    <table>
      <tr><td>User:</td><td><input type='text' name='username' value=''></td></tr>
      <tr><td>Password:</td><td><input type='password' name='password'/></td></tr>
      <tr><td><input type='checkbox' name='remember-me'/></td><td>Remember me on this computer.</td></tr>
      <tr><td colspan='2'><input name="submit" type="submit" value="Login"/></td></tr>
      <input name="_csrf" type="hidden" value="3c7642fd-50b6-4741-b3b9-0f1b711a54f4" />
    </table>
  </form>--%>


</div>




<script src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">

  <%@ include file="../../../resources/bootstrap/js/bootstrap.min.js"%>



</script>
</body>
</html>