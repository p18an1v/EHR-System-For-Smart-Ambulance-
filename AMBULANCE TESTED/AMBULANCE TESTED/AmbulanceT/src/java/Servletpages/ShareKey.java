/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servletpages;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import connection.DBConnection;
import connection.MailUtil;

/**
 *
 * @author Mayuri
 */
public class ShareKey extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
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
            String id = request.getParameter("id");
            //String name = request.getParameter("name");
            String email = request.getParameter("email");
                
            DBConnection db = new DBConnection();
            String query = "Select * from patient";
            ResultSet r = db.Select(query);
            if (r.next()) {
                if (email.equals(r.getString("email"))) {
                    String sql = "Select * from patient where email='" + id + "'";
                    ResultSet rs = db.Select(sql);
                    if (rs.next()) {
                        String uname = rs.getString("uname");
                        String sql1 = "Select * from files where uname='" + uname + "'";
                        ResultSet rs1 = db.Select(sql1);
                        if (rs1.next()) {
                            String key = rs1.getString("hashkey");
                            String sql2 = "Insert into patient(hashkey,uname)values('" + id + "','" + key + "','" + uname + "');";
                            int i = db.Update(sql2);

                            String name = " ";
                            name = " + email + ";
                            name = name.substring(0, name.lastIndexOf(","));
                            if (name.contains(",")) {
                                String mail[] = name.split(",");
                                MailUtil mm = new MailUtil();
                                String msg = "Hello, File Updated by Patient \n Patient Name : '" + uname + "'  \n hashkey = '" + key + "'";
                                mm.sendMail(mail, mail, "File Updated", msg);
                            } else if (!name.equals("")) {
                                String mail[] = {name};
                                MailUtil mm = new MailUtil();
                                String msg = "Hello, File uploaded from Ambulance Tracking Admin for you. from uname= '" + id + "' hashkey = '" + key + "'";
                                mm.sendMail(mail, mail, "File Uploaded", msg);
                            } else {
                                out.println("<script>");
                                out.println("alert('Something went wrong!')");
                                out.println("location='Share.jsp'");
                                out.println("</script>");
                            }
                            out.println("<script>");
                            out.println("alert('Secret Key Successfully Sent on Mail !')");
                            out.println("location='ViewRecords.jsp'");
                            out.println("</script>");
                        }
                    }
                } else {
                    out.println("<script>");
                    out.println("alert('Email is wrong!')");
                    out.println("location='Share.jsp'");
                    out.println("</script>");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
