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
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author PhoenixZone1
 */
public class FindNearest extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession(true);
            DBConnection db = new DBConnection();
            String uname = session.getAttribute("uname").toString();
            String ambulanceid = request.getParameter("ambulance");
            String[] location = session.getAttribute("location").toString().split(",");
            String [] drpolice=null;
            double fixlat = Double.parseDouble(location[0]);
            double fixlog = Double.parseDouble(location[1]);
            JSONArray jsonArray = new JSONArray();
            JSONObject json = new JSONObject();
            JSONObject json1 = new JSONObject();
            double min_dist1 = 0;
            String h_name="";
            String address="";
            String gender=""; 
            String bgp=""; 
            
            String age="";
            String weight="";
            String bmi="";
            String sqlp = "Select * from patient where uname='"+uname+"'";
            ResultSet rsp = db.Select(sqlp);
            if(rsp.next())
            {
               address=rsp.getString("address");
                gender=rsp.getString("gender");
                 bgp=rsp.getString("bgp");
                  age=rsp.getString("age");
                   weight=rsp.getString("weight");
                    bmi=rsp.getString("bmi");
                     
            }
           
            String sql = "Select * from police_hospital where status='1'";
            ResultSet rs = db.Select(sql);
            String area1 = "";
            String drmobile="";
            double minlat = 0.0, minlon = 0.0;
            while (rs.next()) {
                double lat = Double.parseDouble(rs.getString("lat_"));
                double lon = Double.parseDouble(rs.getString("long_"));
                String area = rs.getString("address");
               String dr=rs.getString("mobile");
               String hname=rs.getString("p_name");
                // al.add(area);
                if (min_dist1 == 0) {
                    min_dist1 = distFrom(lat, lon, fixlat, fixlog);
                    area1 = area;
                    drmobile=dr;
                    h_name=hname;
                    minlat = Double.parseDouble(rs.getString("lat_"));
                    minlon = Double.parseDouble(rs.getString("long_"));
                }

                double min_dist = distFrom(lat, lon, fixlat, fixlog);

                if (min_dist < min_dist1) {
                    minlat = Double.parseDouble(rs.getString("lat_"));
                    minlon = Double.parseDouble(rs.getString("long_"));
                    min_dist1 = min_dist;
                    area1 = area;
                    drmobile=dr;
                    h_name=hname;

                }

            }
            json1.put("name", area1);
            json1.put("lat", minlat);
            json1.put("lng", minlon);
            json1.put("color", "green");
            jsonArray.put(json1);
            //For Police
            String sql1 = "Select * from police_hospital where status='0'";
            ResultSet rs1 = db.Select(sql1);
            String area3 = "";
            double lat1 = 0.0, lon1 = 0.0;
            double min_distp = 0;
            String p_name="";
          min_dist1=0;
        String  pomobile="";
            while (rs1.next()) {
                double lat = Double.parseDouble(rs1.getString("lat_"));
                double lon = Double.parseDouble(rs1.getString("long_"));
                String area = rs1.getString("address");
                String po=rs1.getString("mobile");
                String pname=rs1.getString("p_name");
                // al.add(area);
                if (min_dist1 == 0) {
                    min_dist1 = distFrom(lat, lon, fixlat, fixlog);
                    area1 = area;
                    minlat = Double.parseDouble(rs1.getString("lat_"));
                    minlon = Double.parseDouble(rs1.getString("long_"));
                    pomobile=po;
                    p_name=pname;
                }

                double min_dist = distFrom(lat, lon, fixlat, fixlog);

                if (min_dist < min_dist1) {
                    minlat = Double.parseDouble(rs1.getString("lat_"));
                    minlon = Double.parseDouble(rs1.getString("long_"));
                    min_dist1 = min_dist;
                    area1 = area;
                    pomobile=po;
                    p_name=pname;

                }
            }
            json1=new JSONObject();
            json1.put("name", area1);
            json1.put("lat", minlat);
            json1.put("lng", minlon);
            json1.put("color", "yellow");
            jsonArray.put(json1);
           // System.out.println(jsonArray);
           json1=new JSONObject();
            json1.put("name", "My Location");
            json1.put("lat", fixlat);
            json1.put("lng", fixlog);
            json1.put("color", "Blue");
            jsonArray.put(json1);
            System.out.println("Minimum hospital and police station are:   "+jsonArray);
            session.setAttribute("uname", uname);
            session.setAttribute("ambulance_id", ambulanceid);
            session.setAttribute("array1", jsonArray);//create session
            String message="Dear doctor"+h_name+ "\n One patient is coming towards your hospital, \n Patient details are as follow: \n Name: "
                    +uname+", Address:"+address+", Gender:"+gender+", Blood Group:"+bgp+", Age:"+age+", Weight:"+weight+", Body-Mass Index:"+bmi+"." ;
                    String msg="Dear Police"+p_name+ "\n One patient has injured, \n Citizen details are as follow: \n Name: "
                    +uname+", Address:"+address+", Gender:"+gender+", Blood Group:"+bgp+", Age:"+age+", Weight:"+weight+", Body-Mass Index:"+bmi+"." ;
            JavaCode jc= new JavaCode();
            jc.sendMessage(drmobile, message);
              jc.sendMessage(pomobile, msg);
            response.sendRedirect("view_nearest.jsp");

        } catch (Exception ee) {
            ee.printStackTrace();
        }
    }

    public static double distFrom(double lat1, double lng1, double lat2, double lng2) {
        double earthRadius = 6371000; //meters
        double dLat = Math.toRadians(lat2 - lat1);
        double dLng = Math.toRadians(lng2 - lng1);
        double a = Math.sin(dLat / 2) * Math.sin(dLat / 2)
                + Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2))
                * Math.sin(dLng / 2) * Math.sin(dLng / 2);
        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        double dist = (double) (earthRadius * c);

        return dist;
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
