<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%--
  Created by IntelliJ IDEA.
  User: dionp
  Date: 10.04.2016
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>AskAll</title>

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
    <div class="col-sm-7 col-sm-offset-5 col-md-7 col-md-offset-3 main">
        <div class="container">

            <p style="font-size: large">
                <a href="/post/add/">
                    <button type="button" class="btn btn-lg btn-info">
                    <span class="glyphicon glyphicon-plus-sign"></span>
                    </button>
                </a>
                Add your question
            </p>
            </div>
        <div class="table-responsive">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>User</th>
                    <th>Title</th>
                    <th>Rating</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="post" items="${posts}">
                    <tr style="width: 400px">
                        <td>${post.getUser().getLogin()}</td>
                        <td><a href="/comment/list/${post.id}">${post.title}</a></td>
                        <td>${post.postRating.value}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

    </div>


    </div>


</body>
</html>
