<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dionp
  Date: 07.04.2016
  Time: 14:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login-error</title>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <spring:url value="/resources/css/bootstrap.min.css" var="mainCss" />
    <spring:url value="/resources/js/bootstrap.min.js" var="mainJs" />
    <link href="${mainCss}" rel="stylesheet" />
    <script href="${mainJs}"></script>

    <style type="text/css">

        .modal-footer {
            border-top: 0px;
        }
    </style>
</head>


<!--login modal-->
<div id="loginModal">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="alert alert-warning">
                <h3 style="text-align: center"><strong>Warning!</strong> Your login or password are incorrect.</h3>
            </div>
            <div class="modal-header">
                <h2 style="text-align: center">Login to Your Account</h2>
            </div>


            <div class="modal-body">
                <c:url value="/j_spring_security_check" var="loginUrl" />
                <form class="form col-md-12" action="${loginUrl}" method="post">
                    <input type="text" class="form-control" name="j_username" placeholder="login" required autofocus value="dima">
                    <input type="password" class="form-control" name="j_password" placeholder="Password" required value="prokop">
                    <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
                </form>
            </div>

            <!-- Footer Section -->
            <div class="modal-footer">
                <div class="col-md-12">

                </div>
            </div>
        </div>
    </div>
</div>


</html>