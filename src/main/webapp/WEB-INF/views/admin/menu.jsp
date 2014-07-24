<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<%
    String realPath = application.getContextPath();
%>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Bootstrap Admin Theme</title>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

    <!-- MetisMenu CSS -->
    <link href="<%=realPath %>/resources/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Timeline CSS -->
    <link href="<%=realPath %>/resources/css/plugins/timeline.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<%=realPath %>/resources/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="<%=realPath %>/resources/css/plugins/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link rel="stylesheet"
          href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">

    <link href="<%=realPath %>/resources/css/plugins/jquery.dataTables.min.css" rel="stylesheet">

    <style type="text/css">

        td {
            line-height: 2;
            padding: 5px;
        }

        table.simple-table td {
            border-top: 1px solid #ddd;
        }

        table.simple-table tbody tr:first-child td {
            border-top: none;
        }

        td.details-control {
            background: url('<%=realPath %>/resources/img/details_open.png') no-repeat center center;
            cursor: pointer;
        }

        tr.details td.details-control {
            background: url('<%=realPath %>/resources/img/details_close.png') no-repeat center center;
        }

        .menu-list .nav-second-level li a {
            padding-left: 27px;
        }

        .toolbar {
            float: right;
            margin-left:8px;
        }

        #menu_panel{
            border-left:1px solid #eee;
        }

        .category-header{
           /* background-color: #EEEEEE;*/
            padding: 5px 5px 25px 6px;
            border-bottom: 1px solid #000;
        }

        .menu-list li a{
            padding: 10px 15px 10px 5px;
        }

    </style>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

<div id="wrapper">

<!-- Navigation -->
<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
<div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse"
            data-target=".navbar-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="index.html">SB Admin v2.0</a>
</div>
<!-- /.navbar-header -->

<ul class="nav navbar-top-links navbar-right">
<li class="dropdown">
    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
        <i class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i>
    </a>
    <ul class="dropdown-menu dropdown-messages">
        <li>
            <a href="#">
                <div>
                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                </div>
                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque
                    eleifend...
                </div>
            </a>
        </li>
        <li class="divider"></li>
        <li>
            <a href="#">
                <div>
                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                </div>
                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque
                    eleifend...
                </div>
            </a>
        </li>
        <li class="divider"></li>
        <li>
            <a href="#">
                <div>
                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                </div>
                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque
                    eleifend...
                </div>
            </a>
        </li>
        <li class="divider"></li>
        <li>
            <a class="text-center" href="#">
                <strong>Read All Messages</strong>
                <i class="fa fa-angle-right"></i>
            </a>
        </li>
    </ul>
    <!-- /.dropdown-messages -->
</li>
<!-- /.dropdown -->
<li class="dropdown">
    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
        <i class="fa fa-tasks fa-fw"></i> <i class="fa fa-caret-down"></i>
    </a>
    <ul class="dropdown-menu dropdown-tasks">
        <li>
            <a href="#">
                <div>
                    <p>
                        <strong>Task 1</strong>
                        <span class="pull-right text-muted">40% Complete</span>
                    </p>

                    <div class="progress progress-striped active">
                        <div class="progress-bar progress-bar-success" role="progressbar"
                             aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
                             style="width: 40%">
                            <span class="sr-only">40% Complete (success)</span>
                        </div>
                    </div>
                </div>
            </a>
        </li>
        <li class="divider"></li>
        <li>
            <a href="#">
                <div>
                    <p>
                        <strong>Task 2</strong>
                        <span class="pull-right text-muted">20% Complete</span>
                    </p>

                    <div class="progress progress-striped active">
                        <div class="progress-bar progress-bar-info" role="progressbar"
                             aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"
                             style="width: 20%">
                            <span class="sr-only">20% Complete</span>
                        </div>
                    </div>
                </div>
            </a>
        </li>
        <li class="divider"></li>
        <li>
            <a href="#">
                <div>
                    <p>
                        <strong>Task 3</strong>
                        <span class="pull-right text-muted">60% Complete</span>
                    </p>

                    <div class="progress progress-striped active">
                        <div class="progress-bar progress-bar-warning" role="progressbar"
                             aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
                             style="width: 60%">
                            <span class="sr-only">60% Complete (warning)</span>
                        </div>
                    </div>
                </div>
            </a>
        </li>
        <li class="divider"></li>
        <li>
            <a href="#">
                <div>
                    <p>
                        <strong>Task 4</strong>
                        <span class="pull-right text-muted">80% Complete</span>
                    </p>

                    <div class="progress progress-striped active">
                        <div class="progress-bar progress-bar-danger" role="progressbar"
                             aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"
                             style="width: 80%">
                            <span class="sr-only">80% Complete (danger)</span>
                        </div>
                    </div>
                </div>
            </a>
        </li>
        <li class="divider"></li>
        <li>
            <a class="text-center" href="#">
                <strong>See All Tasks</strong>
                <i class="fa fa-angle-right"></i>
            </a>
        </li>
    </ul>
    <!-- /.dropdown-tasks -->
</li>
<!-- /.dropdown -->
<li class="dropdown">
    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
        <i class="fa fa-bell fa-fw"></i> <i class="fa fa-caret-down"></i>
    </a>
    <ul class="dropdown-menu dropdown-alerts">
        <li>
            <a href="#">
                <div>
                    <i class="fa fa-comment fa-fw"></i> New Comment
                    <span class="pull-right text-muted small">4 minutes ago</span>
                </div>
            </a>
        </li>
        <li class="divider"></li>
        <li>
            <a href="#">
                <div>
                    <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                    <span class="pull-right text-muted small">12 minutes ago</span>
                </div>
            </a>
        </li>
        <li class="divider"></li>
        <li>
            <a href="#">
                <div>
                    <i class="fa fa-envelope fa-fw"></i> Message Sent
                    <span class="pull-right text-muted small">4 minutes ago</span>
                </div>
            </a>
        </li>
        <li class="divider"></li>
        <li>
            <a href="#">
                <div>
                    <i class="fa fa-tasks fa-fw"></i> New Task
                    <span class="pull-right text-muted small">4 minutes ago</span>
                </div>
            </a>
        </li>
        <li class="divider"></li>
        <li>
            <a href="#">
                <div>
                    <i class="fa fa-upload fa-fw"></i> Server Rebooted
                    <span class="pull-right text-muted small">4 minutes ago</span>
                </div>
            </a>
        </li>
        <li class="divider"></li>
        <li>
            <a class="text-center" href="#">
                <strong>See All Alerts</strong>
                <i class="fa fa-angle-right"></i>
            </a>
        </li>
    </ul>
    <!-- /.dropdown-alerts -->
</li>
<!-- /.dropdown -->
<li class="dropdown">
    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
    </a>
    <ul class="dropdown-menu dropdown-user">
        <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
        </li>
        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
        </li>
        <li class="divider"></li>
        <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
        </li>
    </ul>
    <!-- /.dropdown-user -->
</li>
<!-- /.dropdown -->
</ul>
<!-- /.navbar-top-links -->

<div class="navbar-default sidebar" role="navigation">
    <div class="sidebar-nav navbar-collapse">
        <%@include file="nav.jsp" %>
    </div>
    <!-- /.sidebar-collapse -->
</div>

<!-- /.navbar-static-side -->
</nav>

<div id="page-wrapper">

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Menu</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">Menu List</div>
                <div class="panel-body panel-menu">
                    <div class="row">
                        <div class="col-lg-2" >
                            <div class="menu-list" style="margin-top:0px;">
                                <ul class="nav nav-pills nav-stacked" id = "menu-menu">
                                        <li class="category-header">
                                            <div class="pull-left" style="font-size: 16px;font-weight: 500;">分类</div>
                                            <div style="margin-bottom:10px;" class="btn-group pull-right">
                                                <button name="addCategory" type="button" class="btn btn-default btn-xs" data-toggle = "modal" data-target = "#confirmAddCategory"><i class="fa fa-plus"></i></button>
                                                <button name="updateCategory" type="button" class="btn btn-default btn-xs" data-toggle = "modal" data-target = "#confirmAddCategory"><i class="fa fa-edit"></i></button>
                                                <button name="delCategory" data-toggle = "modal" data-target="#confirmDelCategory" type="button" class="btn btn-default btn-xs"><i class="fa fa-trash-o"></i></button>
                                            </div>
                                        </li>
                                    <c:forEach items="${categories}" var="category">
                                        <li><a href="#menu_panel" role="tab" data-toggle="tab" data-categoryid="${category.id}" >
                                                ${category.name}
                                                <c:if test="${fn:length(category.childCategories) > 0}">
                                                    <span class="fa arrow"></span>
                                                </c:if>
                                            </a>
                                            <c:if test="${fn:length(category.childCategories) > 0}">
                                                <ul class="nav nav-second-level nav-pills nav-stacked">
                                                <c:forEach items="${category.childCategories}" var="childCategory">
                                                    <li><a href="#menu_panel" role="tab" data-parentid="${childCategory.parentId}" data-categoryid="${childCategory.id}" data-toggle="tab">${childCategory.name}</a></li>
                                                </c:forEach>
                                                </ul>
                                            </c:if>
                                        </li>
                                    </c:forEach>
                                    <%--<li>
                                        <a href="#">羊肉
                                            <span class="fa arrow"></span>
                                        </a>
                                        <ul class="nav nav-second-level">
                                            <li><a href="#menu_panel" role="tab"
                                                   data-toggle="tab">生上羊</a></li>
                                            <li><a href="#menu_panel" role="tab"
                                                   data-toggle="tab">熟羊</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="#menu_panel" role="tab" data-toggle="tab">凉菜</a></li>
                                    <li><a href="#menu_panel" role="tab" data-toggle="tab">荤菜</a></li>--%>
                                </ul>
                            </div>
                        </div>
                        <div id="menu_panel" class="col-lg-10">
                            <table id="dish_table" class="table table-striped dataTable no-footer">
                                <thead>
                                <tr role="row">
                                    <th>#</th>
                                    <th>菜名</th>
                                    <th>价格</th>
                                    <th>星级</th>
                                    <th>详细</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<div class="modal fade" id="editDishModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                </button>
                <h4 class="modal-title" id="myModalLabel">修改菜式</h4>
            </div>
            <div class="modal-body">
                <form role="form">
                    <div class="form-group" style="display: none">
                        <label>ID</label>
                        <input data-dv=0 name="id" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>菜名</label>
                        <input name="name" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>价格</label>
                        <input data-dv=0 name="price" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>星级</label>
                        <input data-dv=0 name = "stars" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>详细</label>
                        <input name="detail" class="form-control">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button name="confirmDishEdit" type="button" data-dismiss="modal"
                        class="btn btn-primary">确认
                </button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<div class="modal fade" id="confirmDelModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                </button>
                <h4 class="modal-title" id="delModalLabel">删除菜式</h4>
            </div>
            <div class="modal-body">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button name="confirmDishDel" type="button" data-dismiss="modal"
                        class="btn btn-primary">确认
                </button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<div class="modal fade" id="confirmAddCategory" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                </button>
                <h4 class="modal-title" id="addCategoryModalLabel">增加分类</h4>
            </div>
            <div class="modal-body">
                <form role="form">
                    <div class="form-group" style="display: none">
                        <label>ID</label>
                        <input data-dv=0 name="id" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>分类名</label>
                        <input name="name" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>父分类</label>
                        <select name="parentCategory" class="form-control">
                            <option value="0">无</option>
                            <c:forEach items="${categories}" var="category">
                                <option value = "${category.id}">${category.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button name="confirmAddCategory" type="button" data-dismiss="modal"
                        class="btn btn-primary">确认
                </button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<div class="modal fade" id="confirmDelCategory" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                </button>
                <h4 class="modal-title" id="delCategoryModalLabel">删除分类</h4>
            </div>
            <div class="modal-body">
                是否确认删除分类?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button name="confirmCategoryDel" type="button" data-dismiss="modal"
                        class="btn btn-primary">确认
                </button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

</div>
<!-- /#wrapper -->

<!-- jQuery Version 1.11.0 -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="<%=realPath %>/resources/js/plugins/metisMenu/metisMenu.min.js"></script>

<!-- Morris Charts JavaScript -->
<script src="<%=realPath %>/resources/js/plugins/morris/raphael.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="<%=realPath %>/resources/js/sb-admin-2.js"></script>

<script src="<%=realPath %>/resources/js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="<%=realPath %>/resources/js/plugins/dataTables/dataTables.bootstrap.js"></script>
<script src="<%=realPath%>/resources/js/plugins/noty/jquery.noty.packaged.min.js"></script>

<script>

    String.prototype.trim = function () {
        return this.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
    }

    $.noty.defaults = {
        layout: 'top',
        theme: 'defaultTheme',
        type: 'alert',
        text: '',
        dismissQueue: true, // If you want to use queue feature set this true
        template: '<div class="noty_message"><span class="noty_text"></span><div class="noty_close"></div></div>',
        animation: {
            open: {height: 'toggle'},
            close: {height: 'toggle'},
            easing: 'swing',
            speed: 500 // opening & closing animation speed
        },
        timeout: 2000, // delay for closing event. Set false for sticky notifications
        force: false, // adds notification to the beginning of queue when set to true
        modal: false,
        maxVisible: 5, // you can set max visible notification for dismissQueue true option
        closeWith: ['click'], // ['click', 'button', 'hover']
        callback: {
            onShow: function () {
            },
            afterShow: function () {
            },
            onClose: function () {
            },
            afterClose: function () {
            }
        },
        buttons: false // an array of buttons
    };

    function format(d) {
        var childContent = '<table class="simple-table" cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;"><tbody>';
        $.ajax({
            url: "<%=realPath %>/bill/getBillDetails",
            dataType: "json",
            data: {"billId": d[1]},
            async: false,
            headers: {
                Accept: "application/json; charset=utf-8"
            },
            success: function (billDetails) {
                $.each(billDetails, function (index, billDetail) {
                    childContent += "<tr>";
                    childContent += "<td>" + billDetail.dishName + "</td>";
                    childContent += "<td>" + billDetail.amount + " × " + billDetail.price + "</td>";
                    childContent += "</tr>";
                });
            }
        });
        childContent += "</tbody></table>";
        return childContent;
    }

    $(document).ready(function () {

        $("li[name=menu] a").addClass("active");

        $("#menu-menu").metisMenu();

        $(".menu-list li:nth-child(2)").addClass("active");
        var categoryId = 1;

        var dt = $("#dish_table").DataTable({
            "columns": [
                { "data": "id" },
                { "data": "name" },
                { "data": "price" },
                { "data": "stars" },
                { "data": "detail" },
                {
                   "render": function ( data, type, full, meta ) {
                    return '<button name="edit-dish" data-toggle="modal" data-target="#editDishModal" class="btn btn-sm btn-primary">修改</button>  '+
                           '<button name="del-dish" data-toggle="modal" data-target="#confirmDelModal" class="btn btn-sm btn-danger">删除</button>';
                }}
            ],
            "ajax":{
              "url":"<%=realPath %>/menu/getDishInCategoryByDtFormat",
              headers:{
                Accept : "application/json; charset=utf-8"
              },
              "data":function(d){
                  d.categoryId = categoryId;
              }
            },
            "order": [
                [0, 'asc']
            ],
            "dom": '<"toolbar">frtip'
        });

        $("div.toolbar").html('<button name="add-dish" data-toggle="modal" data-target="#editDishModal" class="btn btn-sm btn-primary">增加</button>');

        $(".menu-list li a").click(function(){
            if($(this).parent("li").children("ul").length == 0){
                categoryId = $(this).data("categoryid");
                dt.ajax.reload();
                $(this).parents("ul").find("li.active a").each(function(){
                   if($(this).data("categoryid") != categoryId)
                        $(this).parent().removeClass("active");
                });
            }
        });

        $(document).on("click",'button[name=edit-dish]', function (){
            $("#editDishModal div.modal-header h4").html("修改菜式");
            var tr = $(this).parents("tr");
            var td = $("td",tr);
            $("#editDishModal input").each(function(index,input){
                $(input).val($(td[index]).html());
            });
        });

        $('button[name=add-dish]').click(function (){
            $("#editDishModal div.modal-header h4").html("增加菜式");
            //清空
            $("#editDishModal form").find("input").val("");
        });

        $(document).on("click","button[name=del-dish]",function(){
           var dishName = $(this).parents("tr").children("td:nth-child(2)").html();
           var id = $(this).parents("tr").children("td:nth-child(1)").html();
           $("#confirmDelModal div.modal-body").data("dishid",id);
           $("#confirmDelModal div.modal-body").html("是否确认删除【"+dishName+"】?");
        });

        $("button[name=addCategory]").click(function(){
            $("#confirmAddCategory input").val("");
            $("#confirmAddCategory select").val(0);
        });

        $("button[name=updateCategory]").click(function(){
            var selCategory = $("div.menu-list ul li.active a");
            var id = $(selCategory).data("categoryid");
            var name = $(selCategory).html().trim();
            var parentId = $(selCategory).data("parentid");
            if(parentId == undefined)
                parentId = 0;
            $("#confirmAddCategory input[name=id]").val(id);
            $("#confirmAddCategory input[name=name]").val(name);
            $("#confirmAddCategory select").val(parentId);
        });

        $("button[name=confirmAddCategory]").click(function(){
            var categoryId = $("#confirmAddCategory input[name=id]").val();
            if(categoryId == "")
                categoryId = 0;
            var categoryName = $("#confirmAddCategory input[name=name]").val();
            var parentCategoryId = $("#confirmAddCategory select").val();
            $.ajax({
               url:"<%=realPath %>/menu/updateCategory",
               type:"POST",
               dataType:"json",
               headers:{
                Accept : "application/json; charset=utf-8"
               },
               data:{"param":JSON.stringify({"id":categoryId,"name":categoryName,"parentId":parentCategoryId})},
               success:function(result){
                   if(result.success)
                       location.reload();
               }
            });
        });

        $("button[name=confirmCategoryDel]").click(function(){
            var categoryId = $("div.menu-list ul li.active a").data("categoryid");
            $.ajax({
                url:"<%=realPath %>/menu/delCategory",
                dataType:"json",
                data:{"categoryId":categoryId},
                success:function(result){
                    if(result.success)
                        location.reload();
                }
            });
        });

        $("button[name=confirmDishDel]").click(function(){
            var id = $("#confirmDelModal div.modal-body").data("dishid");
            $.ajax({
               url:"<%=realPath %>/menu/delDish",
               data:{"dishId":id},
               dataType:"json",
               success:function(result){
                   if(result.success){
                       noty({"text":"删除成功!","layout":"topCenter","type":"success"});
                       dt.ajax.reload();
                   }
               }
            });
        });

        $("button[name=confirmDishEdit]").click(function(){
            var params = {};
            $("#editDishModal input").each(function(index,input){
                if($(input).val() == "")
                    $(input).val($(input).data("dv"));
                params[$(input).attr("name")] = $(input).val();
            });
            params["categoryId"] = $(".menu-list li.active a").data("categoryid");
            $.ajax({
               url:"<%=realPath %>/menu/updateDish",
               dataType:"json",
               type:"POST",
               headers:{
                    Accept : "application/json; charset=utf-8"
                },
               data: {"param":JSON.stringify(params)},
               success:function(result){
                if(result.success){
                    var curPageNo = dt.page();
                    dt.ajax.reload(function(json){
                        dt.page(curPageNo).draw(false);
                    });
                    noty({"text":"修改成功!","layout":"topCenter","type":"success"});
                }
               }
            });
        });

    });
</script>

</body>

</html>
