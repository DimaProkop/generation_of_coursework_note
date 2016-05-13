<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: dionp
  Date: 23.04.2016
  Time: 1:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Profile</title>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <spring:url value="/resources/css/bootstrap.min.css" var="css"/>
    <link href="${css}" rel="stylesheet" />

    <spring:url value="/resources/css/dashboard.css" var="dash"/>
    <link href="${dash}" rel="stylesheet" />
    <spring:url value="/resources/js/jquery.min.js" var="js"/>
    <script src="${js}"></script>
    <spring:url value="/resources/js/bootstrap.min.js" var="bjs"/>
    <script src="${bjs}"></script>

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
            <fieldset>

                <form method="get" action="/person/pageEdit">

                <div class="col-md-4">
                    <img src="/resources/images/profile-default.png" class="img-rounded img-responsive" />
                    <input class="form-control" type="file"/>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label" >First Name:</label>
                    <div class="col-sm-6">
                        <output class="form-control"><c:out value="${user.getPersonInfo().getName()}" /></output>
                    </div>
                </div>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-sm-2 control-label" >Last Name:</label>
                    <div class="col-sm-6">
                        <output class="form-control"><c:out value="${user.getPersonInfo().getSurname()}" /></output>
                    </div>
                </div>


                <!-- Text input-->
                <div class="form-group">
                    <label class="col-sm-2 control-label" >Email:</label>
                    <div class="col-sm-6">
                        <output class="form-control"><c:out value="${user.getPersonInfo().getEmail()}" /></output>
                    </div>
                </div>
</br>
                    <button class="btn btn-warning" style="size: 20px;" type="submit">Edit Profile</button>

                </form>


                </fieldset>


        </br>
        </br>



                <form method="post" action="/person/addBio/" class="form-horizontal">


                    <div class="panel-group">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" href="#collapse1">
                                        <div class="alert alert-info">
                                            <h4><strong>Add this information to more easily search for the information you need :)</strong></h4>
                                        </div></a>
                                </h4>
                            </div>
                            <div id="collapse1" class="panel-collapse collapse">


                                <div class="form-group">
                                    <label class="col-sm-2 control-label" >Nationality:</label>
                                    <div class="col-sm-6">
                                        <input type="text" id="nationality" name="nationality" placeholder="Your nationality" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" >Course:</label>
                                    <div class="col-sm-6">
                                        <input type="text" id="course" name="course" placeholder="Your course" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" >Group:</label>
                                    <div class="col-sm-6">
                                        <input type="text" id="group" name="group" placeholder="Your group" class="form-control">
                                    </div>
                                </div>

                                <button class="btn btn-success" style="float: right" type="submit">Add</button>

                            </div>
                        </div>
                    </div>




                </form>

            </fieldset>

            </div>
        </div>


</body>
</html>
