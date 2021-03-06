<%--
  Created by IntelliJ IDEA.
  User: meajhlp
  Date: 14-7-14
  Time: 下午11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                                <img data-template-bind='[{"attribute":"src","value":"img_url"}]' alt="...">
                            </a>
                        </div>
                        <div class="col-xs-6">
                            <div class="row">

                                <h3 data-content="name"></h3>
                                <p class="text-muted">月售 <strong data-content="sales"></strong> 份</p>
                                <p class="text-warning" data-id="star_info_id">

                                </p>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="panel-footer">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="pull-right">
                                <span class="badge text-primary" data-content="sub_num" data-id="sub_number_id"></span>
                                &nbsp;&nbsp;
                                <button class="btn btn-default btn-add-to-cart" title="点击加入餐车" data-id="id"  data-template-bind='[{"attribute":"data-name","value":"name"},{"attribute":"data-price","value":"price"},{"attribute":"data-sub-number-id","value":"sub_number_id"}]'>
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

    <script type="text/html" id="dishMenuTemplate">
        <li role="presentation"><a role="menuitem" tabindex="-1" data-href="href" data-content="name"></a></li>
        <li role="presentation" class="divider"></li>
    </script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="/resources/js/jquery.loadTemplate-1.4.4.min.js"></script>

</head>
<body>

<div class="container" id="mainContainer">
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container">

                <div class="row">

                    <div class="col-xs-8 col-md-8">
                        <div style="margin-top: 8px;">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-search"></i></span>
                                <input type="text" class="form-control" placeholder="点点儿什么？"/>
                            </div>

                        </div>


                    </div>
                    <div class="col-xs-4 col-md-4">

                        <div class="dropdown">

                            <button class="btn btn-default btn-block navbar-btn" data-toggle="dropdown">
                                分类
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="typemenu" id="dishMenuContainer">

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
                        <p class="navbar-text" id="billSummaryTrigger" data-html="true" data-container="body" data-toggle="popover" data-placement="top" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus.">
                            <i class="fa fa-cutlery"></i>&nbsp;&nbsp;<strong id="summary_info_number"></strong>&nbsp;&nbsp;例&nbsp;&nbsp;
                            <i class="fa fa-rmb"></i>&nbsp;&nbsp;<strong id="summary_info_fee"></strong>
                        </p>

                    </div>
                    <div class="pull-right">
                        <form action="/bill/view" method="post" enctype="application/x-www-form-urlencoded">
                            <input type="hidden" name="param" id="billInfoParam"/>
                            <button id="submitBillBtn" class="btn btn-danger navbar-btn">去下单</button>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </nav>

    <div id="dishListMask">
        <div class="row">
            <div class="col-xs-12">
                <div class="text-center type-header">
                    <h1><i class="fa fa-spin fa-spinner"></i></h1>
                </div>
            </div>
        </div>
    </div>

    <div id="dishListContainer" class="hide">

    </div>

</div>
<script type="application/javascript">
    /*var type = [{typeid:"favorite",href:"#favorite",name:"精品推荐",info:[
        {id:"1",name:"虎皮尖椒",img_url:"/resources/img/hpjj.jpg",price:22,month_sell_sum:145,sub_number_id:"sub_number_1",star_info_id:"star_info_1",star_info:5},
        {id:"2",name:"萝卜干煎蛋",img_url:"/resources/img/lbgjd.jpg",price:20,month_sell_sum:3455,sub_number_id:"sub_number_2",star_info_id:"star_info_2",star_info:4},
        {id:"3",name:"松仁玉米",img_url:"/resources/img/srym.jpg",price:28,month_sell_sum:1233,sub_number_id:"sub_number_3",star_info_id:"star_info_3",star_info:3}
    ]},{typeid:"hot",href:"#hot",name:"养生热菜",info:[
        {id:"4",name:"王府回锅肉",img_url:"/resources/img/wfhgr.jpg",price:28,month_sell_sum:656,sub_number_id:"sub_number_4",star_info_id:"star_info_4",star_info:5},
        {id:"5",name:"西芹百合",img_url:"/resources/img/xqbh.jpg",price:28,month_sell_sum:989,sub_number_id:"sub_number_5",star_info_id:"star_info_5",star_info:4},
        {id:"6",name:"咸鱼茄子煲",img_url:"/resources/img/xyqzb.jpg",price:26,month_sell_sum:989,sub_number_id:"sub_number_6",star_info_id:"star_info_6",star_info:4}
    ]}];*/
    var type = ${typedata};

    var summary_info = {count:0,fee:0,detail:{}};

    function updateSummaryInfo(){
        $('#summary_info_number').text(summary_info.count);
        $('#summary_info_fee').text(summary_info.fee);

        var popoverHtml = "";
        $.each(summary_info.detail,function(i,v){
            popoverHtml += "<li class=\"list-group-item\"><span class=\"badge\">"+ v.count +"</span>"+ v.name+"</li>";

        });
        $('#billSummaryTrigger').attr("data-content","<ul class=\"list-group\">"+popoverHtml+"</ul>");

        $('#billSummaryTrigger').popover();
    }


    $(function(){
        $('#dishListContainer').loadTemplate($("#dishListTemplate"),type);
        $('#dishMenuContainer').loadTemplate($('#dishMenuTemplate'),type);
        $.each(type,function(index,value){
            if ($.isArray(value.info) && value.info.length > 0){
                $('#'+value.typeid+" .dish-list").loadTemplate($('#dishInfoTemplate'),value.info);

                $.each(value.info,function(i,v){
                    var tmpHtml = "";
                    for (var j=0;j<5;j++){
                        if (j< v.starts){
                            tmpHtml += "<i class=\"fa fa-star\"></i>";
                        }else{
                            tmpHtml += "<i class=\"fa fa-star-o\"></i>";
                        }
                    }
                    $("#" + v.star_info_id).html(tmpHtml);
                });
            }

        });


        $('#dishListMask').remove();
        $('#dishListContainer').removeClass('hide');

        $('.btn-add-to-cart').click(function(){
            var id = $(this).attr('id');
            var price = parseInt($(this).attr('data-price'));
            var name = $(this).attr('data-name');
            if (!summary_info.detail[id]) {
                summary_info.detail[id] = {fee:price,count:0,name:name};
            }
            summary_info.detail[id]["count"] = summary_info.detail[id]["count"]+1;
            summary_info['count'] = summary_info['count']+1;
            summary_info['fee'] = summary_info['fee'] + summary_info.detail[id]['fee'];

            $('#' + $(this).attr('data-sub-number-id')).text(summary_info.detail[id]["count"]);

            updateSummaryInfo();

            console.log(summary_info);
        });

        $('#submitBillBtn').click(function(){
            if ($(this).hasClass('disabled')){
                return;
            }else{
                $(this).addClass('disabled');
                $('#billInfoParam').val(JSON.stringify(summary_info.detail));
                $(this).parent("form").submit();
            }

        });
    });


</script>
</body>
</html>