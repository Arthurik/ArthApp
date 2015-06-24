<%--
  Created by IntelliJ IDEA.
  User: salimhanov
  Date: 23.04.2015
  Time: 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"  %>

<%--<%@ include file="../main/head.jsp"%>--%>

<jsp:include page="../main/head.jsp" />

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

<table>
  <tr>
    <th></th>
    <td>
      <input name="commit" type="submit"
             value="Создать аккаунт"  />
    </td>
  </tr>
</table>
</fieldset>
</sf:form>
<script type="text/javascript" src="../../../resources/js/jquery-2.1.3.min.js">
</script>


<script type="text/javascript">
  $(document).ready(function () {
    $(".addCar").hide();
  })

  $("#addCar").click(function () {
    $(".addCar").show();
  });

  $("#removeCar").click(function () {
    $(".addCar").hide();
  });

</script>

</body>
</html>

