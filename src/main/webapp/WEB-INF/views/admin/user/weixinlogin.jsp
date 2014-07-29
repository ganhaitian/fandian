<%--
  Created by IntelliJ IDEA.
  User: zhijieliu
  Date: 2014/7/14
  Time: 19:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>wx_login</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</head>
<body style="padding-top: 50px;">

<div class="container">
    <div class="row hide">
        <div class="col-md-4 col-md-offset-4">
            <form action="<c:url value="/j_spring_security_check"></c:url>" method="post">
                <div class="form-group">
                    <label for="">OPENID</label>
                    <input type="text" class="form-control" name="j_username" value="${openid}"/>
                </div>
                <div class="form-group">
                    <label for="">USERNAME</label>
                    <input type="password" class="form-control" name="j_password" value="25872587"/>
                </div>


            </form>
        </div>
    </div>

    <div class="row">
        <div class="col-xs-12">
            <div class="text-center">
                请稍后...
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">

    $('form').submit();


</script>
</body>
</html>
