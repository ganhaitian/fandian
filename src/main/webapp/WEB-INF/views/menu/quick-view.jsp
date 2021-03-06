<%--
  Created by IntelliJ IDEA.
  User: gan
  Date: 14-7-15
  Time: 下午9:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>菜单</title>

    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
    <link rel="stylesheet"
          href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    <style type="text/css">

        body {
            padding-bottom: 70px;
        }

        .item-list {
            list-style: none outside none;
            padding: 0;
        }

        li[class*="item-"] {
            -moz-border-bottom-colors: none;
            -moz-border-left-colors: none;
            -moz-border-right-colors: none;
            -moz-border-top-colors: none;
            border-color: #ddd;
            border-image: none;
            border-style: solid;
            border-width: 1px 1px 1px 1px;
        }

        .item-list > li {
            background-color: #fff;
            margin-top: -1px;
            padding: 9px;
            position: relative;
        }

        .item-list > li label.inline {
            font-size: 18px;
            font-weight: 500;
        }

        .item-list button {
            width: 70px;
        }

        .item-list .header {
            /*background-color: #DDDDDD;
            color: #7E7E7E;*/
            font-size: 14px;
            background-color: #d3e7f3;
            color: #3993cf;
            padding-bottom: 4px;
            padding-top: 4px;
            padding-left: 12px;
        }

        .menu-content {
            background-color: #EEEEEE;
        }

        .top-header {
            background-color: #3993CF;
        }

        .footbar {
            background-color: #2F373E;
            color: #fff;
            font-size: 18px;
        }

        .btn-price {
            background-color: #3993CF;
            color: #fff;
            font-size: 16px;
        }

        .nav-search {
            line-height: 24px;
        }

        span.input-icon {
            display: inline-block;
        }

        .input-icon {
            position: relative;
        }

        .input-icon > input {
            padding-left: 24px;
            padding-right: 6px;
        }

        .nav-search .nav-search-icon {
            background-color: transparent;
            color: #6fb3e0 !important;
            font-size: 14px !important;
            line-height: 24px !important;
        }

        .nav-search-icon {
            border: medium none;
            border-radius: 0;
            bottom: 1px;
            color: #909090;
            display: inline-block;
            font-size: 16px;
            left: 3px;
            line-height: 28px;
            padding: 0 3px;
            position: absolute;
            top: 2px;
            z-index: 2;
        }

        .rating {
            direction: rtl;
            font-size: 30px;
            unicode-bidi: bidi-override;
        }

        .rating span.star:before {
            color: #999999;
            content: "";
            padding-right: 5px;
        }

        .rating span.star {
            display: inline-block;
            font-family: FontAwesome;
            font-style: normal;
            font-weight: normal;
        }

        .rating {
            direction: rtl;
            font-size: 10px;
        }

        .menu-entry {
            height: 50px;
            vertical-align: middle;
            padding-top: 1px;
        }

        label.sales-data {
            font-size: 9px;
            font-weight: 400;
            color: #7E7E7E;
        }

        div.price-container {
            margin-top: 5px;
        }

        .menu-category{
            padding-left:0px;
            padding-right:0px;
            height:100%;
            background-color: #EEEEEE;
        }

        .menu-category li.active > a, .nav-pills > li.active > a:hover, .nav-pills > li.active > a:focus{
            background-color: #ffffff;
            color:#000;
            border-left: 2px solid #3993CF;
        }

        .menu-entry{
            padding-left:0px;
            padding-right:0px;
        }

        .nav-pills > li > a {
            font-size:16px;
            color: #B3B3B3;
            border-radius: 0px;
            border-width: 1px 1px 0px 2px;
            border-color:#E1E1E1;
            border-left-color:#3993CF;
            text-align: center;
            padding:10px 10px;
        }

        .menu-category .nav-pills > li {
             border-bottom: 1px solid #E1E1E1;
         }

    </style>
    <script>

        String.prototype.trim = function () {
            return this.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
        }

        var bill = {
            fee: 0,
            count:0,
            detail: {}
        };

        $(document).ready(function () {

            //修正菜单的宽度
            $('#affix_menu').width($('.col-xs-3').width());

            $(document).on("click",'button.btn-price', function () {
                var priceStr = $(this).html().trim();
                var menuEntry = $(this).parents("div.menu-entry")[0];
                var price = Number(priceStr.substr(1));
                bill.fee = bill.fee + price;
                bill.count = bill.count + 1;
                bill.detail[$(menuEntry).data("id")] = {
                    "name": $("label.inline span", menuEntry).html().trim(),
                    "fee": price,
                    "count": 1
                };
                $("nav.footbar .navbar-text").html('<i class="fa fa-cutlery"></i> ' +
                        bill.count + '品 <i class="fa fa-rmb"></i>' + bill.fee);
            });

            //Initialized category
            $.each($(".menu-content li a"),function(index,category){
                loadMenuCategory($(category).data("id"));
            });

            //提交账单按钮
            $('#submitBillBtn').click(function(){
                if ($(this).hasClass('disabled')){
                    return;
                }else{
                    $(this).addClass('disabled');
                    $('#billInfoParam').val(JSON.stringify(bill.detail));
                    $(this).parent("form").submit();
                }
            });

        });

        function loadMenuCategory(categoryId){
            if($("div.meny-entry div#tab_"+categoryId).length > 0){
                return;
            }
            $.ajax({
                url:"getDishInCategory",
                headers:{
                    Accept : "application/json; charset=utf-8"
                },
                data:{"categoryId":categoryId},
                success:function(data){
                    if($("div.meny-entry div#tab_"+categoryId).length == 0){
                        var tabPane = $("<div id = 'tab_"+categoryId+"' class='tab-pane fade' ></div>");
                        if($(".menu-content li:first a").data("id") == categoryId)
                            tabPane = $("<div id = 'tab_"+categoryId+"' class='tab-pane fade in active' ></div>");

                        $("div.tab-content").append(tabPane);

                        var itemList = $("<ul class='item-list'></ul>");
                        tabPane.append(itemList);

                        itemList.append('<li class="header">啦啦啦</li>');

                        $.each(data,function(index,menuEntry){
                            var menu = $('<li class="item-orange">'+
                                '<div class="menu-entry" data-id ="'+menuEntry.id+'" >'+
                                    '<div class="pull-left"><div>'+
                                        '<label class="inline">'+
                                            '<span class="lbl">'+menuEntry.name+'</span>'+
                                        '</label>'+
                                    '</div>'+
                                    '<div>'+
                                        '<span class="rating">'+
                                            '<span class="star"></span>'+
                                            '<span class="star"></span>'+
                                            '<span class="star"></span>'+
                                            '<span class="star"></span>'+
                                            '<span class="star"></span>'+
                                        '</span>'+
                                        '<label class="sales-data">月售'+menuEntry.sales+'份</label>'+
                                    '</div>'+
                                '</div>'+
                                '<div class="inline pull-right position-relative dropdown-hover price-container">'+
                                    '<button class="btn btn-price">¥'+menuEntry.price+'</button>'+
                                '</div>'+
                            '</li>');
                            itemList.append(menu);
                        });
                    }
                }
            });
        }

    </script>
</head>
<body>
<div class="container-fluid">
<nav class="navbar navbar-fixed-top top-header" role="navigation">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-md-8">
                <div class="input-group margin-bottom-sm" style="margin-top: 8px;width:100%">
                    <%--<span class="input-group-addon"><i class="fa fa-search fa-fw"></i></span>--%>
                    <input type="text" class="form-control" style="padding-left: 24px;"
                           placeholder="快点..."/>
                    <i class="ace-icon fa fa-search fa-2x nav-search-icon"></i>
                </div>
                <%--<div id="nav-search" class="nav-search" style="margin-top: 8px;" >
                   <span class="input-icon">
                       <input type="text" autocomplete="off" id="nav-search-input" class="form-control nav-search-input" placeholder="快点 ...">
                       <i class="ace-icon fa fa-search fa-2x nav-search-icon"></i>
                   </span>
                </div>--%>
            </div>
        </div>
    </div>
</nav>

<nav class="navbar footbar navbar-fixed-bottom" role="navigation">
    <!-- We use the fluid option here to avoid overriding the fixed width of a normal container within the narrow content columns. -->
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div class="pull-left">
                    <p class="navbar-text">
                        <i class="fa fa-cutlery"></i> <%--3品 <i class="fa fa-rmb"></i>145--%>
                    </p>

                </div>
                <div class="pull-right">
                    <form action="/fandian/bill/view" method="post" enctype="application/x-www-form-urlencoded">
                        <input type="hidden" name="param" id="billInfoParam"/>
                        <button id="submitBillBtn" class="btn btn-danger navbar-btn btn-price">去下单</button>
                    </form>
                </div>
            </div>

        </div>
    </div>
</nav>

<div class="row menu-content" style="margin-top: 50px;">
<div class="col-xs-3 menu-category ">
    <div id="affix_menu" class="affix affix-top">
        <ul id="category" class="nav nav-pills nav-stacked" role="tablist">
            <c:forEach items="${categories}" var="category" varStatus="row">
                <c:if test="${row.count == 1}">
                    <li class="active"><a data-toggle="tab" data-id="${category.id}" role="tab" href="#tab_${category.id}"><c:out value="${category.name}"></c:out></a></li>
                </c:if>
                <c:if test="${row.count > 1}">
                    <li><a data-toggle="tab" data-id="${category.id}" role="tab" href="#tab_${category.id}"><c:out value="${category.name}"></c:out></a></li>
                </c:if>
            </c:forEach>
        </ul>
    </div>
</div>
<div class="col-xs-9 menu-entry ">
<div id="categoryContent" class="tab-content">

</div>
</div>
</div>


</div>
</body>
</html>
