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
        <script>
            function myFunction() {
                alert("Successfully Stored!");
            }
        </script>
        <link rel="stylesheet" href="medical_site_awareness_newcss.css">
    <img src="medical_site_awareness_cesc.png" width="150" height="100" alt="CESC LOGO"/>
    <h1><center><u>Medical Awareness Programme</u></center></h1>
</head>
<body>

    <div class="container">
        <form name="myForm" action="medical_site_awareness_display.jsp" method="POST" onsubmit="myFunction();">
            <div class="form-group">
                <label for="Programme Date"> Program Date:</label>
                <input type="datetime-local" class="form-control" name="Programme Date" placeholder="Enter  Programme Date">
            </div>
            <div class="form-group">
                <label for="Faculty Name">Faculty Name:</label>
                <input type="text" class="text-uppercase form-control" name="Faculty Name" placeholder="Enter Faculty Name">
            </div>
            <div class="form-group">
                <label for="Venue">Venue:</label>
                <input type="text" class="form-control" name="Venue" placeholder="Enter Venue">
            </div>
            <div class="form-group">
                <label for="Topic">Topic:</label>
                <input type="text" class="form-control" name="Topic" placeholder="Enter Topic">
            </div>
            <div class="form-group">
                <label for="Attendance">Attendance:</label>
                <input type="number" class="form-control" name="Attendance">
            </div>
            <div class="form-group">
                <label for="Snacks provided">Snacks provided :</label><br/>
                <label class="radio-inline" > <input type="radio" name="Snacks Provided" value="YES"> YES
                </label>
                <label class="radio-inline"> <input type="radio" name="Snacks Provided" value="NO"> NO
                </label>
            </div>
            <div class="form-group">
                <label for="Create Date">Create Date:</label>
                <input type="text" class="form-control" name="Create Date" value="<%= new java.util.Date()%>" readonly>
            </div>

            <button type="submit" class="btn btn-success">Submit</button>
            <a href="medical_site_awareness_enquiry.jsp" class="btn btn-info" role="button">Search</a>
        </form>
    </div>

</body>
</html>
