/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servletpages;

import connection.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Mayuri
 */
@WebServlet(name = "doctor", urlPatterns = {"/doctor"})
public class doctor extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
           
           String [] coordinates =request.getParameter("coordinates").toString().split(",");
            String name = request.getParameter("name");
            String mobile = request.getParameter("mobile");
            String email = request.getParameter("email");
            // String dr = request.getParameter("dr");
            String hn = request.getParameter("hn");
            String spec = request.getParameter("spec");
            String address = request.getParameter("address");
                      
            DBConnection db = new DBConnection();  
            
            String sql = "Select * from police_hospital where p_name='" + name + "'";
            ResultSet rs = db.Select(sql);
            if (rs.next()) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Hospital Already Added!');");
                out.println("location='doctor.jsp';");
                out.println("</script>");
            } else {
                String query = "insert into police_hospital (p_name,head_name,mobile,email,address,long_,lat_,status)values('" + hn + "','" + name + "','" + mobile + "','" + email + "','" + address + "','" + coordinates[1] + "','" + coordinates[0] + "','1')";
                int result = db.Insert(query);
                if (result > 0) {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Hospital Added successfully!');");
                    out.println("location='doctor.jsp';");
                    out.println("</script>");
                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Something Went Wrong!');");
                    out.println("location='doctor.jsp';");
                    out.println("</script>");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
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
