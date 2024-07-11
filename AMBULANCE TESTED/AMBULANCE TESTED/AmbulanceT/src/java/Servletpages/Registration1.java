package Servletpages;

import connection.DBConnection;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
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
 * @author Elcot
 */
@WebServlet(name = "Registration1", urlPatterns = {"/Registration1"})
public class Registration1 extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
//    private boolean isMultipart;
//    private String filePath = "D:/";
//    // private String filePath = "/home/shri/project";
//    private int maxFileSize = 100 * 1024;
//    private int maxMemSize = 8 * 1024;
//    private File file;
//    public String iris = "";
//    public String fp = "";
//    DBConnection db = new DBConnection();
//    public  File file1;
//    public  FileInputStream  imageInFile;
//
//    public void init() {
//        // Get the file location where it would be stored.
//        //  filePath = getServletContext().getInitParameter("file-upload");
//    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
        PrintWriter out = response.getWriter();
        int id = 0;
        String name = "", email = "", phone = "", address = "", passwd = "", type = "";
        String imgPath = "";
        FingerScan fingerScan = new FingerScan();
        //fingerScan.init();
        //fingerScan.scanFinger();
        try {
            name = request.getParameter("Name");

            phone = request.getParameter("Mobile");;

            address = request.getParameter("Add");

            type = request.getParameter("type");

            email = request.getParameter("Email");

            passwd = request.getParameter("Passwd");
            DBConnection db = new DBConnection();
            String sql = "Select * from patient where uname='" + name + "'";
            ResultSet rs = db.Select(sql);
            if (rs.next()) {

                out.println("<script type=\"text/javascript\">");
                out.println("alert('These User already exists!');");
                out.println("location='c_register_1.jsp';");
                out.println("</script>");
                return;
            } else {
                String sql1 = "Insert into patient(uname,email,phone,address,passwd,type,imgPath,IrisSignature,status)values(?,?,?,?,?,?,?,?,?)";
                //+ name + "','" + email + "','" + phone + "','" + address + "','" + passwd + "','" + type + "','" + imgPath + "','0')";
                PreparedStatement ps = db.con.prepareStatement(sql1);
                ps.setString(1, name.trim());
                ps.setString(2, email.trim());
                ps.setString(3, phone.trim());
                ps.setString(4, address.trim());
                ps.setString(5, passwd.trim());
                ps.setString(6, type.trim());
                ps.setString(7, imgPath.trim());
                ps.setBytes(8, FingerScan.myfingerdata);
                ps.setString(9, "0");
                int result = ps.executeUpdate();
                if (result > 0) {
                    FingerScan.myfingerdata=null;
                            out.println("<script type=\"text/javascript\">");
                    out.println("alert('User registration successfully!');");
                    out.println("location='c_register_1.jsp';");
                    out.println("</script>");
                    return;
                } else {

                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('User registration not successfully!');");
                    out.println("location='c_register_1.jsp';");
                    out.println("</script>");
                    return;
                }
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

    public static String encodeImage(byte[] imageByteArray) {
        return Base64.encodeBase64URLSafeString(imageByteArray);
    }
}
