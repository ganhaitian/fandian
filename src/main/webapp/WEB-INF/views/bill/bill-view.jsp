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
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
                        <option value="0" selected="selected">请选择桌号</option>
                        <option value="1">1桌</option>
                        <option value="2">2桌</option>
                        <option value="3">3桌</option>
                    </select>
                </div>
            </div>
        </div>
    </div>
    <br/><br/>
    <div class="row">
        <ul class="list-group">
            <c:forEach items="${list}" var="dish">
                <li class="list-group-item dish-entry" data-id="${dish.dish.id}" data-name="${dish.dish.name}" data-count="${dish.number}" data-fee="${dish.dish.price*dish.number}">
                    <span class="dish-name"><h4><i class="fa fa-angle-down"></i>&nbsp;&nbsp;${dish.dish.name}
                        <span class="pull-right badge">${dish.number}</span></h4>
                    </span>
                    <p class="tools-bar hide">
                        &nbsp;
                    <span class="pull-right">
                        <button class="btn btn-default"><i class="fa fa-minus-circle"></i></button>
                        <button class="btn btn-default"><i class="fa fa-plus-circle"></i></button>
                        <button class="btn btn-default"><i class="fa fa-trash-o"></i></button>
                    </span>
                    </p>
                </li>
            </c:forEach>


            <li class="list-group-item">
                <a href="/menu/customer/category"><h4><i class="fa fa-cutlery"></i>&nbsp;&nbsp;再点点儿</h4></a>
            </li>
        </ul>
    </div>

    <br/>

    <div class="row">
        <div class="col-xs-12">
            <div class="text-center">
                <h4>消费 <i class="fa fa-rmb"></i> <span class="text-danger">${sumfee}</span></h4>
            </div>
        </div>
    </div>

    <br/>

    <div class="row">
        <div class="col-xs-12">
            <button id="confirm-bill" class="btn-block btn btn-primary btn-lg">确定</button>
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
                    alert(data);
                }
            });
        });

    });


</script>
</body>
</html>
