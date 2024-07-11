/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servletpages;

import connection.DBConnection;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author Pramod
 */
public class SendLocation extends HttpServlet {

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
        try  {
            /* TODO output your page here. You may use following sample code. */
            PrintWriter out = response.getWriter();
            double lat1 = Double.parseDouble(request.getParameter("latitude"));
            double lon1 = Double.parseDouble(request.getParameter("longitude"));
              JSONObject json = new JSONObject();
            JSONArray jSONArray = new JSONArray();
          double lat=18.12545;
          double lon=73.454654;
            double d=distance(lat1, lon1, lat, lon, 'K');
           if(d>10)
           {
               System.err.println("Signal Change");
               try {
                            String url12 = "http://192.168.0.109//H";
                            URL url = new URL(url12);
                            HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
                            urlconnection.setRequestMethod("POST");
                            urlconnection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
                            urlconnection.setDoOutput(true);
                            OutputStreamWriter out12 = new OutputStreamWriter(urlconnection.getOutputStream());
                            out12.write("");
                            out12.close();
                            BufferedReader in = new BufferedReader(new InputStreamReader(urlconnection.getInputStream()));
                            String decodedString;
                           
                            in.close();
                        } catch (Exception e) {
//                System.out.println(e);
                           // e.printStackTrace();
                        }
           }
           else
           {
               System.err.println("NOt Change");
           }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private double distance(double lat1, double lon1, double lat2, double lon2, char unit) {
        double theta = lon1 - lon2;
        double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
        dist = Math.acos(dist);
        dist = rad2deg(dist);
        dist = dist * 60 * 1.1515;
        if (unit == 'K') {
            dist = dist * 1.609344;
        } else if (unit == 'N') {
            dist = dist * 0.8684;
        }
        return (dist);
    }

    /*:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::*/
 /*::  This function converts decimal degrees to radians             :*/
 /*:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::*/
    private double deg2rad(double deg) {
        return (deg * Math.PI / 180.0);
    }

    /*:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::*/
 /*::  This function converts radians to decimal degrees             :*/
 /*:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::*/
    private double rad2deg(double rad) {
        return (rad * 180.0 / Math.PI);
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
