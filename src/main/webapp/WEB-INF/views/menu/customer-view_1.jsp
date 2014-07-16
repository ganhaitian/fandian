<%--
  Created by IntelliJ IDEA.
  User: meajhlp
  Date: 14-7-14
  Time: 下午11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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



    <style type="text/css">
        body {padding-bottom: 70px;}
        .type-header {margin-top:70px;}
    </style>

    <script type="text/html" id="dishInfoTemplate">
        <div class="col-xs-12 col-md-4">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-6">
                            <a href="#" class="thumbnail">
                                <img data-template-bind='[{"attribute":"data-src","value":"img_url"}]' alt="...">
                            </a>
                        </div>
                        <div class="col-xs-6">
                            <div class="row">

                                <h3 data-content="name"></h3>


                            </div>
                        </div>
                    </div>

                </div>
                <div class="panel-footer">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="pull-right">
                                <span class="badge" data-content="sub_num" data-id="sub_number_id"></span>
                                &nbsp;&nbsp;
                                <button class="btn btn-default btn-add-to-cart" title="点击加入餐车" data-id="id">
                                    <i class="fa fa-rmb"></i>
                                    <span data-content="price"></span>
                                </button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>
    </script>

    <script type="text/html" id="dishListTemplate">
        <div class="row" data-id="typeid">
            <div class="well well-sm type-header" data-content="name"></div>

            <div class="dish-list"></div>
        </div>
    </script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="/resources/js/jquery.loadTemplate-1.4.4.min.js"></script>
    <script src="/resources/js/holder.js"></script>
</head>
<body>

<div class="container" id="mainContainer">
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container">

                <div class="row">

                    <div class="col-xs-8 col-md-8">
                        <div style="margin-top: 8px;">
                            <input type="text" class="form-control" placeholder="点点儿什么？"/>
                        </div>


                    </div>
                    <div class="col-xs-4 col-md-4">

                        <div class="dropdown">

                            <button class="btn btn-default btn-block navbar-btn" data-toggle="dropdown">
                                分类
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="typemenu">
                                <li role="presentation"><a role="menuitem" tabindex="-1" href="#favorite">推荐</a></li>
                                <li role="presentation" class="divider"></li>
                                <li role="presentation"><a role="menuitem" tabindex="-1" href="#hot">热菜</a></li>
                                <li role="presentation" class="divider"></li>
                                <li role="presentation"><a role="menuitem" tabindex="-1" href="#colde">凉菜</a></li>
                                <li role="presentation" class="divider"></li>
                                <li role="presentation"><a role="menuitem" tabindex="-1" href="#drink">酒水</a></li>
                            </ul>
                        </div>
                    </div>

                </div>


        </div>
    </nav>

    <nav class="navbar navbar-inverse navbar-fixed-bottom" role="navigation">
        <!-- We use the fluid option here to avoid overriding the fixed width of a normal container within the narrow content columns. -->
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="pull-left">
                        <p class="navbar-text">
                            <i class="fa fa-cutlery"></i> <span id="summary_info_number"></span>品
                            <i class="fa fa-rmb"></i> <span id="summary_info_fee"></span>
                        </p>

                    </div>
                    <div class="pull-right">
                        <button class="btn btn-danger navbar-btn">去下单</button>
                    </div>
                </div>

            </div>
        </div>
    </nav>

    <div id="dishListContainer">

    </div>

</div>
<script type="application/javascript">
    var type = [{typeid:"favorite",name:"精品推荐",info:[
        {id:"test1",name:"Test1",img_url:"holder.js/100%*100/basic",price:15,sub_number_id:"sub_number_test1"},
        {id:"test2",name:"Test2",img_url:"holder.js/100%*100/basic",price:25,sub_number_id:"sub_number_test2"},
        {id:"test3",name:"Test3",img_url:"holder.js/100%*100/basic",price:35,sub_number_id:"sub_number_test3"}
    ]},{typeid:"hot",name:"养生热菜"}];

    var summary_info = {"count":0,"fee":0,"detail":{}};

    function updateSummaryInfo(count,fee){
        $('#summary_info_number').text(summary_info.count);
        $('#summary_info_fee').text(summary_info.fee);
    }

    $(function(){

        $('#dishListContainer').loadTemplate($("#dishListTemplate"),type);
        $.each(type,function(index,value){
            $('#'+value.typeid+" .dish-list").loadTemplate($('#dishInfoTemplate'),value.info);
        });

        $('.btn-add-to-cart').click(function(){
            var id = $(this).attr('id');
            var price = $(this).children('span').first().text();
            if (!summary_info.detail[id]) {
                summary_info.detail[id] = {fee:parseInt(price),count:0};
            }
            summary_info.detail[id]["count"] = summary_info.detail[id]["count"]++;
            summary_info.count = summary_info.count++;
            summary_info.fee = summary_info.fee + summary_info.detail.id.fee;

            $('#sub_number_' + id).text(summary_info.detail[id]["count"]);
            updateSummaryInfo();
        });
    });

    $('.info_more_trigger').click(function(e){
        e.preventDefault();
        $(this).parent("p").hide().next('p').removeClass('hide');
    });
</script>
</body>
</html>