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
@WebServlet(name = "patient2", urlPatterns = {"/patient2"})
public class patient2 extends HttpServlet {

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
        HttpSession hs = request.getSession(true);
        try {
            /* TODO output your page here. You may use following sample code. */

            String name = hs.getAttribute("name").toString();
            String email = hs.getAttribute("email").toString();
            String phone = hs.getAttribute("mobile").toString();
            String address = hs.getAttribute("address").toString();
            String gender = request.getParameter("gender");
            String bgp = request.getParameter("bgp");
            String age = request.getParameter("age");
            String height = request.getParameter("height");
            String weight = request.getParameter("weight");
            String bmi = request.getParameter("bmi");
            String temp = request.getParameter("temp");
            String pr = request.getParameter("pr");
            String rr = request.getParameter("rr");
            String bp = request.getParameter("bp");

            DBConnection db = new DBConnection();

            String sql = "Select * from patient where uname='" + name + "'";
            ResultSet rs = db.Select(sql);
            if (rs.next()) {
                String query = "update patient set uname='" + name + "',email='" + email + "',phone='" + phone + "', address='" + address + "',gender='" + gender + "',bgp='" + bgp + "',age='" + age + "',height='" + height + "',weight='" + weight + "',bmi='" + bmi + "',temp='" + temp + "',pr='" + pr + "',rr='" + rr + "',bp='" + bp + "' where uname='" + name + "'";
                int result = db.Update(query);
                if (result > 0) {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Patient Records Successfully Created!');");
                    out.println("location='patient.jsp';");
                    out.println("</script>");

                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Not Inserted records!');");
                    out.println("location='patient.jsp';");
                    out.println("</script>");
                }
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Something Went Wrong!');");
                out.println("location='patient.jsp';");
                out.println("</script>");
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
