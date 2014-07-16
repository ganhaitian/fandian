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
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    <style type="text/css">

        body {padding-bottom: 70px;}

        .item-list {
            list-style: none outside none;
            margin-top: 50px;
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
            font-weight: 500;
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

        .top-header {
            background-color: #3993CF;
        }

        .footbar{
            background-color: #2F373E;
            color: #fff;
            font-size: 18px;
        }

        .btn-price{
            background-color: #3993CF;
            color: #fff;
            font-size: 16px;
        }

        .nav-search {
            line-height: 24px;
        }

        span.input-icon {
            display: inline-block;
        }

        .input-icon {
            position: relative;
        }

        .input-icon > input {
            padding-left: 24px;
            padding-right: 6px;
        }

        .nav-search .nav-search-icon {
            background-color: transparent;
            color: #6fb3e0 !important;
            font-size: 14px !important;
            line-height: 24px !important;
        }

        .nav-search-icon {
            border: medium none;
            border-radius: 0;
            bottom: 1px;
            color: #909090;
            display: inline-block;
            font-size: 16px;
            left: 3px;
            line-height: 28px;
            padding: 0 3px;
            position: absolute;
            top: 2px;
            z-index: 2;
        }

    </style>
</head>
<body>
<div class="container-fluid">
    <nav class="navbar navbar-fixed-top top-header" role="navigation">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-md-8">
                    <div class="input-group margin-bottom-sm" style="margin-top: 8px;width:100%" >
                        <%--<span class="input-group-addon"><i class="fa fa-search fa-fw"></i></span>--%>
                        <input type="text" class="form-control" style="padding-left: 24px;" placeholder="快点..."/>
                        <i class="ace-icon fa fa-search fa-2x nav-search-icon"></i>
                    </div>
                     <%--<div id="nav-search" class="nav-search" style="margin-top: 8px;" >
						<span class="input-icon">
							<input type="text" autocomplete="off" id="nav-search-input" class="form-control nav-search-input" placeholder="快点 ...">
							<i class="ace-icon fa fa-search fa-2x nav-search-icon"></i>
					    </span>
                     </div>--%>
                </div>
            </div>
        </div>
    </nav>

    <nav class="navbar footbar navbar-fixed-bottom" role="navigation">
        <!-- We use the fluid option here to avoid overriding the fixed width of a normal container within the narrow content columns. -->
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="pull-left">
                        <p class="navbar-text">
                            <i class="fa fa-cutlery"></i> 3品 <i class="fa fa-rmb"></i>145
                        </p>

                    </div>
                    <div class="pull-right">
                        <button class="btn btn-danger navbar-btn">去下单</button>
                    </div>
                </div>

            </div>
        </div>
    </nav>

    <div class="row menu-content">
            <ul class="item-list">
                <li class="header"> 烹羊世家</li>
                <li class="item-orange">
                    <label class="inline">
                        <span class="lbl"> 五香扣羊</span>
                    </label>
                    <div class="pull-right">
                        <button class="btn btn-price">
                            ¥25
                        </button>
                    </div>
                </li>
                <li class="item-orange">
                    <label class="inline">
                        <span class="lbl"> 羊肉串</span>
                    </label>
                    <div class="inline pull-right position-relative dropdown-hover">
                        <button class="btn btn-price">
                            ¥25
                        </button>
                    </div>
                </li>
                <li class="item-orange">
                    <label class="inline">
                        <span class="lbl"> 椰子饭</span>
                    </label>
                    <div class="inline pull-right position-relative dropdown-hover">
                        <button class="btn btn-price">
                            ¥50
                        </button>
                    </div>
                </li>
                <li class="item-orange">
                    <label class="inline">
                        <span class="lbl"> 干煸羊</span>
                    </label>
                    <div class="inline pull-right position-relative dropdown-hover">
                        <button class="btn btn-price">
                            ¥100
                        </button>
                    </div>
                </li>
                <li class="item-orange">
                    <label class="inline">
                        <span class="lbl"> 炸羊排</span>
                    </label>
                    <div class="inline pull-right position-relative dropdown-hover">
                        <button class="btn btn-price">
                            ¥75
                        </button>
                    </div>
                </li>
                <li class="item-orange">
                    <label class="inline">
                        <span class="lbl"> 姜葱爆羊肚</span>
                    </label>
                    <div class="inline pull-right position-relative dropdown-hover">
                        <button class="btn btn-price">
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
                        <button class="btn btn-price">
                            ¥53
                        </button>
                    </div>
                </li>
                <li class="item-orange">
                    <label class="inline">
                        <span class="lbl"> 脆皮乳猪</span>
                    </label>
                    <div class="inline pull-right position-relative dropdown-hover">
                        <button class="btn btn-price">
                            ¥68
                        </button>
                    </div>
                </li>
                <li class="item-orange">
                    <label class="inline">
                        <span class="lbl"> 蜜汁叉烧</span>
                    </label>
                    <div class="inline pull-right position-relative dropdown-hover">
                        <button class="btn btn-price">
                            ¥48
                        </button>
                    </div>
                </li>
                <li class="item-orange">
                    <label class="inline">
                        <span class="lbl"> 卤水拼盘</span>
                    </label>
                    <div class="inline pull-right position-relative dropdown-hover">
                        <button class="btn btn-price">
                            ¥48
                        </button>
                    </div>
                </li>
            </ul>
    </div>
    </div>
</body>
</html>
