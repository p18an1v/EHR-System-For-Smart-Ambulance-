/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servletpages;

//import static Servletpages.Loginall1.encodeImage;
import connection.DBConnection;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;

/**
 *
 * @author Mayuri
 */
public class admin extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            HttpSession session = request.getSession(true);
            String uname = request.getParameter("username");
            String pass = request.getParameter("password");
            String type = request.getParameter("type");
            if (uname.equals("admin") && pass.equals("admin") && type.equals("Admin")) {
                response.sendRedirect("adminmenu.jsp");
            } else {

                DBConnection db = new DBConnection();

                String t1 = "Patient", t2 = "Hospital", t3 = "Police";
                String sql = "Select * from patient where uname='" + uname + "' and passwd='" + pass + "' and type= '" + type + "'and status='1'";
                ResultSet rs = db.Select(sql);
                if (rs.next()) {
                    String type1 = rs.getString("type");
                    String email = rs.getString("email");
                    String mobile = rs.getString("phone");
                    String address = rs.getString("address");
                    if (type1.equals(t1)) {
                        session.setAttribute("name", uname);           //create session
                        session.setAttribute("email", email);
                        session.setAttribute("mobile", mobile);
                        session.setAttribute("address", address);
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Login successfully!');");
                        out.println("location='patient.jsp';");
                        out.println("</script>");

                    }
                  
                } else {

                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Login Failed!');");
                    out.println("location='Login.jsp';");
                    out.println("</script>");
                    return;
                }
            }
        } catch (Exception e) {
            out.println(e);
        } finally {
            out.close();
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
