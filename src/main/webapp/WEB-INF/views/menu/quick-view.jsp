<%--
  Created by IntelliJ IDEA.
  User: gan
  Date: 14-7-15
  Time: 下午9:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>菜单</title>

    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    <style type="text/css">

        body {padding-bottom: 70px;}

        .item-list {
            list-style: none outside none;
            margin-top: 70px;
            padding: 0;
        }

        li[class*="item-"] {
            -moz-border-bottom-colors: none;
            -moz-border-left-colors: none;
            -moz-border-right-colors: none;
            -moz-border-top-colors: none;
            border-color: #ddd;
            border-image: none;
            border-style: solid;
            border-width: 1px 1px 1px 3px;
        }
        .item-list > li {
            background-color: #fff;
            margin-top: -1px;
            padding: 9px;
            position: relative;
        }

        .item-list > li label{
            font-size:18px;
            font-weight: 800;
        }

        .item-list button{
            width:70px;
        }

        .item-list .header{
            background-color: #DDDDDD;
            font-size: 14px;
            color:#7E7E7E;
            padding-bottom: 4px;
            padding-top: 4px;
            padding-left: 12px;
        }

        .infobox {
            -moz-border-bottom-colors: none;
            -moz-border-left-colors: none;
            -moz-border-right-colors: none;
            -moz-border-top-colors: none;
            background-color: #fff;
            border-color: #d8d8d8 !important;
            border-image: none;
            border-radius: 0;
            border-style: dotted;
            border-width: 1px;
            box-shadow: none;
            color: #555;
            display: inline-block;
            height: 46px;
            margin: -1px 0 0 -1px;
            padding: 8px 3px 6px 9px;
            position: relative;
            text-align: left;
            vertical-align: middle;
            width: 100%;
        }

        .infobox-dark {
            border-color: transparent !important;
            border-width: 0;
            color: #fff;
            margin: 1px 1px 0 0;
            padding: 4px;
        }

        .infobox-grey {
            border-color: #999;
            color: #999;
        }

        .footer{
            position:absolute;
            bottom:0;
            left:0;
            right:0;
        }

        .infobox-grey.infobox-dark {
            background-color: #2F373E;
            border-color: #2F373E;
        }

        .infobox-content {
            color: #fff;
            width:200px;
            float:left;
            font-size:18px;
        }

        .menu-content{

        }

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
    
    <div class="row menu-content">
        <div class="col-xs-12">
            <ul class="item-list">
                <li class="header"> 烹羊世家</li>
                <li class="item-orange">
                    <label class="inline">
                        <span class="lbl"> 五香扣羊</span>
                    </label>
                    <div class="inline pull-right position-relative dropdown-hover">
                        <button class="btn btn-primary">
                            ¥25
                        </button>
                    </div>
                </li>
                <li class="item-orange">
                    <label class="inline">
                        <span class="lbl"> 羊肉串</span>
                    </label>
                    <div class="inline pull-right position-relative dropdown-hover">
                        <button class="btn btn-primary">
                            ¥25
                        </button>
                    </div>
                </li>
                <li class="item-orange">
                    <label class="inline">
                        <span class="lbl"> 椰子饭</span>
                    </label>
                    <div class="inline pull-right position-relative dropdown-hover">
                        <button class="btn btn-primary">
                            ¥50
                        </button>
                    </div>
                </li>
                <li class="item-orange">
                    <label class="inline">
                        <span class="lbl"> 干煸羊</span>
                    </label>
                    <div class="inline pull-right position-relative dropdown-hover">
                        <button class="btn btn-primary">
                            ¥100
                        </button>
                    </div>
                </li>
                <li class="item-orange">
                    <label class="inline">
                        <span class="lbl"> 炸羊排</span>
                    </label>
                    <div class="inline pull-right position-relative dropdown-hover">
                        <button class="btn btn-primary">
                            ¥75
                        </button>
                    </div>
                </li>
                <li class="item-orange">
                    <label class="inline">
                        <span class="lbl"> 姜葱爆羊肚</span>
                    </label>
                    <div class="inline pull-right position-relative dropdown-hover">
                        <button class="btn btn-primary">
                            ¥58
                        </button>
                    </div>
                </li>
                <li class="header"> 卤味叉烧</li>
                <li class="item-orange">
                    <label class="inline">
                        <span class="lbl"> 白切文昌鸡</span>
                    </label>
                    <div class="inline pull-right position-relative dropdown-hover">
                        <button class="btn btn-primary">
                            ¥53
                        </button>
                    </div>
                </li>
                <li class="item-orange">
                    <label class="inline">
                        <span class="lbl"> 脆皮乳猪</span>
                    </label>
                    <div class="inline pull-right position-relative dropdown-hover">
                        <button class="btn btn-primary">
                            ¥68
                        </button>
                    </div>
                </li>
                <li class="item-orange">
                    <label class="inline">
                        <span class="lbl"> 蜜汁叉烧</span>
                    </label>
                    <div class="inline pull-right position-relative dropdown-hover">
                        <button class="btn btn-primary">
                            ¥48
                        </button>
                    </div>
                </li>
                <li class="item-orange">
                    <label class="inline">
                        <span class="lbl"> 卤水拼盘</span>
                    </label>
                    <div class="inline pull-right position-relative dropdown-hover">
                        <button class="btn btn-primary">
                            ¥48
                        </button>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    </div>
</body>
</html>
