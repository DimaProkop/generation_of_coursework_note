<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dionp
  Date: 10.04.2016
  Time: 16:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Quiestion</title>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <spring:url value="/resources/css/bootstrap.min.css" var="css"/>
    <link href="${css}" rel="stylesheet" />
    <spring:url value="/resources/js/bootstrap.min.js" var="bjs"/>
    <script href="${bjs}"></script>
    <spring:url value="/resources/css/dashboard.css" var="dash"/>
    <link href="${dash}" rel="stylesheet" />
    <spring:url value="/resources/js/jquery.min.js" var="js"/>
    <script href="${js}"></script>
</head>
<body>

<div class="navbar navbar-inverse navbar-fixed-top" style="float: right">
    <sec:authorize access="isAuthenticated()">
        <p><a class="btn btn-lg btn-danger" href="<c:url value="/logout" />" role="button">Logout</a></p>
    </sec:authorize>
</div>

<div class="row">
    <div class="col-sm-3 col-md-2 sidebar">
        <ul class="nav navbar-btn">
            <li><a href="/person/profile/">Profile</a></li>
            <li><a href="">Photo</a></li>
            <li><a href="/post/list/"><h4>AskAll</h4></a></li>
            <li><a href="">Messages</a></li>
            <li><a href="">Friends</a></li>
            <li><a href="">Notices</a></li>
            <li><a href="">Rating</a></li>
        </ul>
    </div>
</div>
<div class="row">
    <div class="col-sm-6 col-sm-offset-4 col-md-7 col-md-offset-3 main">
        <form class="form-horizontal" role="form" method="post" action="/post/add/">
            <fieldset>


                <!-- Text input-->
                <div class="form-group">
                    <label class="col-sm-2 control-label" >Title:</label>
                    <div class="col-sm-10">
                        <input type="text" id="title" name="title" placeholder="title" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label" >Text:</label>
                    <div class="col-sm-10">
                        <textarea id="text" name="text" placeholder="message" class="form-control"></textarea>
                    </div>
                </div>

                </fieldset>

            <br>
            <br>


            <button type="submit" class="btn btn-success">Add</button>
            </form>
        </div>
    </div>




</body>
</html>
