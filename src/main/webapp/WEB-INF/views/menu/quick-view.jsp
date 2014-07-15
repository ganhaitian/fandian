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
        .item-list {
            list-style: none outside none;
            margin: 0;
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
            background-color: #999;
            border-color: #999;
        }

        .infobox-content {
            color: #fff;
            width:60px;
            float:left;
        }

    </style>
</head>
<body>
    <div class="row">
        <div class="col-xs-12">
            <ul class="item-list">
                <li class="item-orange">
                    <label class="inline">
                        <span class="lbl"> 五香扣羊</span>
                    </label>
                    <div class="inline pull-right position-relative dropdown-hover">
                        <button class="btn btn-primary">
                            <i class="">¥25</i>
                        </button>
                    </div>
                </li>
                <li class="item-orange">
                    <label class="inline">
                        <span class="lbl"> 羊肉串</span>
                    </label>
                    <div class="inline pull-right position-relative dropdown-hover">
                        <button class="btn btn-primary">
                            <i class="icon-only bigger-120">¥25</i>
                        </button>
                    </div>
                </li>
                <li class="item-orange">
                    <label class="inline">
                        <span class="lbl"> 椰子饭</span>
                    </label>
                    <div class="inline pull-right position-relative dropdown-hover">
                        <button class="btn btn-primary">
                            <i class="icon-only bigger-120">¥50</i>
                        </button>
                    </div>
                </li>
                <li class="item-orange">
                    <label class="inline">
                        <span class="lbl"> 干煸羊</span>
                    </label>
                    <div class="inline pull-right position-relative dropdown-hover">
                        <button class="btn btn-primary">
                            <i class="icon-only bigger-120">¥100</i>
                        </button>
                    </div>
                </li>
                <li class="item-orange">
                    <label class="inline">
                        <span class="lbl"> 炸羊排</span>
                    </label>
                    <div class="inline pull-right position-relative dropdown-hover">
                        <button class="btn btn-primary">
                            <i class="icon-only bigger-120">¥75</i>
                        </button>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <footer class="footer">
        <div class="col-xs-12 infobox infobox-dark infobox-grey">
            <div class="infobox-dark infobox-content">
                4份105
            </div>
            <div class="inline pull-right position-relative dropdown-hover">
                <button class="btn btn-danger">
                    <i class="icon-only bigger-120">去结算</i>
                </button>
            </div>
        </div>
    </footer>
</body>
</html>
