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

    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    <script src="/resources/js/holder.js"></script>
</head>
<body style="padding-bottom: 70px; padding-top:5px;">

<div class="container">
    <nav class="navbar navbar-default navbar-fixed-bottom" role="navigation">
        <!-- We use the fluid option here to avoid overriding the fixed width of a normal container within the narrow content columns. -->
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-7">
                    <span class="sr-only">私家小厨</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">分类</a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-7">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#favorite">精品推荐</a></li>
                    <li><a href="#type1">分类1</a></li>
                    <li><a href="#type2">分类2</a></li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div>
    </nav>

    <div class="panel panel-default" id="favorite">
        <div class="panel-heading">
            精品推荐
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-sm-6 col-md-4">
                    <div class="thumbnail">
                        <img data-src="holder.js/350x350/basic" alt="...">
                        <div class="caption">
                            <h3>菜名</h3>
                            <p>菜品介绍。。。。</p>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="text-center">
                                        <button class="btn btn-primary"><span class="glyphicon glyphicon-fire"></span> 我要点</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <div class="panel panel-default" id="type1">
        <div class="panel-heading">
            分类1
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-sm-6 col-md-4">
                    <div class="thumbnail">
                        <img data-src="holder.js/350x350/basic" alt="...">
                        <div class="caption">
                            <h3>菜名</h3>
                            <p>菜品介绍。。。。</p>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="text-center">
                                        <button class="btn btn-primary"><span class="glyphicon glyphicon-fire"></span> 我要点</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <div class="panel panel-default" id="type2">
        <div class="panel-heading">
            分类2
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-sm-6 col-md-4">
                    <div class="thumbnail">
                        <img data-src="holder.js/350x350/basic" alt="...">
                        <div class="caption">
                            <h3>菜名</h3>
                            <p>菜品介绍。。。。</p>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="text-center">
                                        <button class="btn btn-primary"><span class="glyphicon glyphicon-fire"></span> 我要点</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
</body>
</html>