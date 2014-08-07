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
    <title>搜索</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="<s:url value="/resources/css/basic.css"></s:url> ">

    <style type="text/css">
        body {padding-top: 70px;}
        a {color: inherit;}

        /*.search-input-container input{
            float:left;
        }

        .search-input-container button{
            float:right;
            width: 93%;
        }*/

        .keyword-item{
            cursor: pointer;
            background-color: #f4f5f0;
        }

        .list-group-item{
            border-bottom: 1px solid #ddd;
        }

        .list-group-item:nth-child(1){
            border-top:0px;
        }

    </style>

    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    <script src="<s:url value="/resources/js/jquery.loadTemplate-1.4.4.min.js"></s:url>"></script>
    <script src="<s:url value="/resources/js/holder.js"></s:url>"></script>
</head>
<body>

<div class="container">
    <nav class="navbar navbar-orange navbar-fixed-top" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Brand</a>
            </div>
                <div class="collapse navbar-collapse">
                    <form class="navbar-form navbar-left" role="search">
                        <div class="form-group">
                            <label class="control-label sr-only" for="search-input">Hidden label</label>
                            <span class="glyphicon glyphicon-search form-control-feedback inner-icon"></span>
                            <input type="text" class="form-control" id="search-input" placeholder="搜索">
                        </div>
                        <button class="btn btn-default" type="button" id="search-btn" >搜索</button>
                    </form>
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
            <div class="input-group has-feedback">

                <span class="input-group-btn">

                </span>
            </div>
        </div>
    </div>

    <div class="row" id="keyword-list" >
        <ul class="list-group" >

        </ul>
    </div>

    <div class="row" id="search-result">

    </div>

</div>
<script type="application/javascript">

    Holder.add_theme("bright", { background: "#a6a5a3", foreground: "white", size: 12 });

    $(function(){

        $("#search-btn").click(function(){

        });

        $(document).on('input propertychange',"#search-input",function(){
            var keyWord = $(this).val();
            if(!keyWord)
                return;

            //判断是否是中文
           var reg = /^[\u4E00-\u9FA5]+$/;
            if(!reg.test(keyWord)){
                return;
            }

            $.ajax({
                url:"<s:url value="/menu/searchKeyword"></s:url>",
                type:"POST",
                dataType:"json",
                headers:{
                    Accept : "application/json; charset=utf-8"
                },
                data:{"keyWord":keyWord},
                success:function(result){
                    if(result.success){
                        $("#keyword-list ul").html("");
                        $.each(result.keywordList,function(index,keyword){
                            $("#keyword-list ul").append(
                                "<li class='list-group-item keyword-item' data-id='"+keyword.id+"' >"+keyword.keyword+"</li>");
                        });
                    }
                }
            });

            $(document).on('click',"li.keyword-item",function(){
                //alert($(this).data("id"));
                var keywordId = $(this).data("id");
                window.location.href = '<s:url value="/menu/searchDish"></s:url>?keywordId='+keywordId;
            });

        });

    });


</script>
</body>
</html>
