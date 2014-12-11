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


    <nav class="navbar navbar-inverse navbar-fixed-bottom hide" role="navigation" id="nav_order_summary">
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
                        <%--<form action="<c:url value="/bill/view"></c:url>" method="post" enctype="application/x-www-form-urlencoded">--%>
                            <%--<input type="hidden" name="param" id="billInfoParam"/>--%>
                            <%--<button id="submitBillBtn" class="btn btn-danger navbar-btn">去下单</button>--%>
                        <%--</form>--%>
                        <a href="<c:url value="/cart/list"></c:url>" class="btn btn-danger navbar-btn">去下单</a>
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
    <!-- 菜类列表 -->
    <c:if test="${fn:length(categories) > 0}">
        <div class="row" >

            <div class="container" id="category-item-container">
                <c:forEach items="${categories}" var="tmp">
                    <div class="col-xs-4 category-item">
                        <a href="<c:url value="/dish/order/category/${tmp.id}"></c:url>">

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

    <!-- 菜品列表 -->
    <c:if test="${fn:length(dishes) > 0}">
        <div id="dish-detail-mask-container">

        </div>
        <div class="dish-detail-row" id="dish-detail-panel">

            <div class="dish-detail-container">

                    <div class="" style="background-color: white;">
                        <strong id="detail_dishName">红焖羊蹄</strong>
                        <button type="button" class="close pull-right" id="dish-detail-btn-close"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <div class="dish-detail-divider"></div>
                        <small>口味</small>


                        <div class="btn-group" data-toggle="buttons" id="detail_tastes">

                        </div>

                        <div class="dish-detail-divider"></div>
                        <small>份量</small>
                        <div class="btn-group" data-toggle="buttons" id="detail_weights">

                        </div>

                        <div class="dish-detail-divider"></div>
                        <small>数量</small>
                        <div class="row">
                            <div class="col-xs-10">
                                <div class="input-group">
                                    <span class="input-group-btn">
                                        <button class="btn btn-default btn-sm btn-minus-order-num" type="button">&nbsp;<i class="fa fa-minus"></i>&nbsp;</button>
                                    </span>
                                    <input class="form-control input-sm" type="text" id="detail-order-num" value="1"/>
                                    <span class="input-group-btn">
                                        <button class="btn btn-default btn-sm btn-plus-order-num" type="button">&nbsp;<i class="fa fa-plus"></i>&nbsp;</button>
                                    </span>
                                    <span class="input-group-addon" id="detail-unit-name" style="background-color: #ffffff; border: none; font-weight:bolder;">份</span>
                                </div>

                            </div>
                        </div>
                        <div class="dish-detail-divider"></div>

                        <div class="row">
                            <div class="text-center">
                                <button class="button btn-primary btn-sm" id="btn-dish-order-sure"><i id="btn-dish-order-sure-icon" class="fa fa-shopping-cart"></i> 确定</button>
                            </div>
                        </div>
                    </div>


            </div>
        </div>
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

                        <div class="panel-footer">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="pull-right">
                                        <button class="hide btn btn-inverse btn-del-from-cart" data-id="${dish.id}" data-name="${dish.name}" data-price="${dish.price}" data-sub-number-id="sub_number_${dish.id}">
                                            <i class="fa fa-minus"></i>

                                        </button>
                                        &nbsp;&nbsp;
                                        <span class="badge text-primary" id="sub_number_${dish.id}"></span>
                                        &nbsp;&nbsp;
                                        <button class="btn btn-inverse btn-add-to-cart" data-id="${dish.id}" data-name="${dish.name}" data-price="${dish.price}" data-sub-number-id="sub_number_${dish.id}">
                                            <i class="fa fa-plus"></i>

                                        </button>
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

    var order_dish_num_step = 1;
    function updateUserOrderDetails(){
        $.ajax({
            url:"<c:url value="/cart/details"></c:url>",
            dataType:"json",
            headers:{
                Accept : "application/json; charset=utf-8"
            },
            error:function(){
                var mainHeight = $(window).height() - $('#category-item-container').offset()['top'];


                $('.category-item').height(mainHeight/3);
            },
            success:function(result){
                if (!result.dishes || !$.isArray(result.dishes)){
                    result['dishes'] = [];
                }

                var dishCount= 0, dishFee = 0, popoverHtml = "";
                $('span[id^=sub_number_]').text('').prev('button').addClass("hide");

                $.each(result.dishes,function(i,v){

                    dishFee += v.number* v.fee;
                    if (popoverHtml.indexOf(v.dish.name)<0){
                        popoverHtml += "<li class=\"list-group-item\"><span class=\"badge\">"+ v.totalNumber +"</span>"+ v.dish.name+"</li>";
                        dishCount += v.totalNumber;
                    }

                    $('#sub_number_' + v.dish.id).text(v.totalNumber);
                    $('#sub_number_' + v.dish.id).prev('button').removeClass('hide');
                });

                $('#summary_info_number').text(dishCount);
                $('#summary_info_fee').text(dishFee);


                $('#billSummaryTrigger').attr("data-content","<ul class=\"list-group\">"+popoverHtml+"</ul>");

                $('#billSummaryTrigger').popover();

                if (result.dishes.length > 0){
                    $('#nav_order_summary').removeClass('hide');

                    $("body").css({"padding-bottom":"70px"});

                }

                var mainHeight = $(window).height() - $('#category-item-container').offset()['top'];

                if (!$('#nav_order_summary').hasClass('hide')){
                    mainHeight -= 70;
                }

                $('.category-item').height(mainHeight/3);
            }
        });
    }

    function initTastePanel(tastes){

        if ($.isArray(tastes) && tastes.length > 0){
            $('#detail_tastes').html("");
            $.each(tastes,function(i,v){
                if(i==0){
                    $("<label class=\"btn btn-default btn-sm active\"><input type=\"radio\" name=\"taste\" value=\""+ v.id+"\" checked>"+ v.name+"</label>").appendTo($('#detail_tastes'));
                }else{
                    $("<label class=\"btn btn-default btn-sm\"><input type=\"radio\" name=\"taste\" value=\""+ v.id+"\">"+ v.name+"</label>").appendTo($('#detail_tastes'));
                }

            });
        }else{
            $('#detail_tastes').html("<label class=\"btn btn-default btn-sm active\"><input type=\"radio\" name=\"taste\" value=\"0\" checked>默认</label>");
        }
    }

    function initWeightPanel(weights){

        if ($.isArray(weights) && weights.length > 0){
            $('#detail_weights').html("");
            $.each(weights,function(i,v){
                if (i == 0){
                    $("<label class=\"btn btn-default btn-sm active\"><input type=\"radio\" name=\"weight\" value=\""+ v.id+"\" checked>"+ v.name+"</label>").appendTo($('#detail_weights'));
                }else{
                    $("<label class=\"btn btn-default btn-sm\"><input type=\"radio\" name=\"weight\" value=\""+ v.id+"\">"+ v.name+"</label>").appendTo($('#detail_weights'));
                }

            });
        }else{
            $('#detail_weights').html("<label class=\"btn btn-default btn-sm active\"><input type=\"radio\" name=\"weight\" value=\"0\" checked>默认</label>");
        }
    }

    function showDishMetaPanel(){
        $('#dish-detail-mask-container').fadeIn().height($(window).height());
        $('#dish-detail-panel').fadeIn();
                //width($(window).width()).show('slide',{direction :"down"},1000);
    }

    function hideDishMetaPanel(){
        $('#dish-detail-panel').fadeOut();
                //hide('slide',{direction :"down"});
        $('#dish-detail-mask-container').fadeOut()
    }


    function fetchDishMetaInfo(dishId,btn){
        $.ajax({
            url:"<c:url value="/dish/meta/"></c:url>"+dishId,
            dataType:"json",
            headers:{
                Accept : "application/json; charset=utf-8"
            },
            error:function(){
                alert("对不起，请稍后再试~");
            },
            success:function(result){

                    initTastePanel(result["taste"]);
                    initWeightPanel(result["weight"]);
                    showDishMetaPanel();

            }
        });
    }

    $(document).on('focus','#search-input',function(){
        window.location.href = '<c:url value="/menu/search"></c:url>';
    });

    $(function(){

        <c:if test="${searchKeyword != null}">
            $("input#search-input").val('${searchKeyword}');
        </c:if>


        $('#dish-detail-btn-close').click(function(){
            hideDishMetaPanel();
        });

        $('.btn-plus-order-num').click(function(){
            var num = parseFloat($('#detail-order-num').val()) + order_dish_num_step;
            num = num.toFixed(1);
            if (order_dish_num_step == 1){
                num = parseInt(num);
            }
            $('#detail-order-num').val(num);
        });

        $('.btn-minus-order-num').click(function(){
            var num = parseFloat($('#detail-order-num').val()) - order_dish_num_step;
            if (num < 0){
                num = 0;
            }
            num = num.toFixed(1);
            if (order_dish_num_step == 1){
                num = parseInt(num);
            }
            $('#detail-order-num').val(num);
        });

        //确定按钮
        $('#btn-dish-order-sure').click(function(){

            var btn = $(this);
            if (btn.hasClass("disabled")){
                return;
            }
            btn.addClass("disabled");
            $('#btn-dish-order-sure-icon').removeClass('fa-shopping-cart').addClass('fa-spin fa-spinner');
            $.ajax({
             url:"<c:url value="/cart/dishadd"></c:url>",
             method:'POST',
             data:{dishId:btn.attr('data-id'),dishName:btn.attr('data-name'),price:btn.attr('data-price'),
                 taste:$("#detail_tastes").find("input:checked").val(),
                 weight:$("#detail_weights").find("input:checked").val(),
                 amount:$('#detail-order-num').val()
             },
             success:function(data){
                 updateUserOrderDetails();
                 hideDishMetaPanel();
                 if ($('#'+btn.attr('data-sub-number-id')).text()){
                    btn.siblings('button').removeClass('hide');
                 }else{
                    btn.siblings('button').addClass('hide');
                 }
                 $('#btn-dish-order-sure-icon').addClass('fa-shopping-cart').removeClass('fa-spin fa-spinner');
                 btn.removeClass('disabled')
             },
             error:function(){
                alert('添加菜品失败');
                $('#btn-dish-order-sure-icon').addClass('fa-shopping-cart').removeClass('fa-spin fa-spinner');
                btn.removeClass('disabled');
             }
             });
        });

        $('.btn-add-to-cart').click(function(e){
            var btn = $(this);
            $('#detail-order-num').val(1);
            $('#detail_dishName').text(btn.attr('data-name'));
            $('#detail-unit-name').text($(this).attr('data-unit-name'));
            $('#btn-dish-order-sure').attr("data-id",btn.attr("data-id"));
            $('#btn-dish-order-sure').attr("data-name",btn.attr("data-name"));
            $('#btn-dish-order-sure').attr("data-price",btn.attr("data-price"));
            fetchDishMetaInfo($(this).attr('data-id'), btn);
            if ($(this).attr('data-unit-id') == '2'){
                order_dish_num_step = 0.1;
            }else{
                order_dish_num_step = 1;
            }



        });

        $('.btn-del-from-cart').click(function(e){
            var btn = $(this);

            $.ajax({
                url:"<c:url value="/cart/dishreduce"></c:url>",
                method:'POST',
                data:{id:btn.attr('data-id')},
                success:function(data){
                    updateUserOrderDetails();
                    var order_dish_num = parseInt($('#'+btn.attr('data-sub-number-id')).text())-1;
                    if (order_dish_num == 0){
                        $('#'+btn.attr('data-sub-number-id')).text("");
                        btn.addClass('hide');
                    }else{
                        $('#'+btn.attr('data-sub-number-id')).text(""+order_dish_num);
                    }

                },
                error:function(){
                    alert('err');
                }
            });


        });

        updateUserOrderDetails();





    });






</script>
</body>
</html>
