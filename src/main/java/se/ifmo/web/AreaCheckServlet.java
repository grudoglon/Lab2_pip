package se.ifmo.web;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AreaCheckServlet", urlPatterns = {"/AreaCheck"})
public class AreaCheckServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassCastException {

        double x = parseXRequest(request);
        double y = parseYRequest(request);
        double r = Double.parseDouble(request.getParameter("radius"));

        List<Point> points = new ArrayList<>();

        HttpSession httpSession = request.getSession();
        if (httpSession.getAttribute("points") != null) {
            points = (List<Point>) httpSession.getAttribute("points");
        } else {
            httpSession.setMaxInactiveInterval(300);
        }

        points.add(new Point(x, y, r));

        httpSession.setAttribute("points", points);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/result.jsp");
        requestDispatcher.forward(request, response);
    }

    private Double parseXRequest(HttpServletRequest request) {
        if (!request.getParameter("xClick").isEmpty()) {
            return Double.parseDouble(request.getParameter("xClick"));
        } else {
            return Double.parseDouble(request.getParameter("xCoordinate"));
        }
    }

    private Double parseYRequest(HttpServletRequest request) {
        if (!request.getParameter("yClick").isEmpty()) {
            return Double.parseDouble(request.getParameter("yClick"));
        } else {
            return Double.parseDouble(
                    request.getParameter("yCoordinate")
                            .trim().replaceAll(",", "."));
        }
    }
}