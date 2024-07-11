/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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
@WebServlet(name = "NewServlet", urlPatterns = {"/NewServlet"})
public class NewServlet extends HttpServlet {

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
    private String filePath;
    private int maxFileSize = 50 * 1024;
    private int maxMemSize = 4 * 1024;
    private File file;

    DBConnection db = new DBConnection();
    Statement st = db.st;

    public void init() {
        // Get the file location where it would be stored.
        filePath = getServletContext().getInitParameter("file-upload");
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

        isMultipart = ServletFileUpload.isMultipartContent(request);
        response.setContentType("text/html");
        java.io.PrintWriter out = response.getWriter();
        if (!isMultipart) {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet upload</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<p>No file uploaded</p>");
            out.println("</body>");
            out.println("</html>");
            return;
        }
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // maximum size that will be stored in memory
        factory.setSizeThreshold(maxMemSize);
        // Location to save data that is larger than maxMemSize.
        factory.setRepository(new File("c:\\temp"));

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);
        // maximum file size to be uploaded.
        upload.setSizeMax(maxFileSize);

        String name = "", Type = "", passwd = "";
        int flag = 1;

        try {
 HttpSession session = request.getSession(true);
            List fileItems = upload.parseRequest(request);
            // Process the uploaded file items
            Iterator i = fileItems.iterator();

            ArrayList allfilenames = new ArrayList();
            ArrayList allsignatures = new ArrayList();

            while (i.hasNext()) {
                FileItem fi = (FileItem) i.next();
                if (!fi.isFormField()) {
                    // Get the uploaded file parameters
                    String fieldName = fi.getFieldName();
                    String fileName = fi.getName();
                    String contentType = fi.getContentType();
                    boolean isInMemory = fi.isInMemory();
                    long sizeInBytes = fi.getSize();
                    // Write the file
                    if (fileName.lastIndexOf("\\") >= 0) {
                        file = new File(filePath
                                + fileName.substring(fileName.lastIndexOf("\\")));
                    } else {
                        file = new File(filePath
                                + fileName.substring(fileName.lastIndexOf("\\") + 1));
                    }
                    fi.write(file);
                    String newfilepath = file.getAbsolutePath();
                    System.out.println("Uploaded Filename: " + fileName);
                    //System.out.println("Uploaded File Path: "+newfilepath);

                    String extension = "";
                    if (fileName.lastIndexOf(".") != -1 && fileName.lastIndexOf(".") != 0) {
                        extension = fileName.substring(fileName.lastIndexOf(".") + 1);
                    }

                    ServletContext sc = this.getServletContext();
                    String sg1 = sc.getRealPath("/");
                    String fname = sg1.substring(0, sg1.indexOf("build"));
                    String filename1 = fname + "web/uploads/" + fileName.trim();

                    BufferedImage originalImage = ImageIO.read(new File(newfilepath));
                    File file1 = new File(filename1.trim());
                    ImageIO.write(originalImage, extension.trim(), file1);

                    FileInputStream imageInFile = new FileInputStream(file1);
                    byte imageData[] = new byte[(int) file1.length()];
                    imageInFile.read(imageData);

                    String signature = encodeImage(imageData);
                    //System.out.println("signature: "+signature);

                    allfilenames.add(fileName.trim());
                    allsignatures.add(signature.trim());
                } else {
                    String fieldname = fi.getFieldName();//text1
                    String value = fi.getString();
                    if (fieldname.trim().equals("username")) {
                        name = value.trim();
                    }
                    if (fieldname.trim().equals("type")) {
                        Type = value.trim();
                    }
                    if (fieldname.trim().equals("password")) {
                        passwd = value.trim();
                    }
                }
            }
            if (!(allfilenames.isEmpty())) {
                String irisimage = allfilenames.get(0).toString().trim();
                String image = allsignatures.get(0).toString().trim();
                String type = request.getParameter("type");
                String t1 = "Patient", t2 = "Hospital", t3 = "Police";
                System.out.println("irissig: " + image.trim());
                String sql = "select * from patient where uname='" + name.trim() + "' and passwd='" + passwd.trim() + "' and  image2='" + image.trim() + "' and type='" + Type + "'";
                ResultSet rs = db.Select(sql);

                if (rs.next()) {
                    String type1 = rs.getString("type");
                    String email = rs.getString("email");
                    String mobile = rs.getString("phone");
                    String address = rs.getString("address");
                    String image2 = request.getParameter("image2");
                    String status1 = rs.getString("status");

                    if (status1.equals("yes")) {
                    session.setAttribute("name", name);           //create session
                    session.setAttribute("email", email); 
                    session.setAttribute("mobile", mobile); 
                    session.setAttribute("address", address); 
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Login successfully!');");
                    out.println("location='patient.jsp';");
                    out.println("</script>");
                    } else {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Please Answer Question First');");
                        out.println("location='Questions.jsp';");
                        out.println("</script>");
                    }

                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Username or password or Iris image or Fingerprint images are invalid!');");
                    out.println("location='Login.jsp';");
                    out.println("</script>");
                }
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Browse images!');");
                out.println("location='Login.jsp';");
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

    public static String encodeImage(byte[] imageByteArray) {
        return Base64.encodeBase64URLSafeString(imageByteArray);
    }
}
