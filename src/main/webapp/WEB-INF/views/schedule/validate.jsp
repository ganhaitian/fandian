<%--
  Created by IntelliJ IDEA.
  User: zhijieliu
  Date: 2014/7/14
  Time: 19:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>预约校验</title>
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
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <form action="<c:url value="/j_spring_security_check"></c:url>" method="post">
                <div class="form-group">
                    <label for="">请输入预约登记的手机号码</label>
                    <input type="text" class="form-control" id="phonenumber"/>
                </div>
                <div class="alert alert-danger" id="tip-invalid-phone" style="display: none;">
                    <i class="fa fa-info-circle"></i> 您输入的手机号码格式不正确
                </div>
                <div class="alert alert-warning" id="tip-no-schedule" style="display: none;">
                    <i class="fa fa-info-circle"></i> 未找到相关预约记录，请核对手机号码
                </div>
                <button class="btn btn-primary btn-block" type="button" id="btn-sure">确定</button>
                <br/>
                <div class="pull-right">
                    <a href="/dish/category" class="text-muted">没有预约，先看看菜单</a>
                </div>

            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
    $('#btn-sure').click(function() {
        var btn = $(this);
        if (btn.hasClass('disabled')){
            return;
        }

        var mobile = $('#phonenumber').val();
        if (!/^\d{11}$/.test(mobile)){
            $('#tip-invalid-phone').fadeIn();
            setTimeout(function(){$('#tip-invalid-phone').fadeOut();},2000);
            return;
        }else{
            btn.addClass('disabled');
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
                        window.location = "<c:url value="/dish/category"></c:url>";
                    }else{
                        $('#tip-no-schedule').fadeIn();
                        setTimeout(function(){$('#tip-no-schedule').fadeOut();},2000);
                    }
                    btn.removeClass('disabled');
                },
                error:function(){
                    $('#tip-no-schedule').fadeIn();
                    setTimeout(function(){$('#tip-no-schedule').fadeOut();},2000);
                    btn.removeClass('disabled');
                }
            });
        }

    });
</script>
</body>
</html>
