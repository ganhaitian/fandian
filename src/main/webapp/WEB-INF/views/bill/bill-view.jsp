<%--
  Created by IntelliJ IDEA.
  User: meajhlp
  Date: 14-7-14
  Time: 下午11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String realPath= application.getContextPath();
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, minimum-scale=1.0,user-scalable=no;">
    <title>账单</title>
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
    <script src="<%=realPath%>/resources/js/plugins/noty/jquery.noty.packaged.min.js"></script>

</head>
<body>

<div class="container" id="mainContainer">

    <div class="row">
        <div class="col-xs-12">
            <div class="text-center">
                <div class="col-xs-12 col-md-12">
                    <select name="desknumber" id="" class="form-control input-lg">
                        <c:if test="${existedBill}">
                            <option value="${tableNo}">${tableNo}桌</option>
                        </c:if>
                        <c:if test="${!existedBill}">
                            <option value="0" selected="selected">请选择桌号</option>
                            <option value="1">1桌</option>
                            <option value="2">2桌</option>
                            <option value="3">3桌</option>
                        </c:if>
                    </select>
                </div>
            </div>
        </div>
    </div>
    <br/><br/>
    <div class="row">
        <ul class="list-group">
            <c:forEach items="${list}" var="dish">
                <li id="dish_${dish.dish.id}_${dish.taste.id}_${dish.weight.id}" class="list-group-item dish-entry" data-id="${dish.dish.id}" data-name="${dish.dish.name}" data-count="${dish.number}" data-fee="${dish.dish.price*dish.number}">
                    <span class="dish-name"><h4><i class="fa fa-angle-down"></i>&nbsp;&nbsp;${dish.dish.name}
                        <span class="pull-right badge" id="dish_number_${dish.dish.id}_${dish.taste.id}_${dish.weight.id}">${dish.number}</span></h4>
                    </span>
                    <p class="tools-bar hide">
                        <strong>口味：</strong>${dish.taste.name}
                        &nbsp;&nbsp;
                        <strong>份量：</strong>${dish.weight.name}
                        &nbsp;
                        <span class="pull-right">
                            <button class="btn btn-default btn-oper-minus" data-id="${dish.dish.id}" data-price="${dish.dish.price}" data-taste="${dish.taste.id}" data-weight="${dish.weight.id}"><i class="fa fa-minus-circle"></i></button>
                            <button class="btn btn-default btn-oper-plus" data-id="${dish.dish.id}" data-price="${dish.dish.price}" data-taste="${dish.taste.id}" data-weight="${dish.weight.id}"><i class="fa fa-plus-circle"></i></button>
                            <button class="btn btn-default  btn-oper-remove" data-id="${dish.dish.id}" data-price="${dish.dish.price}" data-taste="${dish.taste.id}" data-weight="${dish.weight.id}"><i class="fa fa-trash-o"></i></button>
                        </span>
                    </p>
                </li>
            </c:forEach>

            <c:if test="${(!existedBill && isCustomer) || !isCustomer}">
                <li class="list-group-item">
                    <a href="<c:url value="/menu/customer/category?editing=1"/>"><h4><i class="fa fa-cutlery"></i>&nbsp;&nbsp;再点点儿</h4></a>
                </li>
            </c:if>

        </ul>
    </div>

    <br/>

    <div class="row">
        <div class="col-xs-12">
            <div class="text-center">
                <h4>消费 <i class="fa fa-rmb"></i> <span class="text-danger" id="bill_sum_fee">${sumfee}</span></h4>
            </div>
        </div>
    </div>

    <br/>

    <div class="row confirm-panel">
        <div class="col-xs-12">
            <c:if test="${existedBill and isCustomer}">
                <div class='alert alert-success' style='text-align:center;'>您已成功下单，请耐心等待!</div>
            </c:if>
            <c:if test="${!isCustomer || (isCustomer && !existedBill)}">
                <button id="confirm-bill" class="btn-block btn btn-primary btn-lg">确定</button>
            </c:if>
        </div>
    </div>
    <br/><br/>
</div>
<script type="application/javascript">

    $.noty.defaults = {
        layout: 'top',
        theme: 'defaultTheme',
        type: 'alert',
        text: '',
        dismissQueue: true, // If you want to use queue feature set this true
        template: '<div class="noty_message"><span class="noty_text"></span><div class="noty_close"></div></div>',
        animation: {
            open: {height: 'toggle'},
            close: {height: 'toggle'},
            easing: 'swing',
            speed: 500 // opening & closing animation speed
        },
        timeout: 2000, // delay for closing event. Set false for sticky notifications
        force: false, // adds notification to the beginning of queue when set to true
        modal: false,
        maxVisible: 5, // you can set max visible notification for dismissQueue true option
        closeWith: ['click'], // ['click', 'button', 'hover']
        callback: {
            onShow: function() {},
            afterShow: function() {},
            onClose: function() {},
            afterClose: function() {}
        },
        buttons: false // an array of buttons
    };

    $(function(){
        $('.dish-name').click(function(){
            $(this).siblings(".tools-bar").toggleClass('hide');

            $(this).find('i').toggleClass('fa-angle-down').toggleClass('fa-angle-up');


        });

        //minus btn  click
        $('.btn-oper-minus').click(function(){
            var dish_id = $(this).data('id');
            var dish_price = $(this).data('price');
            var dish_taste = $(this).data('taste');
            var dish_weight = $(this).data('weight');
            var dish_number = parseFloat($('#dish_number_'+dish_id+'_'+dish_taste+'_'+dish_weight).text());
            var sum_fee = parseFloat($('#bill_sum_fee').text());
            if (dish_number > 1){
                $.ajax({
                    url:"<c:url value="/order/customer/delDish"></c:url>",
                    type:"POST",
                    dataType:"JSON",
                    data: {"dishId":dish_id,"taste":dish_taste,"weight":dish_weight},
                    success:function(data){
                        if(data.success){
                            $('#dish_number_'+dish_id+'_'+dish_taste+'_'+dish_weight).text(dish_number-1);
                            $('#bill_sum_fee').text(sum_fee-dish_price);
                        }
                    }
                });
            }else{
                $.ajax({
                    url:"<c:url value="/order/customer/removeDish"></c:url>",
                    type:"POST",
                    dataType:"JSON",
                    data: {"dishId":dish_id,"taste":dish_taste,"weight":dish_weight},
                    success:function(data){
                        if(data.success){
                            $('#dish_'+dish_id+'_'+dish_taste+'_'+dish_weight).fadeOut();
                            $('#bill_sum_fee').text(sum_fee-dish_price);
                        }
                    }
                });
            }
        });

        //plus dish btn
        $('.btn-oper-plus').click(function(){
            var dish_id = $(this).data('id');
            var dish_price = $(this).data('price');
            var dish_taste = $(this).data('taste');
            var dish_weight = $(this).data('weight');
            var dish_number = parseFloat($('#dish_number_'+dish_id+'_'+dish_taste+'_'+dish_weight).text());
            var sum_fee = parseFloat($('#bill_sum_fee').text());

            $.ajax({
                url:"<c:url value="/order/customer/addDish"></c:url>",
                type:"POST",
                dataType:"JSON",
                data: {"dishId":dish_id,"taste":dish_taste,"weight":dish_weight,"amount":1},
                success:function(data){
                    if(data.success){
                        $('#dish_number_'+dish_id+'_'+dish_taste+'_'+dish_weight).text(dish_number+1);
                        $('#bill_sum_fee').text(sum_fee+dish_price);
                    }
                }
            });

        });

        //remove dish btn
        $('.btn-oper-remove').click(function(){
            var dish_id = $(this).data('id');
            var dish_price = $(this).data('price');
            var dish_taste = $(this).data('taste');
            var dish_weight = $(this).data('weight');
            var dish_number = parseFloat($('#dish_number_'+dish_id+'_'+dish_taste+'_'+dish_weight).text());
            var sum_fee = parseFloat($('#bill_sum_fee').text());

            $.ajax({
                url:"<c:url value="/order/customer/removeDish"></c:url>",
                type:"POST",
                dataType:"JSON",
                data: {"dishId":dish_id,"taste":dish_taste,"weight":dish_weight},
                success:function(data){
                    if(data.success){
                        $('#dish_'+dish_id+'_'+dish_taste+'_'+dish_weight).fadeOut();
                        $('#bill_sum_fee').text(sum_fee-dish_price*dish_number);
                    }
                }
            });

        });

        $("#confirm-bill").click(function(){

            var tableNo = $("select[name='desknumber']").val();
            if(tableNo == 0){
                noty({"text":"请输入桌单号!","layout":"topCenter","type":"error"});
                return;
            }

            var billDetails = [];
            $("ul.list-group li.dish-entry").each(function(index,entry){
                billDetails.push(
                    {
                     "dishId":$(this).data("id"),
                     "dishName":$(this).data("name"),
                     "amount":$(this).data("count"),
                     "price":$(this).data("fee")
                    });
            });

            $.ajax({
                url:"confirm",
                type:"POST",
                dataType:"JSON",
                data: {"param":JSON.stringify(billDetails),"tableNo":tableNo},
                success:function(data){
                    if(data.success){
                        $("div.confirm-panel").html(
                            "<div class='alert alert-success' style='text-align:center;'>您已成功下单，请耐心等待!</div>");
                    }
                }
            });
        });

    });


</script>
</body>
</html>
