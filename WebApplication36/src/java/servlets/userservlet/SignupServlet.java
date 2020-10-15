/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.userservlet;

import database.UserDaoImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Locations;
import models.Users;
import util.JavaMail;

/**
 *
 * @author Jelena Jovanovic
 */
public class SignupServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDaoImpl udi = new UserDaoImpl();
        HttpSession session = request.getSession();
        if (!udi.existUserByUsername(request.getParameter("signupusername")) && !udi.existUserByPassword(request.getParameter("signuppassword")) && !udi.existUserByEmail(request.getParameter("signupemail"))) {
            Users user = new Users(request.getParameter("signupfirstname"), request.getParameter("signuplastname"), request.getParameter("signupusername"), request.getParameter("signuppassword"), request.getParameter("signupemail"), "False", "regular");
            String roleOfLoginUser = "";
            if (session.getAttribute("user_id") != null && session.getAttribute("user_role").equals("admin")) {
                roleOfLoginUser = (String) session.getAttribute("user_role");
                user.setRole(request.getParameter("signuprole"));
                user.setActive("True");
                if (user.getRole().equals("treasurer")) {
                    user.setLocation(new Locations());
                    user.getLocation().setId(Integer.parseInt(request.getParameter("signuplocation")));
                }

            }
            udi.insertUser(user, roleOfLoginUser);
            if (session.getAttribute("user_id") != null && session.getAttribute("user_role").equals("admin")) {
                int id = Integer.parseInt(((String) session.getAttribute("user_id")));
                String emailfrom = udi.getUserEmailById(id);
                String emailto = request.getParameter("signupemail");
                JavaMail.setFrom(emailfrom);
                JavaMail.setTo(emailto);
                JavaMail.sendMail();
            }
            session.setAttribute("signupMessage", "Succsessful sign up");
            response.sendRedirect("home");
        } else {
            String signupFail = "";
            if (udi.existUserByUsername(request.getParameter("signupusername"))) {
                signupFail = "Username already exists. <br>";
            }
            if (udi.existUserByPassword(request.getParameter("signuppassword"))) {
                signupFail += "Password already exist. <br>";

            }
            if (udi.existUserByEmail(request.getParameter("signupemail"))) {
                signupFail += "Email already exist. <br>";
            }
            if (session.getAttribute("user_id") != null && session.getAttribute("user_role").equals("admin")) {

                ArrayList<Locations> locations = udi.getLocations();
                request.setAttribute("locations", locations);
            }
            request.setAttribute("signupFail", signupFail);

            RequestDispatcher dispatcher = getServletContext()
                    .getRequestDispatcher("/user/signup.jsp");
            dispatcher.forward(request, response);
            //session.setAttribute("signupFail", signupFail);

            // response.sendRedirect("signup");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
