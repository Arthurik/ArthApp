<%--
  Created by IntelliJ IDEA.
  User: salimhanov
  Date: 22.04.2015
  Time: 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <script src="../../../resources/js/jquery-2.1.3.min.js"></script>
  <style type="text/css">
    body{
      background: #eee url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAMAAAC6sdbXAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAAZQTFRF3d3d////riJKgAAAAAJ0Uk5T/wDltzBKAAAAFUlEQVR42mJgBAEGGMmAxAYCgAADAAGGABmnk/7aAAAAAElFTkSuQmCC);
      font: 13px 'trebuchet MS', Arial, Helvetica;
    }

    #menu, #menu ul {
      margin: 0;
      padding: 0;
      list-style: none;
    }

    #menu {
      width: 960px;
      margin: 60px auto;
      border: 1px solid #222;
      background-color: #111;
      background-image: linear-gradient(#444, #111);
      border-radius: 6px;
      box-shadow: 0 1px 1px #777, 0 1px 0 #666 inset;
    }

    #menu:before,
    #menu:after {
      content: "";
      display: table;
    }

    #menu:after {
      clear: both;
    }

    #menu {
      zoom:1;
    }

    #menu li {
      float: left;
      border-right: 1px solid #222;
      box-shadow: 1px 0 0 #444;
      position: relative;
    }

    #menu a {
      float: left;
      padding: 12px 30px;
      color: #999;
      text-transform: uppercase;
      font: bold 12px Arial, Helvetica;
      text-decoration: none;
      text-shadow: 0 1px 0 #000;
    }

    #menu li:hover > a {
      color: #fafafa;
    }

    *html #menu li a:hover { /* IE6 only */
      color: #fafafa;
    }

    #menu ul {
      margin: 20px 0 0 0;
      _margin: 0; /*IE6 only*/
      opacity: 0;
      visibility: hidden;
      position: absolute;
      top: 38px;
      left: 0;
      z-index: 1;
      background: #444;
      background: linear-gradient(#444, #111);
      box-shadow: 0 -1px 0 rgba(255,255,255,.3);
      border-radius: 3px;
      transition: all .2s ease-in-out;
    }

    #menu li:hover > ul {
      opacity: 1;
      visibility: visible;
      margin: 0;
    }

    #menu ul ul {
      top: 0;
      left: 150px;
      margin: 0 0 0 20px;
      _margin: 0; /*IE6 only*/
      box-shadow: -1px 0 0 rgba(255,255,255,.3);
    }

    #menu ul li {
      float: none;
      display: block;
      border: 0;
      _line-height: 0; /*IE6 only*/
      box-shadow: 0 1px 0 #111, 0 2px 0 #666;
    }

    #menu ul li:last-child {
      -moz-box-shadow: none;
      -webkit-box-shadow: none;
      box-shadow: none;
    }

    #menu ul a {
      padding: 10px;
      width: 130px;
      _height: 10px; /*IE6 only*/
      display: block;
      white-space: nowrap;
      float: none;
      text-transform: none;
    }

    #menu ul a:hover {
      background-color: #0186ba;
      background-image: linear-gradient(#04acec, #0186ba);
    }

    #menu ul li:first-child > a {
      border-radius: 3px 3px 0 0;
    }

    #menu ul li:first-child > a:after {
      content: '';
      position: absolute;
      left: 40px;
      top: -6px;
      border-left: 6px solid transparent;
      border-right: 6px solid transparent;
      border-bottom: 6px solid #444;
    }

    #menu ul ul li:first-child a:after {
      left: -6px;
      top: 50%;
      margin-top: -6px;
      border-left: 0;
      border-bottom: 6px solid transparent;
      border-top: 6px solid transparent;
      border-right: 6px solid #3b3b3b;
    }

    #menu ul li:first-child a:hover:after {
      border-bottom-color: #04acec;
    }

    #menu ul ul li:first-child a:hover:after {
      border-right-color: #0299d3;
      border-bottom-color: transparent;
    }

    #menu ul li:last-child > a {
      -moz-border-radius: 0 0 3px 3px;
      -webkit-border-radius: 0 0 3px 3px;
      border-radius: 0 0 3px 3px;
    }

    /* Mobile */
    #menu-trigger {
      display: none;
    }

    @media screen and (max-width: 600px) {

      /* nav-wrap */
      #menu-wrap {
        position: relative;
      }

      #menu-wrap * {
        -moz-box-sizing: border-box;
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
      }

      /* menu icon */
      #menu-trigger {
        display: block; /* show menu icon */
        height: 40px;
        line-height: 40px;
        cursor: pointer;
        padding: 0 0 0 35px;
        border: 1px solid #222;
        color: #fafafa;
        font-weight: bold;
        background-color: #111;
        background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABIAAAAPCAMAAADeWG8gAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyBpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNSBXaW5kb3dzIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjE2QjAxNjRDOUNEOTExRTE4RTNFRkI1RDQ2MUYxOTQ3IiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOjE2QjAxNjREOUNEOTExRTE4RTNFRkI1RDQ2MUYxOTQ3Ij4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6MTZCMDE2NEE5Q0Q5MTFFMThFM0VGQjVENDYxRjE5NDciIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6MTZCMDE2NEI5Q0Q5MTFFMThFM0VGQjVENDYxRjE5NDciLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz42AEtnAAAABlBMVEX///////9VfPVsAAAAAnRSTlP/AOW3MEoAAAAWSURBVHjaYmAgFzBiACKFho6NAAEGAD07AG1pn932AAAAAElFTkSuQmCC) no-repeat 10px center, linear-gradient(#444, #111);
        border-radius: 6px;
        box-shadow: 0 1px 1px #777, 0 1px 0 #666 inset;
      }

      /* main nav */
      #menu {
        margin: 0; padding: 10px;
        position: absolute;
        top: 40px;
        width: 100%;
        z-index: 1;
        background-color: #444;
        display: none;
        box-shadow: none;
      }

      #menu:after {
        content: '';
        position: absolute;
        left: 25px;
        top: -8px;
        border-left: 8px solid transparent;
        border-right: 8px solid transparent;
        border-bottom: 8px solid #444;
      }

      #menu ul {
        position: static;
        visibility: visible;
        opacity: 1;
        margin: 0;
        background: none;
        box-shadow: none;
      }

      #menu ul ul {
        margin: 0 0 0 20px !important;
        box-shadow: none;
      }

      #menu li {
        position: static;
        display: block;
        float: none;
        border: 0;
        margin: 5px;
        box-shadow: none;
      }

      #menu ul li{
        margin-left: 20px;
        box-shadow: none;
      }

      #menu a{
        display: block;
        float: none;
        padding: 0;
        color: #999;
      }

      #menu a:hover{
        color: #fafafa;
      }

      #menu ul a{
        padding: 0;
        width: auto;
      }

      #menu ul a:hover{
        background: none;
      }

      #menu ul li:first-child a:after,
      #menu ul ul li:first-child a:after {
        border: 0;
      }

    }

    @media screen and (min-width: 600px) {
      #menu {
        display: block !important;
      }
    }

    /* iPad */
    .no-transition {
      transition: none;
      opacity: 1;
      visibility: visible;
      display: none;
    }

    #menu li:hover > .no-transition {
      display: block;
    }

    .table-car { }

      table.table-car {
        border:1px solid #000000;

      }

      tr.table-car{
        border: 0;
      }

    td.table-car{
      border: 0;
    }




  </style>



  <title>This is a title</title>
</head>
<body>

<nav id="menu-wrap">
  <ul id="menu">
    <li><a href="/">Главная</a></li>
    <li>
      <a href="">Сервисы</a>
      <ul>
        <li>
          <a href="/auto">Состояние автомобиля</a>
          <ul>
            <li><a href="">История запросов статуса</a></li>
            <li><a href="">Расположение на карте</a></li>
            <li><a href="">Треки перемещиений</a></li>
            <li><a href=""></a></li>
          </ul>
        </li>
        <li>
          <a href="">Graphic design</a>
          <ul>
            <li><a href="">Item 21</a></li>
            <li><a href="">Item 22</a></li>
            <li><a href="">Item 23</a></li>
            <li><a href="">Item 24</a></li>
          </ul>
        </li>
        <li>
          <a href="">Development tools</a>
          <ul>
            <li><a href="">Item 31</a></li>
            <li><a href="">Item 32</a></li>
            <li><a href="">Item 33</a></li>
            <li><a href="">Item 34</a></li>
          </ul>
        </li>
      </ul>
    <li><a href="">Блог</a></li>

    <li><a href="/users">Авторизация</a></li>
    <li><a href="">Контакты</a></li>

  </ul>
</nav>

<script type="text/javascript" src="../js/menu.js"></script>




<sf:form method="POST" modelAttribute="users"  > <!-- Связать форму -->
  <fieldset> <!-- с атрибутом модели -->
    <sf:errors path="*" cssClass="error" />
    <table align="center" cellspacing="0" >
      <tr>
        <th><label for="user_lastname">Фамилия</label></th>
        <td><sf:input path="lastname" size="15" id="user_lastname"/></td>

      </tr>
      <tr>
        <th><label for="user_firstname">Имя</label></th>
        <td><sf:input path="firstname" size="15" maxlength="15"
                      id="user_firstname"/> <!-- Поле имени пользователя -->
          <small id="firstname_msg">Введите имя</small>

        </td>
      </tr>
      <tr>
        <th><label for="user_email">Почта:</label></th>
        <td><sf:input path="email" size="30"
                      id="user_email"/> <!-- Поле электронной почты -->
          <small>поле обязательно для заполнения</small>
        </td>
      </tr>

      <tr>
        <th><label for="user_phone">Телефон</label></th>
        <td><sf:input path="phone" size="15"
                      id="user_phone"/> <!-- Поле электронной почты -->
          <small>поле обязательно для заполнения</small>
        </td>
      </tr>


      <tr>
        <th><label for="user_login">Логин</label></th>
        <td><sf:input path="login" size="15"

                      id="user_login"/> <!-- Поле пароля -->
          <small>поле обязательно для заполнения</small>
        </td>
      </tr>

      <tr>
        <th><label for="user_password">Пароль </label></th>
        <td><sf:password path="password" size="30"
                         showPassword="true"
                         id="user_password"/> <!-- Поле пароля -->
          <small>6 и более символов</small>
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
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
            </tr>
            <tr>
              <td></td>
              <td colspan="5"><strong>Данные автомобиля:</strong> </td>
              <td colspan="5"></td>


            </tr>
            <tr id="carName_row">
              <td></td>
              <td colspan="3"> <label for="carName_row">Марка:</label></td>
              <td></td>
              <td colspan="3"><sf:input path="name" id="carName"/></td>
              <td colspan="2"></td>


              <%-- <tr id="carModel_row">
                 <td></td>
                 <td colspan="3"> Модель: </td>
                 <td><sf:input path="model" id="carModel" /> </td>
                 <td colspan="2"></td>

               </tr>--%>

            <tr id="carUrl_row">
              <td></td>
              <td colspan="3"> Адрес в сети: </td>
              <td></td>
              <td colspan="3"><sf:input path="url" id="carUrl"/> </td>
              <td colspan="2"></td>
            </tr>
            <tr>
              <td align="left"><input type="button" id="addCar" name="addCar" value="Добавить еще авто"/> </td>
              <td align="right"><input type="button" id="removeCar" name="removeCar" value="Удалить авто"   /> </td>
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