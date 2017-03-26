<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <title>Medical Awareness Programme</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>


        <%--<script type="text/javascript">
             // When the document is ready
             $(document).ready(function () {

                $('.input-daterange').datetimepicker({
                    todayBtn: "linked"
                });

            });
        </script> --%>

        <link rel="stylesheet" href="medical_site_awareness_newcss.css">
    <img src="medical_site_awareness_cesc.png" width="150" height="100" alt="CESC LOGO"/>
    <h1><center><u>Medical Awareness Programme </u></center></h1>
</head>
<body>

    <div class="container">
        <form name="myForm" action="medical_site_awareness_display2.jsp" method="GET">
            <%--  <div class="input-daterange" id="datetimepicker" --%> 
            <div class="form-group">
                <label for="From Date"> From Date:</label>
                <input type="datetime-local" class="form-control" name="From Date" placeholder="Enter Date" >
            </div>
            <div class="form-group">
                <label for="To Date"> To Date:</label>
                <input type="datetime-local"  class="form-control" name="To Date" placeholder="Enter Date">
            </div>

            <div class="form-group">
                <label for="Faculty Name">Faculty Name:</label>
                <input type="text" class="form-control text-uppercase" name="Faculty Name" placeholder="Enter Faculty Name">
            </div>
            <button type="submit" class="btn btn-success">Submit</button>
            <button type="reset" class="btn btn-primary">Reset</button>
        </form>
    </div>

</body>
</html> 


