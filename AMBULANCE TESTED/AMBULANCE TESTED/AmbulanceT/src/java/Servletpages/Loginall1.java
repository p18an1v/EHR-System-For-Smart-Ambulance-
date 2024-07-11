/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servletpages;

import com.sun.org.apache.xalan.internal.xsltc.compiler.util.ErrorMsg;
import connection.DBConnection;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.codec.binary.Base64;

/**
 *
 * @author Mayuri
 */
@WebServlet(name = "Loginall1", urlPatterns = {"/Loginall1"})
public class Loginall1 extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private boolean isMultipart;
    private String filePath = "D://compare";
    // private String filePath = "/home/shri/project";
    private int maxFileSize = 500 * 1024;
    private int maxMemSize = 100 * 1024;
    private File file;
    File file1;
    double veriable_ = 0.0;
    public String fp = "";
    DBConnection db = new DBConnection();
    Statement st = db.st;
    String fileName = "";
    String f_patient = "";

    public void init() {
        // Get the file location where it would be stored.
        // filePath = getServletContext().getInitParameter("file-upload");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Check that we have a file upload request

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
        System.out.println("Here come in");
        PrintWriter out = response.getWriter();

//        isMultipart = ServletFileUpload.isMultipartContent(request);
//        response.setContentType("text/html");
//        java.io.PrintWriter out = response.getWriter();
//        if (!isMultipart) {
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet upload</title>");
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<p>No file uploaded</p>");
//            out.println("</body>");
//            out.println("</html>");
//            return;
//        }
//        DiskFileItemFactory factory = new DiskFileItemFactory();
//        // maximum size that will be stored in memory
//        factory.setSizeThreshold(maxMemSize);
//        // Location to save data that is larger than maxMemSize.
//        factory.setRepository(new File("c:\\temp"));
//
//        // Create a new file upload handler
//        ServletFileUpload upload = new ServletFileUpload(factory);
//        // maximum file size to be uploaded.
//        upload.setSizeMax(maxFileSize);
        try {
            HttpSession session = request.getSession(true);
            DBConnection db = new DBConnection();
            String ambulanceid = request.getParameter("ambulance");
            String location = request.getParameter("location");
           FingerScan fingerScan = new FingerScan();
           
            String sql = "Select * from patient";
            ResultSet rs = db.Select(sql);
            session.removeAttribute("uname");
            while (rs.next()) {
                f_patient = rs.getString("uname");

                byte Content[] = {};

                Content = rs.getBytes("IrisSignature");

                if (fingerScan.fingerMatch(Content)) {
                    FingerScan.myfingerdata = null;
                 System.out.println("matched with id:" + f_patient);
            session.setAttribute("uname", f_patient);
            session.setAttribute("ambulance_id", ambulanceid);
            session.setAttribute("location", location);
                    break;
                } else {
                    continue;
                }

            }
            //create session
            if(session.getAttribute("uname")!=null)
            {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Patient Record Found!');");
            
            out.println("location='pprint_1.jsp?';");
            out.println("</script>");
            }
            else
            {
                out.println("<script type=\"text/javascript\">");
            out.println("alert('Patient Record not matched!');");
            
            out.println("location='a_info.jsp?';");
            out.println("</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
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
