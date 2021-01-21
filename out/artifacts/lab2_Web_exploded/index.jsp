<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="se.ifmo.web.Point" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ru">
<head>
  <title>Grudoglo Nikita</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
        crossorigin="anonymous">
</head>
<body class="d-flex flex-column h-100">
<div class="header bg-light py-2">
  <h3 class="text-dark text-center">P3230 Грудогло Никита - Вариант 2600</h3>
</div>
<%--<main role="main" class="flex-shrink-0">--%>
  <div class="container">
    <div class="row justify-content-center my-3">
      <div class="align-self-center my-2">
        <canvas id="plot" width="250" height="250"></canvas>
        <% if(request.getServletContext().getAttribute("isCalculable") != null) {
          if (!(Boolean) request.getServletContext().getAttribute("isCalculable")) {
        %>
        <div class="text-center my-2">
          <span class="badge badge-danger">Невозможно вычислить</span>
        </div>
        <%  }
        }
        %>
      </div>
    </div>
    <form id="coordsForm" class="my-5 needs-validation" method="get" action="Controller" novalidate>
      <input type="hidden" id="xClick" name="xClick" value="">
      <input type="hidden" id="yClick" name="yClick" value="">
      <div class="form-row justify-content-center align-items-top">
        <div class="form-group col-3 align-self-end">
          <label>Выберите координату X</label>
          <div>
            <% for (int i = -4; i <= 4; i++) { %>
            <div class="form-check form-check-inline">
              <input class="form-check-input" required type="radio" name="xCoordinate" id="xCoordinate<%=i%>" value="<%=i%>">
              <label class="form-check-label" for="xCoordinate<%=i%>"><%=i%></label>
            </div>
            <% } %>
          </div>
          <div class="invalid-tooltip">Выберите значение</div>
        </div>
        <div class="form-group col-3 align-self-end">
          <label for="yCoordinate">Введите координату Y</label>
          <input class="form-control" id="yCoordinate" name="yCoordinate" type="text" autocomplete="off"
                 placeholder="Координата Y (от -3 до 3)" maxlength="17" required>
          <div class="invalid-tooltip" id="yTooltip">Введите значение</div>
        </div>
        <div class="form-group col-3 align-self-end">
          <label>Выберите радиус</label>
          <div id="btns_for_r">
            <button type="button" class="btn btn-secondary r_btn mt-1" value="1">1</button>
            <button type="button" class="btn btn-secondary r_btn mt-1" value="1.5">1.5</button>
            <button type="button" class="btn btn-secondary r_btn mt-1" value="2">2</button>
            <button type="button" class="btn btn-secondary r_btn mt-1" value="2.5">2.5</button>
            <button type="button" class="btn btn-secondary r_btn mt-1" value="3">3</button>
          </div>
          <input type="hidden" id="radius" name="radius">
        </div>
      </div>
      <div class="form-row justify-content-center mt-20">
        <button type="submit" class="btn btn-primary" id="coordsSubmit">Проверить</button>
      </div>
    </form>
    <div class="row justify-content-center">
      <div class="col-8">
        <table class="table table-hover table-bordered my-2">
          <thead class="thead-light">
          <tr>
            <th>Координата X</th>
            <th>Координата Y</th>
            <th>Радиус</th>
            <th>Попадание</th>
          </tr>
          </thead>
          <%
            List<Point> points = new ArrayList<>();

            if (!session.isNew() && session.getAttribute("points") != null) {
              points = (List<Point>) session.getAttribute("points");
              for (int i = 0; i < points.size(); i++) {
          %>
          <tr>
            <td><%=points.get(i).getX()%>
            </td>
            <td><%=points.get(i).getY()%>
            </td>
            <td><%=points.get(i).getRadius()%>
            </td>
            <td><%=points.get(i).getIsGood() ? "Да" : "Нет"%>
            </td>
          </tr>
          <%}
          }
          %>
        </table>
      </div>
    </div>
  </div>
<%--</main>--%>
<script src="js/drawGraph.js"></script>
<script src="js/submitClickCoords.js"></script>
<script src="js/validate.js"></script>
<script>
  <%--  window.onload = function(){--%>
  <%--    let ctx = canvas.getContext('2d');--%>
  <%--    console.log(ctx);--%>
  <%--    drawCanvas(ctx);--%>
  <%--    let r;--%>
  <%--    let x;--%>
  <%--    let y;--%>
  <%--    <% if (!session.isNew() && session.getAttribute("points") != null) {--%>

  <%--      for (int i = 0; i < points.size(); i++) {--%>
  <%--          %>--%>
  <%--        r = <%=points.get(i).getRadius()%>;--%>
  <%--        x = ((<%=points.get(i).getX()%> * xScale) / r) + 125;--%>
  <%--        y = -((<%=points.get(i).getY()%> * yScale) / r) + 125;--%>
  <%--        isGood = <%=points.get(i).getIsGood()%>;--%>

  <%--        if (x >= 250) {--%>
  <%--            x = 248;--%>
  <%--        }--%>
  <%--        if (x <= 0) {--%>
  <%--            x = 2;--%>
  <%--        }--%>
  <%--        if (y >= 250) {--%>
  <%--            y = 248;--%>
  <%--        }--%>
  <%--        if (y <= 0) {--%>
  <%--            y = 2;--%>
  <%--        }--%>

  <%--        ctx.globalAlpha = 0.8;--%>
  <%--        if (isGood) {--%>
  <%--            ctx.fillStyle = '#007b00';--%>
  <%--        } else {--%>
  <%--            ctx.fillStyle = '#f8051f';--%>
  <%--        }--%>
  <%--        ctx.beginPath();--%>
  <%--        ctx.arc(x, y, 2, 0, 2 * Math.PI);--%>
  <%--        ctx.fill();--%>
  <%--        ctx.closePath();--%>
  <%--        <%--%>
  <%--            }--%>
  <%--        }--%>
  <%--        %>--%>
  <%--};--%>
  window.onload = function(){
    let radiusBtns = document.querySelectorAll(".r_btn");
    let ctx = canvas.getContext('2d');
    console.log(ctx);
    console.log('window loaded');
    radiusBtns.forEach(btn => {
      btn.addEventListener('click', event => {
        let radius = document.getElementById('radius');
        ctx = canvas.getContext('2d');
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        drawCanvas(ctx);
        let r;
        let x;
        let y;
        <% if (!session.isNew() && session.getAttribute("points") != null) {

        for (int i = 0; i < points.size(); i++) {
            %>
        r = <%=points.get(i).getRadius()%>;

        console.log(r, radius.value);
        if (radius.value === r.toString()) {
          console.log('values are equal')
          x = ((<%=points.get(i).getX()%> * xScale) / r) + 125;
          y = (-((<%=points.get(i).getY()%> * yScale) / r) + 125);
          isGood = <%=points.get(i).getIsGood()%>;

          if (x >= 250) {
            x = 248;
          }
          if (x <= 0) {
            x = 2;
          }
          if (y >= 250) {
            y = 248;
          }
          if (y <= 0) {
            y = 2;
          }

          ctx.globalAlpha = 0.8;
          if (isGood) {
            ctx.fillStyle = '#007b00';
          } else {
            ctx.fillStyle = '#f8051f';
          }
          ctx.beginPath();
          ctx.arc(x, y, 2, 0, 2 * Math.PI);
          ctx.fill();
          ctx.closePath();
        }
        <%
            }
        }
        %>

      });
    });
  };
</script>
</body>
</html>