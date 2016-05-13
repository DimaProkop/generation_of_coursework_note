<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%--
  Created by IntelliJ IDEA.
  User: dionp
  Date: 06.04.2016
  Time: 23:36
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <title>person</title>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <spring:url value="/resources/css/bootstrap.min.css" var="css"/>
    <link href="${css}" rel="stylesheet" />
    <spring:url value="/resources/js/bootstrap.min.js" var="bjs"/>
    <script href="${bjs}"></script>
    <spring:url value="/resources/js/bootstrap-datetimepicker.min.js" var="datejs"/>
    <script href="${datejs}"></script>
    <spring:url value="/resources/css/dashboard.css" var="dash"/>
    <link href="${dash}" rel="stylesheet" />
    <spring:url value="/resources/css/bootstrap-datetimepicker.css" var="datacss"/>
    <link href="${datacss}" rel="stylesheet" />
    <spring:url value="/resources/js/jquery.min.js" var="js"/>
    <script href="${js}"></script>


</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top" style="float: right; position: absolute">
    <div class="container-fluid">
            <sec:authorize access="isAuthenticated()">
                <p><a class="btn btn-lg btn-danger" href="<c:url value="/logout" />" role="button">Logout</a></p>
            </sec:authorize>
    </div>
</nav>


    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav navbar-btn btn-inverse">
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
        <form class="form-horizontal" role="form" method="post" action="/person/add/">
            <fieldset>

                <div class="alert alert-success">
                    <h4 style="text-align: center"><strong>Please!</strong> Add your personal information.</h4>
                </div>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-sm-2 control-label" >First Name:</label>
                    <div class="col-sm-10">
                        <input type="text" id="name" name="name" placeholder="Your name" class="form-control">
                    </div>
                </div>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-sm-2 control-label" >Last Name:</label>
                    <div class="col-sm-10">
                        <input type="text" id="surname" name="surname" placeholder="Your surname" class="form-control">
                    </div>
                </div>


                <!-- Text input-->
                <div class="form-group">
                    <label class="col-sm-2 control-label" >Email:</label>
                    <div class="col-sm-4">
                        <input type="email" id="email" name="email" placeholder="Email" class="form-control">
                    </div>

                    <label class="col-sm-2 control-label">BirtDay:</label>
                    <div class="col-sm-4">
                        <input type="date" id="birthday" name="birthday" class="form-control">
                    </div>
                </div>



                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <div class="pull-right">
                            <button type="submit" class="btn btn-info">Save</button>
                        </div>
                    </div>
                </div>

            </fieldset>
        </form>
    </div><!-- /.col-lg-12 -->
</div><!-- /.row -->
</body>
</html>
