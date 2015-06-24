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
    <%@ include file="/resources/bootstrap/css/bootstrap.min.css"%>
  </style>
  <%--<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  --%>
  <style type="text/css">

input[readonly]{
  background-color: lightgray ;
}
    body {
      padding-top: 70px;
      padding-bottom: 40px;
      background-color: #f5f5f5;
      min-height: 2000px;

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
      <a class="navbar-brand" href="#">Система защиты транспорта</a>
    </div>
    <div class="collapse navbar-collapse">
      <ul class="nav navbar-nav">
        <li><a href="#">Главная</a></li>
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


      </ul>
    </div>
  </div>
</div>


<div class="container">



    <sf:form method="POST" modelAttribute="users"  > <!-- Связать форму -->
      <fieldset> <!-- с атрибутом модели -->
        <sf:errors path="*" cssClass="error" />
        <table align="center" cellspacing="0" >
          <tr>
            <th><label for="user_lastname">Фамилия &nbsp;</label></th>
            <td><sf:input path="lastname" size="15" id="user_lastname"/></td>

          </tr>
          <tr><td>&nbsp;</td></tr>
          <tr>
            <th><label for="user_firstname">Имя</label></th>
            <td><sf:input path="firstname" size="15" maxlength="15"
                          id="user_firstname"/> <!-- Поле имени пользователя -->
            </td>
          </tr>
          <tr><td>&nbsp;</td></tr>
          <tr>
            <th><label for="user_email">эл.почта</label></th>
            <td><sf:input path="email" size="30"
                          id="user_email"/> <!-- Поле электронной почты -->
              <small></small>
            </td>
          </tr>
          <tr><td>&nbsp;</td></tr>
          <tr>
            <th><label for="user_phone">Телефон</label></th>
            <td><sf:input path="phone" size="15"
                          id="user_phone"/> <!-- Поле электронной почты -->
              <small></small>
            </td>
          </tr>
          <tr><td>&nbsp;</td></tr>

          <tr>
            <th><label for="user_login">Логин</label></th>
            <td><sf:input path="login" size="15"

                          id="user_login"/> <!-- Поле пароля -->
              <small></small>
            </td>
          </tr>
          <tr><td>&nbsp;</td></tr>
          <tr>
            <th><label for="user_password">Пароль </label></th>
            <td><sf:password path="password" size="30"
                             showPassword="true"
                             id="user_password"/> <!-- Поле пароля -->
              <small></small>
            </td>
          </tr>
          <tr>
            <td></td>
            <td align="right"> </td>
          </tr>
          <tr><td>

          </td></tr>
        </table>

        <sf:form modelAttribute="cars" method="post">
          <fieldset>
            <div class="addCar">
              <table align="center" class="table-car" >
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td></td>
                  <td colspan="5"><strong>Данные автомобиля:</strong> </td>
                  <td colspan="5"></td>

                </tr>
                <tr id="carVin_row">
                  <td></td>
                  <td colspan="3">VIN автомобиля</td>
                  <td colspan="2"></td>
                  <td colspan="3"><sf:input path="vincode" id="vincode" name="vincode" /> </td>
                  <td colspan="2"><a href="" <sf:button id="btn_vincode" /> </td>
                  <a href="http://www.google.com/">
                    <button>Visit Google</button>
                  </a>
</tr>
                     <tr>
                       <td></td>
                       <td colspan="3"> Название </td>
                       <td><input type="text" id="carName" value="АВТО" readonly="true" /> </td>
                       <td colspan="2"></td>

                     </tr>
                <tr>
                  <td></td>
                  <td colspan="3"> Модель: </td>

                  <td><input type="text" id="ca1" value="МОДЕЛЬ" readonly="true" /> </td>
                  <td colspan="2"></td>

                </tr>


                <tr id="carUrl_row">
                  <td></td>
                  <td colspan="3"> Адрес в сети: </td>
                  <td colspan="3"><input type="text" id="carUrl" value="25.15.59.227" readonly="true" /> </td>
                  <td colspan="2"></td>
                </tr>


                <tr>
                  <td align="left"><input type="button" id="addCar" name="addCar" value="Добавить еще авто"/> </td>
                  <%--<td align="right"><input type="button" id="removeCar" name="removeCar" value="Удалить авто"   /> </td>--%>
                </tr>




              </table>

            </div>
          </fieldset>
                </sf:form>





        <table align="right">
          <tr>
            <th></th>
            <td >
              <input name="commit" type="submit"
                     value="Продолжить"  />
            </td>
          </tr>
        </table>

      </fieldset>
    </sf:form>
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