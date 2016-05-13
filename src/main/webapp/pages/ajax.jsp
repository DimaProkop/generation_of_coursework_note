<%--
  Created by IntelliJ IDEA.
  User: dionp
  Date: 20.04.2016
  Time: 2:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ajax</title>
</head>
<style type="text/css">
    body {
        background-image:
                url('http://cdn3.crunchify.com/wp-content/uploads/2013/03/Crunchify.bg_.300.png');
    }
</style>
<script type="text/javascript"
        src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script type="text/javascript">
    function crunchifyAjax() {
        $.ajax({
            type : "POST",
            url : 'ajaxtest.html',
            success : function(data) {
                $('#result').html(data);
            }
        });
    }

    $(document).ready(crunchifyAjax);
</script>

<%--<script type="text/javascript">--%>
    <%--var intervalId = 0;--%>
    <%--intervalId = setInterval(crunchifyAjax, 3000);--%>
<%--</script>--%>
</head>

<body>


<button onclick="crunchifyAjax();">Test</button>


<div align="center">
    <br> <br> ${message} <br> <br>
    <div id="result"></div>
    <br>
    <p>
        by <a href="http://crunchify.com">Crunchify.com</a>
    </p>
</div>
</body>
</html>
