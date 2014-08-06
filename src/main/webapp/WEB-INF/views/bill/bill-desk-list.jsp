<%--
  Created by IntelliJ IDEA.
  User: meajhlp
  Date: 14-7-14
  Time: 下午11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>桌号列表</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">



    <style type="text/css">
        body {padding-top: 10px;}
        .tools-bar {padding-top: 5px;}
    </style>


    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>


</head>
<body>

<div class="container" id="mainContainer">

    <c:if test="${fn:length(bills) == 0}">
        <div class="alert alert-warning">
            暂无顾客点单信息
        </div>
    </c:if>

    <c:if test="${fn:length(bills) > 0}">
        <div class="panel panel-default">
            <div class="panel-heading">
                <strong>请选择桌号</strong>
            </div>

            <ul class="list-group">
                <c:forEach items="${bills}" var="bill">
                    <li class="list-group-item">
                        <a href="<c:url value="/bill/view?tableNo=${bill.tableNo}"></c:url>">
                                <span><h4>&nbsp;&nbsp;${bill.tableNo} 桌
                                    <span class="pull-right badge"><i class="fa fa-rmb"></i> ${bill.fee}</span></h4>
                                </span>
                        </a>

                    </li>
                </c:forEach>
            </ul>
        </div>

    </c:if>

</div>
<script type="application/javascript">



</script>
</body>
</html>
