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

    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    <script src="/resources/js/holder.js"></script>

    <style type="text/css">
        body {padding-bottom: 70px;}
        .type-header {margin-top:70px;}
    </style>
</head>
<body>

<div class="container">
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

    <nav class="navbar navbar-default navbar-fixed-bottom" role="navigation">
        <!-- We use the fluid option here to avoid overriding the fixed width of a normal container within the narrow content columns. -->
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="pull-left">
                        <p class="navbar-text">
                            <i class="fa fa-cutlery"></i> 3品 <i class="fa fa-rmb"></i> 145
                        </p>

                    </div>
                    <div class="pull-right">
                        <button class="btn btn-primary navbar-btn">去下单</button>
                    </div>
                </div>

            </div>
        </div>
    </nav>

    <div class="row" id="favorite">
        <div class="well well-sm type-header">精品推荐</div>

        <div class="col-xs-12 col-md-4">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-6">
                            <a href="#" class="thumbnail">
                                <img data-src="holder.js/100%x139/basic" alt="...">
                            </a>
                        </div>
                        <div class="col-xs-6">
                            <div class="row">

                                <h3>菜名</h3>
                                <br/>
                                <a href="#" class="info-detail-trigger">详细介绍</a>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="panel-footer">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="pull-right">
                                <span class="badge">1</span>
                                &nbsp;&nbsp;
                                <button class="btn btn-default" title="点击加入餐车">
                                    <i class="fa fa-rmb"></i>
                                    15
                                </button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>

        <div class="col-xs-12 col-md-4">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-6">
                            <a href="#" class="thumbnail">
                                <img data-src="holder.js/100%x139/basic" alt="...">
                            </a>
                        </div>
                        <div class="col-xs-6">
                            <div class="row">

                                <h3>菜名</h3>

                            </div>
                        </div>
                    </div>

                </div>
                <div class="panel-footer">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="pull-right">
                                <span class="badge">1</span>
                                &nbsp;&nbsp;
                                <button class="btn btn-default" title="点击加入餐车">
                                    <i class="fa fa-rmb"></i>
                                    15
                                </button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>

        <div class="col-xs-12 col-md-4">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-6">
                            <a href="#" class="thumbnail">
                                <img data-src="holder.js/100%x139/basic" alt="...">
                            </a>
                        </div>
                        <div class="col-xs-6">
                            <div class="row">

                                <h3>菜名</h3>

                            </div>
                        </div>
                    </div>

                </div>
                <div class="panel-footer">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="pull-right">
                                <span class="badge">1</span>
                                &nbsp;&nbsp;
                                <button class="btn btn-default" title="点击加入餐车">
                                    <i class="fa fa-rmb"></i>
                                    15
                                </button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>

        <div class="col-xs-12 col-md-4">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-6">
                            <a href="#" class="thumbnail">
                                <img data-src="holder.js/100%x139/basic" alt="...">
                            </a>
                        </div>
                        <div class="col-xs-6">
                            <div class="row">

                                <h3>菜名</h3>

                            </div>
                        </div>
                    </div>

                </div>
                <div class="panel-footer">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="pull-right">
                                <span class="badge">1</span>
                                &nbsp;&nbsp;
                                <button class="btn btn-default" title="点击加入餐车">
                                    <i class="fa fa-rmb"></i>
                                    15
                                </button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <div class="row" id="hot">
        <div class="well well-sm type-header">养生热菜</div>

        <div class="col-xs-12 col-md-4">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-6">
                            <a href="#" class="thumbnail">
                                <img data-src="holder.js/100%x139/basic" alt="...">
                            </a>
                        </div>
                        <div class="col-xs-6">
                            <div class="row">

                                <h3>菜名</h3>

                            </div>
                        </div>
                    </div>

                </div>
                <div class="panel-footer">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="pull-right">
                                <span class="badge">1</span>
                                &nbsp;&nbsp;
                                <button class="btn btn-default" title="点击加入餐车">
                                    <i class="fa fa-rmb"></i>
                                    15
                                </button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>

        <div class="col-xs-12 col-md-4">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-6">
                            <a href="#" class="thumbnail">
                                <img data-src="holder.js/100%x139/basic" alt="...">
                            </a>
                        </div>
                        <div class="col-xs-6">
                            <div class="row">

                                <h3>菜名</h3>

                            </div>
                        </div>
                    </div>

                </div>
                <div class="panel-footer">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="pull-right">
                                <span class="badge">1</span>
                                &nbsp;&nbsp;
                                <button class="btn btn-default" title="点击加入餐车">
                                    <i class="fa fa-rmb"></i>
                                    15
                                </button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>

        <div class="col-xs-12 col-md-4">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-6">
                            <a href="#" class="thumbnail">
                                <img data-src="holder.js/100%x139/basic" alt="...">
                            </a>
                        </div>
                        <div class="col-xs-6">
                            <div class="row">

                                <h3>菜名</h3>

                            </div>
                        </div>
                    </div>

                </div>
                <div class="panel-footer">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="pull-right">
                                <span class="badge">1</span>
                                &nbsp;&nbsp;
                                <button class="btn btn-default" title="点击加入餐车">
                                    <i class="fa fa-rmb"></i>
                                    15
                                </button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>

        <div class="col-xs-12 col-md-4">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-6">
                            <a href="#" class="thumbnail">
                                <img data-src="holder.js/100%x139/basic" alt="...">
                            </a>
                        </div>
                        <div class="col-xs-6">
                            <div class="row">

                                <h3>菜名</h3>

                            </div>
                        </div>
                    </div>

                </div>
                <div class="panel-footer">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="pull-right">
                                <span class="badge">1</span>
                                &nbsp;&nbsp;
                                <button class="btn btn-default" title="点击加入餐车">
                                    <i class="fa fa-rmb"></i>
                                    15
                                </button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <div class="row" id="hot">
        <div class="well well-sm type-header">养生热菜</div>

        <div class="col-xs-12 col-md-4">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-6">
                            <a href="#" class="thumbnail">
                                <img data-src="holder.js/100%x139/basic" alt="...">
                            </a>
                        </div>
                        <div class="col-xs-6">
                            <div class="row">

                                <h3>菜名</h3>

                            </div>
                        </div>
                    </div>

                </div>
                <div class="panel-footer">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="pull-right">
                                <span class="badge">1</span>
                                &nbsp;&nbsp;
                                <button class="btn btn-default" title="点击加入餐车">
                                    <i class="fa fa-rmb"></i>
                                    15
                                </button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>

        <div class="col-xs-12 col-md-4">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-6">
                            <a href="#" class="thumbnail">
                                <img data-src="holder.js/100%x139/basic" alt="...">
                            </a>
                        </div>
                        <div class="col-xs-6">
                            <div class="row">

                                <h3>菜名</h3>

                            </div>
                        </div>
                    </div>

                </div>
                <div class="panel-footer">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="pull-right">
                                <span class="badge">1</span>
                                &nbsp;&nbsp;
                                <button class="btn btn-default" title="点击加入餐车">
                                    <i class="fa fa-rmb"></i>
                                    15
                                </button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>

        <div class="col-xs-12 col-md-4">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-6">
                            <a href="#" class="thumbnail">
                                <img data-src="holder.js/100%x139/basic" alt="...">
                            </a>
                        </div>
                        <div class="col-xs-6">
                            <div class="row">

                                <h3>菜名</h3>

                            </div>
                        </div>
                    </div>

                </div>
                <div class="panel-footer">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="pull-right">
                                <span class="badge">1</span>
                                &nbsp;&nbsp;
                                <button class="btn btn-default" title="点击加入餐车">
                                    <i class="fa fa-rmb"></i>
                                    15
                                </button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>

        <div class="col-xs-12 col-md-4">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-6">
                            <a href="#" class="thumbnail">
                                <img data-src="holder.js/100%x139/basic" alt="...">
                            </a>
                        </div>
                        <div class="col-xs-6">
                            <div class="row">

                                <h3>菜名</h3>

                            </div>
                        </div>
                    </div>

                </div>
                <div class="panel-footer">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="pull-right">
                                <span class="badge">1</span>
                                &nbsp;&nbsp;
                                <button class="btn btn-default" title="点击加入餐车">
                                    <i class="fa fa-rmb"></i>
                                    15
                                </button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div><div class="row" id="cold">
        <div class="well well-sm type-header">爽口凉菜</div>

        <div class="col-xs-12 col-md-4">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-6">
                            <a href="#" class="thumbnail">
                                <img data-src="holder.js/100%x139/basic" alt="...">
                            </a>
                        </div>
                        <div class="col-xs-6">
                            <div class="row">

                                <h3>菜名</h3>

                            </div>
                        </div>
                    </div>

                </div>
                <div class="panel-footer">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="pull-right">
                                <span class="badge">1</span>
                                &nbsp;&nbsp;
                                <button class="btn btn-default" title="点击加入餐车">
                                    <i class="fa fa-rmb"></i>
                                    15
                                </button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>

        <div class="col-xs-12 col-md-4">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-6">
                            <a href="#" class="thumbnail">
                                <img data-src="holder.js/100%x139/basic" alt="...">
                            </a>
                        </div>
                        <div class="col-xs-6">
                            <div class="row">

                                <h3>菜名</h3>

                            </div>
                        </div>
                    </div>

                </div>
                <div class="panel-footer">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="pull-right">
                                <span class="badge">1</span>
                                &nbsp;&nbsp;
                                <button class="btn btn-default" title="点击加入餐车">
                                    <i class="fa fa-rmb"></i>
                                    15
                                </button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>

        <div class="col-xs-12 col-md-4">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-6">
                            <a href="#" class="thumbnail">
                                <img data-src="holder.js/100%x139/basic" alt="...">
                            </a>
                        </div>
                        <div class="col-xs-6">
                            <div class="row">

                                <h3>菜名</h3>

                            </div>
                        </div>
                    </div>

                </div>
                <div class="panel-footer">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="pull-right">
                                <span class="badge">1</span>
                                &nbsp;&nbsp;
                                <button class="btn btn-default" title="点击加入餐车">
                                    <i class="fa fa-rmb"></i>
                                    15
                                </button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <div class="row" id="drink">
        <div class="well well-sm type-header">酒水饮料</div>


        <div class="col-xs-12 col-md-4">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-6">
                            <a href="#" class="thumbnail">
                                <img data-src="holder.js/100%x139/basic" alt="...">
                            </a>
                        </div>
                        <div class="col-xs-6">
                            <div class="row">

                                <h3>菜名</h3>

                            </div>
                        </div>
                    </div>

                </div>
                <div class="panel-footer">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="pull-right">
                                <span class="badge">1</span>
                                &nbsp;&nbsp;
                                <button class="btn btn-default" title="点击加入餐车">
                                    <i class="fa fa-rmb"></i>
                                    15
                                </button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>

        <div class="col-xs-12 col-md-4">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-6">
                            <a href="#" class="thumbnail">
                                <img data-src="holder.js/100%x139/basic" alt="...">
                            </a>
                        </div>
                        <div class="col-xs-6">
                            <div class="row">

                                <h3>菜名</h3>

                            </div>
                        </div>
                    </div>

                </div>
                <div class="panel-footer">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="pull-right">
                                <span class="badge">1</span>
                                &nbsp;&nbsp;
                                <button class="btn btn-default" title="点击加入餐车">
                                    <i class="fa fa-rmb"></i>
                                    15
                                </button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<script type="application/javascript">


    $('.info_more_trigger').click(function(e){
        e.preventDefault();
        $(this).parent("p").hide().next('p').removeClass('hide');
    });
</script>
</body>
</html>