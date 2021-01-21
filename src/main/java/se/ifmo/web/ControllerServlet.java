package se.ifmo.web;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ControllerServlet", urlPatterns = {"/Controller"})
public class ControllerServlet extends HttpServlet {
    private boolean isValid(String radius, String xClick, String yClick, String xCoordinate, String yCoordinate) {
        try {
            if (radius != null) {
                if (!radius.isEmpty()) {
                    Double.parseDouble(radius);
                }
            }
            if (xClick != null) {
                if (!xClick.isEmpty()) {
                    Double.parseDouble(xClick);
                }
            }
            if (yClick != null) {
                if (!yClick.isEmpty()) {
                    Double.parseDouble(yClick);
                }
            }
            if (xCoordinate != null) {
                if (!xCoordinate.isEmpty()) {
                    Double.parseDouble(xCoordinate);
                }
            }
            if (yCoordinate != null) {
                if (!yCoordinate.isEmpty()) {
                    Double.parseDouble(yCoordinate);
                }
            }
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String urlPattern;
        String radius = request.getParameter("radius");
        String xClick = request.getParameter("xClick");
        String yClick = request.getParameter("yClick");
        String yCoordinate = request.getParameter("yCoordinate");
        String xCoordinate = request.getParameter("xCoordinate");

        if (radius.equals("") &&
                (!xClick.isEmpty() ||
                        !request.getParameter("yClick").isEmpty())) {
            request.getServletContext().setAttribute("isCalculable", false);
            urlPattern = "/index.jsp";
        } else if (radius.equals("") && request.getParameter("xCoordinate") == null &&
                request.getParameter("yCoordinate").isEmpty() && xClick.isEmpty() &&
                request.getParameter("yClick").isEmpty()) {
            request.getServletContext().setAttribute("isCalculable", false);
            urlPattern = "/index.jsp";
        }
        else {
            if (!isValid(radius, xClick, yClick, xCoordinate, yCoordinate)) {
                request.getServletContext().setAttribute("isCalculable", false);
                urlPattern = "/index.jsp";
            } else {
                request.getServletContext().setAttribute("isCalculable", true);
                urlPattern = "/AreaCheck";
            }
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher(urlPattern);
        requestDispatcher.forward(request, response);
    }
}
