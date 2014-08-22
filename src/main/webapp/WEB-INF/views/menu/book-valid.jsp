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

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, minimum-scale=1.0,user-scalable=no">
    <title>预约查询</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="<c:url value="/resources/css/basic.css"></c:url>">

    <style type="text/css">
        body {padding-top: 58px;}

    </style>

    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>


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
                                <strong>石山乳羊第一家</strong>
                            </h4>
                        </div>
                    </div>
                </div>
            </div>



        </div>
    </nav>
    <div class="row">
        <div class="col-xs-12">
            <br/><br/>
            <p>
                <strong>您好，请输入预约时登记的手机号码</strong>
            </p>

            <div class="text-center">

                <%--<div class="input-group">
                  <input type="text" class="form-control input-lg" id="mobile">
                  <span class="input-group-btn">
                    <button class="btn btn-inverse btn-lg" type="button" id="btn-submit">确定</button>
                  </span>
                </div>--%>
                <input type="text" class="form-control input-lg" id="mobile">

                <div id="valid-info-container" class="alert alert-warning text-left" style="display: none;"><i class="fa fa-info"></i> 手机号码格式不正确</div>

                <div id="noschecule-info-container" class="alert alert-info text-left" style="display: none;"><i class="fa fa-info"></i> 未找到预约信息</div>

                <br/>
                <button class="btn btn-primary btn-lg btn-block" type="button" id="btn-submit">确定</button>
            </div>
            <br/>
            <a href="<c:url value="/book/noSchedule"></c:url>"><strong>暂未预约，去看看菜单</strong></a>
        </div>
    </div>

</div>
<script type="application/javascript">


    $(function(){


        //确定按钮
        $('#btn-submit').click(function(){
            $('#noschecule-info-container').hide();
            var mobile = $('#mobile').val();
            if (!/^\d{11}$/.test(mobile)){
                $('#valid-info-container').show();
                return;
            }else{
                $('#valid-info-container').hide();
            }

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

                     window.location.href = '<c:url value="/menu/customer/category"></c:url>';
                 }else{
                     $('#noschecule-info-container').show();
                 }
             },
             error:function(){
                alert('请稍后再试~~');
             }
             });
        });


    });






</script>
</body>
</html>
