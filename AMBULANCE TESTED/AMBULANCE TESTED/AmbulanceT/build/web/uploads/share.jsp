/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pack.Dbconnection;
import pack.MailUtil;

/**
 *
 * @author Jyoti
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
            String demail = request.getParameter("mail1");
            

            Connection con = Dbconnection.getConn();
            Statement st = con.createStatement();
            Dbconnection db = new Dbconnection();
            String query = "Select * from actuary_reg";
            ResultSet r = st.executeQuery(query);
            if (r.next()) {
                if (demail.equals(r.getString("mail")) || remail.equals(r.getString("mail")) || memail.equals(r.getString("mail")) || aemail.equals(r.getString("mail")) || eemail.equals(r.getString("mail"))) {
                    String sql = "Select * from patient_record where email='" + id + "'";
                    ResultSet rs = st.executeQuery(sql);
                    if (rs.next()) {
                        String fname = rs.getString("fname");
                        String lname = rs.getString("lname");
                        String filename = rs.getString("filename");
                        String sql1 = "Select * from files where filename='" + filename + "'";
                        ResultSet rs1 = st.executeQuery(sql1);
                        if (rs1.next()) {
                            String key = rs1.getString("hashkey");
                            String ownername = rs1.getString("owner_name");
                            String sql2 = "Insert into sharekey(eDoctor,eRelative,eMedical,eActuary,eEmergency,owner,sharekey,ownername,filename)values('" + demail + "', '" + remail + "','" + memail + "','" + aemail + "','" + eemail + "','" + id + "','" + key + "','" + ownername + "','" +filename + "');";
                            int i = st.executeUpdate(sql2);

                            String name = " ";
                            name = demail + "," + remail + "," + memail + "," + aemail + "," + eemail;
                            name = name.substring(0, name.lastIndexOf(","));
                            if (name.contains(",")) {
                                String mail[] = name.split(",");
                                MailUtil mm = new MailUtil();
                                String msg = "Hello, File uploaded by PHR Owner '" + ownername + "'for you.\n Patient Name : '" + fname + "' '" + lname + "'\n Filename :'" + filename + "' \n haskkey = '" + key + "'";
                                mm.sendMail(mail, mail, "File Uploaded", msg);
                            } else if (!name.equals("")) {
                                String mail[] = {name};
                                MailUtil mm = new MailUtil();
                                String msg = "Hello, File uploaded from PHR Owner for you.\n Filename ='" + filename + "' from Ownername= '" + id + "' haskkey = '" + key + "'";
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
