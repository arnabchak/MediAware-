<%-- 
    Document   : display
    Created on : Dec 14, 2016, 11:40:22 AM
    Author     : sudipa1
--%>
<%@page import="java.sql.*"%>
<%@page import="CescAppJavaPackage.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"pageEncoding="ISO-8859-1" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>JSP Page</title>
    </head>
    
    <body>
        <h1>Program Details have been stored!!</h1>
        <%
             
        MakeConnection mk = null;
        PreparedStatement ps = null;
            
        String pd = request.getParameter("Programme Date");
        String fn = request.getParameter("Faculty Name");
        String v = request.getParameter("Venue");
        String t = request.getParameter("Topic");
        String a = request.getParameter("Attendance");
        String sp = request.getParameter("Snacks Provided");
        String cd = request.getParameter("Create Date");
        String cb =  System.getProperty("user.name");
       
        
        try
        {
            //Class.forName("oracle.jdbc.driver.OracleDriver");
            //Connection con=DriverManager.getConnection("MEDIENQ@DEVDB", "medienq","medienq");
            mk = new MakeConnection();
            String sql = "insert into Cl_SITE_AWAR_DTLS values(?,?,?,?,?,?,?,?)";
            ps = mk.con.prepareStatement(sql);
            ps.setString(1,pd);
            ps.setString(2,fn);
            ps.setString(3,v);
            ps.setString(4,t);
            ps.setString(5,a);
            ps.setString(6,sp);
            ps.setString(7,cd);
            ps.setString(8,cb);
            int i=ps.executeUpdate();
            if(i!=0)
            { 
               
                
                 String site = new String("awareness/medical_site_awareness_entry.jsp");
                 response.setStatus(response.SC_MOVED_TEMPORARILY);
                 response.setHeader("Location", site);
            } 
            else 
            {
                response.sendRedirect("Insertion Failed!! ");
            }   
            
        }
        catch(Exception ex) 
        { 
            out.println(ex); 
        }
        finally{
            if(ps != null)  ps.close();
            if(mk.con != null)  mk.con.close();
            
            
}
        
        %>                 
        </body>
</html>
