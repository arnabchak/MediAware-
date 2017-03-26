
<%@page import="java.sql.*"%>
<%@page import="CescAppJavaPackage.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"pageEncoding="ISO-8859-1" %>
<%!
    String NVL(String s) {
        if (s == null) {
            return "";
        } else {
            return s;
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            table{
                border: 2px solid black;
                padding: 10px;
                td{
                    font-size: 15px;
                }
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="medical_site_awareness_newcss1.css"/>
        <title>Bootstrap Example</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script>
            function myFunction() {
                alert("Hello! I am an alert box!");
            }
        </script>

        <title>JSP Page</title>
    <img src="medical_site_awareness_cesc.png" width="150" height="100" alt="CESC LOGO"/>
</head>
<body>
    
    <div class="container">
        <%

            MakeConnection mk = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
                //Class.forName("oracle.jdbc.driver.OracleDriver");
                //Connection con=DriverManager.getConnection("MEDIENQ@DEVDB", "medienq","medienq");
                mk = new MakeConnection();
        %>
        <br /><br /><br /><br />
        <h2 align="center"><font><strong><u>Required Details</u></strong></font></h2>
        <br /><br />
        <table id="example" class="display nowrap" cellspacing="0" width="100%" padding="50px">
            <thead>
                <tr>
                    <th>Programme Date</th>
                    <th>Faculty Name</th>
                    <th>Venue</th>
                    <th>Topic</th>
                    <th>Attendance</th>
                    <th>Snacks Provided</th>
                    <th>Create Date</th>
                    <th>Created By</th>
                </tr>
            </thead>

            <tbody>
                <%
                    String fd = NVL(request.getParameter("From Date"));
                    String td = NVL(request.getParameter("To Date"));
                    String fn = NVL(request.getParameter("Faculty Name"));
                    String sql = "SELECT * FROM CL_SITE_AWAR_DTLS ";
                    String date_s = " PROG_DATE BETWEEN ? AND ? ";
                    String name_s = "FACULTY_NAME=?";
                    if ((fd.length() > 0 && (td.length() > 0)) || fn.length() > 0) {
                        sql += " WHERE ";
                    }
                    if ((fd.length() > 0 && (td.length() == 0)) || (fd.length() == 0 && (td.length() > 0)) || (fd.length() == 0 && (td.length() == 0) && (fn.length() == 0)) || (fd.compareTo(td)) > 0) {

                        
                        String site = new String("awareness/medical_site_awareness_enquiry.jsp");
                        response.setStatus(response.SC_MOVED_TEMPORARILY);
                        response.setHeader("Location", site);
                    }

                    if (fd.length() != 0) {
                        sql += date_s;
                        if (fn.length() > 0) {
                            sql += " AND ";
                        }
                    }
                    if (fn.length() != 0) {
                        sql += name_s;
                    }
                    ps = mk.con.prepareStatement(sql);
                    if (fd.length() > 0) {
                        ps.setString(1, fd);
                        ps.setString(2, td);
                        if (fn.length() > 0) {
                            ps.setString(3, fn);
                        }
                    } else {
                        ps.setString(1, fn);
                    }

                    rs = ps.executeQuery();
                    while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString("PROG_DATE")%></td>
                    <td><%=rs.getString("FACULTY_NAME")%></td>
                    <td><%=rs.getString("VENUE")%></td>
                    <td><%=rs.getString("TOPIC")%></td>
                    <td><%=rs.getString("ATTENDANCE")%></td>
                    <td><%=rs.getString("SNACKS_SERV")%></td>
                    <td><%=rs.getString("CRT_DT")%></td>
                    <td><%=rs.getString("CRT_BY")%></td>
                </tr>
            </tbody>
            <%
                }
            %>
        </table>
        <%
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (mk.con != null) {
                    mk.con.close();
                }
            }
        %>
    </div>
</body>
</html>