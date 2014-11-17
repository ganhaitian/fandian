<%--
  Created by IntelliJ IDEA.
  User: meajhlp
  Date: 14-7-14
  Time: 下午11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
    request.setAttribute("timestamp",System.currentTimeMillis());
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, minimum-scale=1.0,user-scalable=no;">
    <title>菜单</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="<c:url value="/resources/css/basic.css"></c:url> ">

    <style type="text/css">
        body {padding-top: 58px;}
        a {color: inherit;}

        .navbar-inverse .navbar-text {
            color: #f7f8f8;
        }

    </style>

    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="<c:url value="/resources/js/plugins/jquery-ui/jquery-ui.min.js"></c:url>"></script>
    <script src="<c:url value="/resources/js/jquery.loadTemplate-1.4.4.min.js"></c:url>"></script>
    <script src="<c:url value="/resources/js/plugins/noty/jquery.noty.packaged.min.js"></c:url>"></script>
    <script src="<c:url value="/resources/js/holder.js"></c:url>"></script>
</head>
<body>

<div class="container">
    <nav class="navbar navbar-orange navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-md-12">
                    <div class="text-center">
                        <div class="navbar-text" style="float: none;">
                            <h4>
                                <c:choose>
                                    <c:when test="${rootcategory != null && rootcategory.parentId == 0}">
                                    <span class="pull-left">
                                        <a href="<c:url value="/dish/category"></c:url> ">
                                            <i class="fa fa-chevron-left"></i>
                                        </a>
                                    </span>
                                        <strong>${rootcategory.name}</strong>
                                        <div class="pull-right">
                                            <div class="dropdown">

                                                <i class="fa fa-list" data-toggle="dropdown"></i>
                                                <ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="typemenu" id="dishMenuContainer">
                                                    <c:forEach items="${rootCategories}" var="tmp">
                                                        <li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value="/dish/category/${tmp.id}"></c:url>">${tmp.name}</a></li>
                                                        <li class="divider"></li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:when test="${rootcategory != null && rootcategory.parentId > 0}">

                                    <span class="pull-left">
                                       <a href="<c:url value="/dish/category/${rootcategory.parentId}"></c:url> ">
                                           <i class="fa fa-chevron-left"></i>
                                       </a>
                                    </span>
                                        <strong>${rootcategory.name}</strong>
                                        <div class="pull-right">
                                            <div class="dropdown">


                                                <i class="fa fa-list" data-toggle="dropdown"></i>

                                                <ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="typemenu" id="dishMenuContainer">
                                                    <c:forEach items="${rootCategories}" var="tmp">
                                                        <li role="presentation"><a role="menuitem" tabindex="-1" href="<c:url value="/dish/category/${tmp.id}"></c:url>">${tmp.name}</a></li>
                                                        <li class="divider"></li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <strong>石山乳羊第一家</strong>
                                    </c:otherwise>
                                </c:choose>

                            </h4>
                        </div>
                    </div>
                </div>
            </div>



        </div>
    </nav>




    <div class="row search-input-container">
        <div class="container">
            <div class="form-group has-feedback">
                <label class="control-label sr-only" for="search-input">Hidden label</label>
                <input type="text" class="form-control" id="search-input" placeholder="搜索">
                <span class="glyphicon glyphicon-search form-control-feedback inner-icon"></span>
            </div>
        </div>
    </div>
    <c:if test="${fn:length(categories) > 0}">
        <div class="row" >

            <div class="container" id="category-item-container">
                <c:forEach items="${categories}" var="tmp">
                    <div class="col-xs-4 category-item">
                        <a href="<c:url value="/dish/category/${tmp.id}"></c:url>">

                            <div class="row">

                                <div class="text-center">
                                    <div style="display: block; position: absolute;top: 3;right: 12;z-index: 999;">
                                        <%--<span class="label label-warning">26</span>--%>
                                        <img src="<c:url value="/holder.js/25x20/bright/text:${tmp.dish_count}"></c:url> "  class="img-rounded">
                                    </div>
                                    <div class="row">
                                        <img style="border:3px solid #a6a5a3;" src="<c:url value="/resources/img/icon/category/${tmp.id}.png?${timestamp}"></c:url>" width="60%" alt="" class="img-circle"/>
                                    </div>

                                    <p style="margin-top: 5px;">${tmp.name}</p>

                                </div>

                            </div>

                        </a>
                    </div>

                </c:forEach>

            </div>

        </div>
    </c:if>

    <c:if test="${fn:length(dishes) > 0}">

        <div class="row">

            <c:forEach items="${dishes}" var="dish">
                <div class="col-xs-12 col-md-4">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xs-6">

                                    <img src="<c:url value="/resources/img/icon/dish/${dish.id}.jpg"></c:url>" width="100%" alt="..." class="img-rounded"/>

                                </div>
                                <div class="col-xs-6">
                                    <div class="row">

                                        <h3>${dish.name}</h3>
                                        <p class="text-muted">月售 <strong>${dish.sales}</strong> 份</p>
                                        <p class="text-warning">
                                            <c:forEach begin="1" end="5" step="1" var="i">
                                                <c:choose>
                                                    <c:when test="${i<=dish.stars}">
                                                        <i class="fa fa-star"></i>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <i class="fa fa-star-o"></i>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </p>
                                        <p class="text-muted">
                                            <strong>
                                                <i class="fa fa-rmb"></i>
                                                 ${dish.price}
                                            </strong>
                                        </p>
                                    </div>
                                </div>
                            </div>

                        </div>


                    </div>

                </div>
            </c:forEach>


        </div>
    </c:if>


</div>
<script type="application/javascript">
    Holder.add_theme("bright", { background: "#a6a5a3", foreground: "white", size: 12 });


    $(function(){

        <c:if test="${searchKeyword != null}">
            $("input#search-input").val('${searchKeyword}');
        </c:if>

        $(document).on('focus','#search-input',function(){
            window.location.href = '<c:url value="/menu/search"></c:url>';
        });
    });






</script>
</body>
</html>
