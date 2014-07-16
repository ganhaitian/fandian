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

    <div class="row" style="background-color: whitesmoke;">
        <div class="col-xs-3">
            <div class="affix affix-top">
                <ul class="nav nav-pills nav-stacked" id="myTab">
                    <li class="active"><a href="#favorite">推荐</a></li>
                    <li><a href="#hot">凉菜</a></li>
                    <li><a href="#cold">热菜</a></li>
                    <li><a href="#soup">汤</a></li>
                    <li><a href="#staple">主食</a></li>
                    <li><a href="#drink">酒水</a></li>
                </ul>
            </div>
        </div>
        <div class="col-xs-9"  style="background-color: white;">
            <div class="tab-content">
                <div class="tab-pane active" id="favorite">
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
                <div class="tab-pane" id="hot">
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
                <div class="tab-pane" id="cold">
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
                <div class="tab-pane" id="soup">
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
                <div class="tab-pane" id="staple">
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
                <div class="tab-pane" id="drink">
                    <div class="row">
                        <div class="col-sm-6 col-md-4">
                            <div class="thumbnail">
                                <img data-src="holder.js/350x350/basic" alt="...">
                                <div class="caption">
                                    <h3>菜名</h3>
                                    <p><span class="info_summary">介绍摘要</span><span class="info_dots">...</span><a href="#" class="info_more_trigger">更多</a> </p>
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
    </div>


</div>
<script type="application/javascript">
    $('#myTab a').click(function (e) {
        e.preventDefault()
        $(this).tab('show')
    })
</script>
</body>
</html>