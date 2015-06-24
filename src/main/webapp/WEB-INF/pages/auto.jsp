<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Артур
  Date: 24.01.2015
  Time: 0:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <style type="text/css">
    body{
      background: #eee url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAMAAAC6sdbXAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAAZQTFRF3d3d////riJKgAAAAAJ0Uk5T/wDltzBKAAAAFUlEQVR42mJgBAEGGMmAxAYCgAADAAGGABmnk/7aAAAAAElFTkSuQmCC);
      font: 13px 'trebuchet MS', Arial, Helvetica;
    }


    .page {
      -webkit-box-sizing: content-box;
      -moz-box-sizing: content-box;
      box-sizing: content-box;
      width: 181px;
      margin: 2px;
      padding: 70px;
      overflow: hidden;
      border: 7px solid;
      border-bottom-width: 6px;
      -webkit-border-radius: 29px;
      border-radius: 29px;
      font: normal 18px/1 "Times New Roman", Times, serif;
      color: rgba(255,255,255,1);
      text-align: center;
      -o-text-overflow: ellipsis;
      text-overflow: ellipsis;
      background: #0199d9;
      -webkit-box-shadow: 1px 1px 1px 0 rgba(0,0,0,0.3) ;
      box-shadow: 1px 1px 1px 0 rgba(0,0,0,0.3) ;
      text-shadow: 1px 1px 1px rgba(0,0,0,0.2) ;
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

  </style>

  <title>Авто</title>
</head>
<body>
<div class="wrapper">
  <header> <div align="center">Заголовок</div></header>
<nav id="menu-wrap">
  <ul id="menu">
    <li><a href="/">Главная</a></li>
    <li>
      <a href="">Сервисы</a>
      <ul>
        <li>
          <a href="/auto">Состояние авто</a>
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
    <li><a href="/user">Авторизация</a></li>
    <li><a href="">Контакты</a></li>

  </ul>
</nav>

<div class="main-inform-page" class="page" align="center" >


</div>


</div>



<script type="text/javascript" src="../js/menu.js"></script>
</body>
</html>
