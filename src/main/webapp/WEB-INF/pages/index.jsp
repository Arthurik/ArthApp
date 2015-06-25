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
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  <style type="text/css">
    <%@ include file="/resources/bootstrap/css/bootstrap.min.css"%>
  </style>
  <%--<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  --%>
  <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.0/css/bootstrap-toggle.min.css" rel="stylesheet">
  <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.0/js/bootstrap-toggle.min.js"></script>

  <style type="text/css">


    body {
      padding-top: 70px;
      padding-bottom: 40px;
      background-color: #f5f5f5;
      min-height: 2000px;
font-size: 12pt;
    }

    .form-signin {
      max-width: 450px;
      padding: 19px 29px 29px;

      margin: 0 auto 40px;
      background: rgba(255,245,215,0);
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
        <li><a href="/">Главная</a></li>
          <li class="dropdown active">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Сервисы <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="#">Состояние автомобиля</a></li>
            <li class="divider"></li>
            <li class="dropdown-header">Данные</li>
            <li><a href="#">Изменение данных об автомобиле</a></li>
            <li><a href="#">Добавление нового автомобиля</a></li>
          </ul>
        </li>

        <li><a href="/admin">Админка</a></li>

          <c:if test="${pageContext.request.userPrincipal.name != null}">
        <li><a href="/users/${pageContext.request.userPrincipal.name}"> ${pageContext.request.userPrincipal.name}</a>
            </li>
                       </c:if>
                        <c:if test="${pageContext.request.userPrincipal.name != null}">


            <li> <a href="/logout">Выйти</a> </li>
          </c:if>

        <c:if test="${pageContext.request.userPrincipal.name == null}">
        <li>
          <a href="/login" >Войти</a>
        </li>
        </c:if>

      </ul>
    </div>
  </div>
</div>


<div class="container">

  <div class="jumbotron">
    <table>
   <tr>
     <td width="10%">&nbsp; </td>
     <td width="10%">&nbsp; </td>
     <td width="10%">&nbsp; </td>
     <td width="10%">&nbsp; </td>
     <td width="10%">&nbsp; </td>
     <td width="10%">&nbsp; </td>
     <td width="10%">&nbsp; </td>
     <td width="10%">&nbsp; </td>
     <td width="10%">&nbsp; </td>
     <td width="10%"> &nbsp;</td>
   </tr>
<tr><td colspan="5">Состояние автомобиля: </td><td>&nbsp;</td> <td><select >
  <option>АВТО</option>
</select></td> </tr>
      <tr>
        <td colspan="5"><div class="status">
          <table>
            <tr><td><input type="button" value="Обновить"/> </td></tr>
            <tr><td>&nbsp;</td></tr>
            <tr><td>&nbsp;</td></tr>
            <tr><td>Статус:</td> <td>&nbsp;</td> <td>Все хорошо</td></tr>
            <tr><td>&nbsp;</td></tr>
            <tr><td>Датчик движения:</td> <td>&nbsp;</td> <td>Не активен</td></tr>
            <tr><td>&nbsp;</td></tr>
            <tr>
              <td>Запуск двигателя:</td><td></td>

            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr>
              <td>Режим защиты: </td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr><td>&nbsp;</td></tr>

            <tr><td><input type="button" value="Получить изображение"/> </td></tr>


          </table>

        </div></td> <td colspan="2">&nbsp;</td>  <td colspan="3"><iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d18236.453774407386!2d61.387127216332985!3d55.156035402789776!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sru!2sru!4v1433764866059" width="600" height="450" frameborder="0" style="border:0"></iframe></td>
      </tr>




    </table>
   </div>

</div>

<%--
<div class="container">
  <form class="form-signin">
    <h2 class="form-signin-heading">Пожалуйста, авторизуйтесь</h2>
      <input type="text" class="input-block-level" placeholder="Имя пользователя">
    <input type="password" class="input-block-level" placeholder="Пароль">
    <label class="checkbox">
      <input type="checkbox" value="remember-me"> Запомнить меня
    </label>
    <button class="btn btn-large btn-primary" type="submit">Вход</button>
  </form>

</div>--%>



<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" >

  <%@ include file="/resources/bootstrap/js/bootstrap.min.js" %>
</script>


</body>
</html>