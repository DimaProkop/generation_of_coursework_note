<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%--
  Created by IntelliJ IDEA.
  User: dionp
  Date: 12.04.2016
  Time: 0:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Post Menu</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <spring:url value="/resources/css/bootstrap.min.css" var="css"/>
    <link href="${css}" rel="stylesheet" />
    <spring:url value="/resources/js/lightbox.js" var="likeJs"/>
    <script href="${likeJs}"></script>
    <spring:url value="/resources/js/bootstrap.min.js" var="bjs"/>
    <script href="${bjs}"></script>
    <spring:url value="/resources/css/dashboard.css" var="dash"/>
    <link href="${dash}" rel="stylesheet" />
    <spring:url value="/resources/js/jquery.min.js" var="js"/>
    <script href="${js}"></script>

    <style>
        .thumbnail {
            padding:0px;
        }
        .panel {
            position:relative;
        }
        .panel>.panel-heading:after,.panel>.panel-heading:before{
            position:absolute;
            top:11px;left:-16px;
            right:100%;
            width:0;
            height:0;
            display:block;
            content:" ";
            border-color:transparent;
            border-style:solid solid outset;
            pointer-events:none;
        }
        .panel>.panel-heading:after{
            border-width:7px;
            border-right-color:#f7f7f7;
            margin-top:1px;
            margin-left:2px;
        }
        .panel>.panel-heading:before{
            border-right-color:#ddd;
            border-width:8px;
        }
    </style>


    <script type="text/javascript"
            src="http://code.jquery.com/jquery-1.10.1.min.js"></script>


    <script type="text/javascript">
        function crunchifyAjax() {
            $.ajax({
                url : 'ajaxtest.html',
                success : function(data) {
                    $('#result').html(data);
                }
            });
        }
    </script>

    <script type="text/javascript">
        var intervalId = 0;
        intervalId = setInterval(crunchifyAjax, 3000);
    </script>

</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top" style="float: right">
    <div class="container-fluid">
            <sec:authorize access="isAuthenticated()">
                <p><a class="btn btn-lg btn-danger" href="<c:url value="/logout" />" role="button">Logout</a></p>
            </sec:authorize>
    </div>
</nav>


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
            <fieldset>


                <h4><strong>Tilte:</strong> <c:out value="${answer.title}" /></h4>
                <div class="alert alert-info">
                    <h4><strong>Message:</strong></h4>
                    <h4><c:out value="${answer.text}" /></h4>
                </div>


                <c:forEach var="comment" items="${comments}">

                    <div class="container">
                        <div class="row">
                        </div><!-- /row -->
                        <div class="row">
                            <div class="col-sm-1">
                                <div class="thumbnail">
                                    <img class="img-responsive user-photo" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
                                </div><!-- /thumbnail -->
                            </div><!-- /col-sm-1 -->

                            <div class="col-sm-5">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <strong><c:out value="${comment.getUser().getLogin()}" /></strong> <span class="text-muted">commented 5 days ago</span>
                                    </div>
                                    <div class="panel-body">
                                        ${comment.text}
                                    </div><!-- /panel-body -->
                                </div><!-- /panel panel-default -->
                            </div><!-- /col-sm-5 -->

                        </div><!-- /row -->

                    </div><!-- /container -->

                </c:forEach>


                <form class="form col-md-10" method="post" action="/comment/add/<c:out value="${answer.id}" />">

                <div class="form-group">
                    <label for="text">Comment:</label>
                    <textarea class="form-control" rows="3" id="text" name="text"></textarea>

                </div>
                <button class="btn btn-inverse" type="submit">Add</button>
                </form>


            </fieldset>
            </div>
        </div>
    </div>





</body>
</html>
