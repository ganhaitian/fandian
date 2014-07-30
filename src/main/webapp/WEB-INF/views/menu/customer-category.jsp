<%--
  Created by IntelliJ IDEA.
  User: meajhlp
  Date: 14-7-14
  Time: 下午11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>菜单</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="<s:url value="/resources/css/basic.css"></s:url> ">

    <style type="text/css">
        body {padding-bottom: 70px;padding-top: 10px;}
        a {color: #000000;}
    </style>

    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    <script src="<s:url value="/resources/js/jquery.loadTemplate-1.4.4.min.js"></s:url>"></script>
</head>
<body>

<div class="container">
    <nav class="navbar navbar-default navbar-fixed-top hide" role="navigation">
        <div class="container">

            <div class="row">
                <s:choose>
                    <s:when test="${fn:length(rootCategories) > 0}">
                        <div class="col-xs-8 col-md-8">
                            <div style="margin-top: 8px;">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-search"></i></span>
                                    <input type="text" class="form-control" placeholder="点点儿什么？"/>
                                </div>

                            </div>


                        </div>
                        <div class="col-xs-4 col-md-4">

                            <div class="dropdown">

                                <button class="btn btn-default btn-block navbar-btn" data-toggle="dropdown">
                                    分类
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="typemenu" id="dishMenuContainer">
                                    <s:forEach items="${rootCategories}" var="tmp">
                                        <li role="presentation"><a role="menuitem" tabindex="-1" href="<s:url value="/menu/customer/category/${tmp.id}"></s:url>">${tmp.name}</a></li>
                                    </s:forEach>
                                </ul>
                            </div>
                        </div>
                    </s:when>
                    <s:otherwise>
                        <div class="col-xs-12 col-md-12">
                            <div style="margin-top: 8px;">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-search"></i></span>
                                    <input type="text" class="form-control" placeholder="点点儿什么？"/>
                                </div>

                            </div>


                        </div>
                    </s:otherwise>
                </s:choose>


            </div>


        </div>
    </nav>


    <nav class="navbar navbar-inverse navbar-fixed-bottom" role="navigation">
        <!-- We use the fluid option here to avoid overriding the fixed width of a normal container within the narrow content columns. -->
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="pull-left">
                        <p class="navbar-text" id="billSummaryTrigger" data-html="true" data-container="body" data-toggle="popover" data-placement="top" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus.">
                            <i class="fa fa-cutlery"></i>&nbsp;&nbsp;<strong id="summary_info_number"></strong>&nbsp;&nbsp;例&nbsp;&nbsp;
                            <i class="fa fa-rmb"></i>&nbsp;&nbsp;<strong id="summary_info_fee"></strong>
                        </p>

                    </div>
                    <div class="pull-right">
                        <%--<form action="<s:url value="/bill/view"></s:url>" method="post" enctype="application/x-www-form-urlencoded">--%>
                            <%--<input type="hidden" name="param" id="billInfoParam"/>--%>
                            <%--<button id="submitBillBtn" class="btn btn-danger navbar-btn">去下单</button>--%>
                        <%--</form>--%>
                        <a href="<s:url value="/bill/view"></s:url>" class="btn btn-danger navbar-btn">去下单</a>
                    </div>
                </div>

            </div>
        </div>
    </nav>
    <s:if test="${fn:length(categories) > 0}">
        <div class="row">
            <div class="container search-input-container">
                <div class="form-group has-feedback">
                    <label class="control-label sr-only" for="inputSuccess5">Hidden label</label>
                    <input type="text" class="form-control" id="inputSuccess5" placeholder="菜品搜索">
                    <span class="glyphicon glyphicon-search form-control-feedback inner-icon"></span>
                </div>
            </div>

            <%--<div class="col-xs-12">
                <div class="list-group">
                    <s:forEach items="${categories}" var="tmp">
                        <a href="<s:url value="/menu/customer/category/${tmp.id}"></s:url>" class="list-group-item">
                            ${tmp.name}
                            <span class="pull-right"><i class="fa fa-chevron-right"></i></span>
                        </a>
                    </s:forEach>

                </div>
            </div>--%>
            <s:forEach items="${categories}" var="tmp">
                <div class="col-xs-4">
                    <a href="<s:url value="/menu/customer/category/${tmp.id}"></s:url>">

                            <div class="row" style="margin-top: 20px;">

                                <div class="text-center">
                                    <div class="row">
                                        <img src="<s:url value="/resources/img/holder.jpg"></s:url>" width="50%" alt="" class="img-circle"/>
                                    </div>

                                    <h4>${tmp.name}</h4>

                                </div>

                            </div>

                    </a>
                </div>

            </s:forEach>
        </div>
    </s:if>

    <s:if test="${fn:length(dishes) > 0}">
        <div class="row">

            <s:forEach items="${dishes}" var="dish">
                <div class="col-xs-12 col-md-4">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xs-6">
                                    <a href="#" class="thumbnail">
                                        <img src="<s:url value="/resources/img/holder.jpg"></s:url>" alt="..." class="img-rounded"/>
                                    </a>
                                </div>
                                <div class="col-xs-6">
                                    <div class="row">

                                        <h3>${dish.name}</h3>
                                        <p class="text-muted">月售 <strong>${dish.sales}</strong> 份</p>
                                        <p class="text-warning">
                                            <s:forEach begin="1" end="5" step="1" var="i">
                                                <s:choose>
                                                    <s:when test="${i<=dish.stars}">
                                                        <i class="fa fa-star"></i>
                                                    </s:when>
                                                    <s:otherwise>
                                                        <i class="fa fa-star-o"></i>
                                                    </s:otherwise>
                                                </s:choose>
                                            </s:forEach>
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
                        <div class="panel-footer">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="pull-right">
                                        <span class="badge text-primary" id="sub_number_${dish.id}"></span>
                                        &nbsp;&nbsp;
                                        <button class="btn btn-inverse btn-add-to-cart" title="点击加入餐车" data-id="${dish.id}" data-name="${dish.name}" data-price="${dish.price}" data-sub-number-id="sub_number_${dish.id}">
                                            <i class="fa fa-shopping-cart"></i>
                                            <span>我要点</span>
                                        </button>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </s:forEach>


        </div>
    </s:if>

</div>
<script type="application/javascript">

    function updateUserOrderDetails(){
        $.ajax({
            url:"<s:url value="/order/customer/getDishes"></s:url>",
            dataType:"json",
            headers:{
                Accept : "application/json; charset=utf-8"
            },

            success:function(result){
                if (!result.dishes || !$.isArray(result.dishes)){
                    result['dishes'] = [];
                }

                var dishCount = 0, dishFee = 0, popoverHtml = "";

                $.each(result.dishes,function(i,v){
                    dishCount += v.number;
                    dishFee += v.number* v.dish.price;
                    popoverHtml += "<li class=\"list-group-item\"><span class=\"badge\">"+ v.number +"</span>"+ v.dish.name+"</li>";
                });

                $('#summary_info_number').text(dishCount);
                $('#summary_info_fee').text(dishFee);


                $('#billSummaryTrigger').attr("data-content","<ul class=\"list-group\">"+popoverHtml+"</ul>");

                $('#billSummaryTrigger').popover();
            }
        });
    }

    $('.btn-add-to-cart').click(function(e){
        var btn = $(this);
        $.ajax({
            url:"<s:url value="/order/customer/addDish"></s:url>",
            method:'POST',
            data:{id:btn.attr('data-id'),name:btn.attr('data-name'),price:btn.attr('data-price')},
            success:function(data){
                updateUserOrderDetails();
            },
            error:function(){
                alert('err');
            }
        });


    });

    updateUserOrderDetails();



</script>
</body>
</html>