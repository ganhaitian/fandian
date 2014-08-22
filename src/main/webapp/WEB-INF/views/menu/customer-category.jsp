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

    <link rel="stylesheet" href="<s:url value="/resources/css/basic.css"></s:url> ">

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
    <script src="<s:url value="/resources/js/plugins/jquery-ui/jquery-ui.min.js"></s:url>"></script>
    <script src="<s:url value="/resources/js/jquery.loadTemplate-1.4.4.min.js"></s:url>"></script>
    <script src="<s:url value="/resources/js/plugins/noty/jquery.noty.packaged.min.js"></s:url>"></script>
    <script src="<s:url value="/resources/js/holder.js"></s:url>"></script>
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
                                <s:choose>
                                    <s:when test="${rootcategory != null && rootcategory.parentId == 0}">
                                    <span class="pull-left">
                                        <a href="<s:url value="/menu/customer/category"></s:url> ">
                                            <i class="fa fa-chevron-left"></i>
                                        </a>
                                    </span>
                                        <strong>${rootcategory.name}</strong>
                                        <div class="pull-right">
                                            <div class="dropdown">

                                                <i class="fa fa-list" data-toggle="dropdown"></i>
                                                <ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="typemenu" id="dishMenuContainer">
                                                    <s:forEach items="${rootCategories}" var="tmp">
                                                        <li role="presentation"><a role="menuitem" tabindex="-1" href="<s:url value="/menu/customer/category/${tmp.id}"></s:url>">${tmp.name}</a></li>
                                                        <li class="divider"></li>
                                                    </s:forEach>
                                                </ul>
                                            </div>
                                        </div>
                                    </s:when>
                                    <s:when test="${rootcategory != null && rootcategory.parentId > 0}">

                                    <span class="pull-left">
                                       <a href="<s:url value="/menu/customer/category/${rootcategory.parentId}"></s:url> ">
                                           <i class="fa fa-chevron-left"></i>
                                       </a>
                                    </span>
                                        <strong>${rootcategory.name}</strong>
                                        <div class="pull-right">
                                            <div class="dropdown">


                                                <i class="fa fa-list" data-toggle="dropdown"></i>

                                                <ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="typemenu" id="dishMenuContainer">
                                                    <s:forEach items="${rootCategories}" var="tmp">
                                                        <li role="presentation"><a role="menuitem" tabindex="-1" href="<s:url value="/menu/customer/category/${tmp.id}"></s:url>">${tmp.name}</a></li>
                                                        <li class="divider"></li>
                                                    </s:forEach>
                                                </ul>
                                            </div>
                                        </div>
                                    </s:when>
                                    <s:otherwise>
                                        <strong>石山乳羊第一家</strong>
                                    </s:otherwise>
                                </s:choose>

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

    <div class="row search-input-container">
        <div class="container">
            <div class="form-group has-feedback">
                <label class="control-label sr-only" for="search-input">Hidden label</label>
                <input type="text" class="form-control" id="search-input" placeholder="搜索">
                <span class="glyphicon glyphicon-search form-control-feedback inner-icon"></span>
            </div>
        </div>
    </div>
    <s:if test="${fn:length(categories) > 0}">
        <div class="row" >

            <div class="container" id="category-item-container">
                <s:forEach items="${categories}" var="tmp">
                    <div class="col-xs-4 category-item">
                        <a href="<s:url value="/menu/customer/category/${tmp.id}"></s:url>">

                            <div class="row">

                                <div class="text-center">
                                    <div style="display: block; position: absolute;top: 3;right: 12;z-index: 999;">
                                        <%--<span class="label label-warning">26</span>--%>
                                        <img src="<c:url value="/holder.js/25x20/bright/text:${tmp.dish_count}"></c:url> "  class="img-rounded">
                                    </div>
                                    <div class="row">
                                        <img style="border:3px solid #a6a5a3;" src="<s:url value="/resources/img/icon/category/${tmp.id}.png?${timestamp}"></s:url>" width="60%" alt="" class="img-circle"/>
                                    </div>

                                    <p style="margin-top: 5px;">${tmp.name}</p>

                                </div>

                            </div>

                        </a>
                    </div>

                </s:forEach>

            </div>

        </div>
    </s:if>

    <s:if test="${fn:length(dishes) > 0}">
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
                                <button class="button btn-primary btn-sm" id="btn-dish-order-sure"><i class="fa fa-shopping-cart"></i> 确定</button>
                            </div>
                        </div>
                    </div>


            </div>
        </div>
        <div class="row">

            <s:forEach items="${dishes}" var="dish">
                <div class="col-xs-12 col-md-4">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xs-6">

                                    <img src="<s:url value="/resources/img/icon/dish/${dish.id}.jpg"></s:url>" width="100%" alt="..." class="img-rounded"/>

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
            </s:forEach>


        </div>
    </s:if>


</div>
<script type="application/javascript">
    Holder.add_theme("bright", { background: "#a6a5a3", foreground: "white", size: 12 });

    var order_dish_num_step = 1;
    function updateUserOrderDetails(){
        $.ajax({
            url:"<s:url value="/order/customer/getDishes"></s:url>",
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

    function showValidBookMobilePanel(){
        noty({
            text: '请输入您预约登记的手机号码:',
            type:'information',
            layout:'topCenter',
            modal:true,
            template: '<div class="noty_message"><span class="noty_text"></span><input id="book-mobile" type="text" class="form-control input-lg"/><div class="noty_close"></div></div>',
            buttons: [
                {addClass: 'btn btn-primary', text: '确定', onClick: function($noty) {
                    var mobile = $('#book-mobile').val();
                    if (!/^\d{11}$/.test(mobile)){
                        noty({text: '您输入的手机号码格式不正确', type: 'warning', timeout:2000,layout:'topCenter'});
                        return;
                    }else{
                        $.ajax({
                            url:"<c:url value="/book/validSchedule"></c:url>",
                            dataType:"json",
                            headers:{
                                Accept : "application/json; charset=utf-8"
                            },
                            method:'POST',
                            data:{
                                "mobile": mobile
                            },
                            success:function(data){
                                if (data.success){
                                    $noty.close();
                                    noty({text: '验证通过~', type: 'information', timeout:2000,layout:'topCenter'});

                                }else{
                                    noty({text: '未找到预约记录', type: 'information', timeout:2000,layout:'topCenter'});
                                }
                            },
                            error:function(){
                                noty({text: '请稍后再试~', type: 'error', timeout:2000,layout:'topCenter'});
                            }
                        });
                    }

                }
                },
                {addClass: 'btn btn-default', text: '取消', onClick: function($noty) {
                    $noty.close();

                }
                }
            ]
        });
    }

    function fetchDishMetaInfo(dishId){
        $.ajax({
            url:"<s:url value="/menu/customer/dish/meta/"></s:url>"+dishId,
            dataType:"json",
            headers:{
                Accept : "application/json; charset=utf-8"
            },
            error:function(){
                alert("对不起，请稍后再试~");
            },
            success:function(result){
                if (result.nobook){
                    showValidBookMobilePanel();
                }else{
                    initTastePanel(result["taste"]);
                    initWeightPanel(result["weight"]);
                    showDishMetaPanel();
                }


            }
        });
    }

    $(document).on('focus','#search-input',function(){
        window.location.href = '<s:url value="/menu/search"></s:url>';
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
            $.ajax({
             url:"<s:url value="/order/customer/addDish"></s:url>",
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
             },
             error:function(){
                alert('err');
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
            fetchDishMetaInfo($(this).attr('data-id'));
            if ($(this).attr('data-unit-id') == '2'){
                order_dish_num_step = 0.1;
            }else{
                order_dish_num_step = 1;
            }



        });

        $('.btn-del-from-cart').click(function(e){
            var btn = $(this);

            $.ajax({
                url:"<s:url value="/order/customer/delDish"></s:url>",
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
