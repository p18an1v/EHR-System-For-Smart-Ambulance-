///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package Servletpages;
//
//import connection.DBConnection;
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.sql.ResultSet;
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
///**
// *
// * @author Mayuri
// */
//public class editpat1 extends HttpServlet {
//
//    /**
//     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
//     * methods.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//       try (PrintWriter out = response.getWriter()) {
//            HttpSession session = request.getSession(false);
//            String email = request.getParameter("email");
//            String uname=session.getAttribute("uname").toString();
//            String sql="Select * from patient where uname='"+uname+"' and email='"+email+"'";
//            DBConnection db=new DBConnection();
//            
//            ResultSet rs=db.Select(sql);
//            if(rs.next()){
//                out.println("location='editpatient1.jsp?id="+email+"");
//            }else{
//                 out.println("<script>");
//                     out.println("alert('Email id is wrong');");
//                 out.println("location='editpatient.jsp'");
//                     out.println("</script>");
//            }
//        } catch (Exception e) {
//            response.sendRedirect("edipatient2.jsp?message='Expired'");
//        }
//    }
//
//    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
//    /**
//     * Handles the HTTP <code>GET</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Returns a short description of the servlet.
//     *
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//}
