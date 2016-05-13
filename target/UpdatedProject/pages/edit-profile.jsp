<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>EditProfile</title>

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
<div class="navbar navbar-inverse navbar-fixed-top" style="float: right; position: absolute">
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
<div class="container">
        <div class="row">
            <div class="col-md-6">
                <br />
                <form class="form-horizontal" method="post" action="/person/edit/">
                <label>Registered Username</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="<c:out value="${user.getPersonInfo().getName()}" />">
                <label>Registered Name</label>
                <input type="text" class="form-control" id="surname" name="surname" placeholder="<c:out value="${user.getPersonInfo().getSurname()}" />">
                <label>Registered Email</label>
                <input type="text" class="form-control" id="email" name="email" placeholder="<c:out value="${user.getPersonInfo().getEmail()}" />">
                <br>

                    <button type="submit" class="btn btn-success">Save</button>
            </form>

             </div>
        </div>
    </div>

</div>
    </div>



</body>
</html>
