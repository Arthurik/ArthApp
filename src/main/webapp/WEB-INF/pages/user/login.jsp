<%--
  Created by IntelliJ IDEA.
  User: salimhanov
  Date: 19.03.2015
  Time: 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"  %>
<html>
<head>
    <title>Регистрация пользователя</title>
</head>
<body>
<sf:form method="POST" modelAttribute="spitter"> <!-- Связать форму -->
  <fieldset> <!-- с атрибутом модели -->
    <table cellspacing="0">
      <tr>
        <th><label for="user_full_name">Full name:</label></th>
        <td><sf:input path="fullName" size="15" id="user_full_name"/></td>
      </tr>
      <tr>
        <th><label for="user_screen_name">Username:</label></th>
        <td><sf:input path="username" size="15" maxlength="15"
                      id="user_screen_name"/> <!-- Поле имени пользователя -->
          <small id="username_msg">No spaces, please.</small>
        </td>
      </tr>
      <tr>
        <th><label for="user_password">Password:</label></th>
        <td><sf:password path="password" size="30"
                         showPassword="true"
                         id="user_password"/> <!-- Поле пароля -->
          <small>6 characters or more (be tricky!)</small>
        </td>
      </tr>
      <tr>
        <th><label for="user_email">Email Address:</label></th>
        <td><sf:input path="email" size="30"
                      id="user_email"/> <!-- Поле электронной почты -->
          <small>In case you forget something</small>
        </td>
      </tr>
      <tr>
        <th></th>
        <td>
          <sf:checkbox path="updateByEmail"
                       id="user_send_email_newsletter"/> <!-- Признак необходимости -->
</body>
</html>
