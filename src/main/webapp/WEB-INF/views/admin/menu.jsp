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

    <title>石山乳羊第一家 OP</title>

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
    <link href="<%=realPath %>/resources/css/basic.css" rel="stylesheet">

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

        td.right-td{
            text-align: right;
        }

        .ol_loading_mask {
            background-color: #FFFFFF;
            display: none;
            height: 100%;
            left: 0;
            opacity: 0.6;
            position: absolute;
            top: 0;
            width: 100%;
        }

        .ol_loading {
            background: url("<%=realPath %>/resources/img/loading1.gif") no-repeat scroll center center rgba(0, 0, 0, 0);
            display: none;
            height: 31px;
            left: 0;
            position: absolute;
            top: 40%;
            width: 100%;
        }

        .text-warning {
            color: #8a6d3b;
        }

        img.pic-path{
           border:1px solid;
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
<%@include file="header.jsp" %>

<div id="page-wrapper">

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">菜单</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">菜单列表</div>
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
                                    <th style="text-align: center;">圖片</th>
                                    <th>菜名</th>
                                    <th style="text-align: right">价格</th>
                                    <th style="text-align: center">星级</th>
                                    <th style="text-align: left">销售量</th>
                                    <th>详细</th>
                                    <th>单位</th>
                                    <th style="text-align:center;">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                            <div style="z-index: 800; display: none;" class="ol_loading_mask null_mask "></div>
                            <div style="z-index: 801; display: none;" class="ol_loading "></div>
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
                <form role="form" id="editDishForm">
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
                        <select class="form-control" name = "stars" data-dv=0 >
                            <option value="0">没星</option>
                            <option value="1">1星</option>
                            <option value="2">2星</option>
                            <option value="3">3星</option>
                            <option value="4">4星</option>
                            <option value="5">满星</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>详细</label>
                        <input name="detail" class="form-control" data-dv="">
                    </div>
                    <div class="form-group">
                        <label>单位</label>
                        <select name="unitId" data-dv="1">
                            <c:forEach items="${units}" var="unit">
                                <option value = "${unit.id}">${unit.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>图片</label>
                        <input name="pic" type="file">
                    </div>
                   <div class="form-group" style="padding:15px;text-align:right;border-top: 1px solid #e5e5e5;">
                        <button name="confirmDishEdit" type="submit" class="btn btn-primary">确认
                        </button>
                    </div>
                </form>
            </div>
            <%--<div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button name="confirmDishEdit" type="submit" class="btn btn-primary">确认
                </button>
            </div>--%>
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
<script src="<%=realPath %>/resources/js/fandian.js"></script>
<script src="<%=realPath %>/resources/js/plugins/validator/bootstrapValidator.js"></script>
<script src="<%=realPath %>/resources/js/plugins/form/jquery.form.min.js"></script>

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

        //$(".menu-list li:nth-child(2)").addClass("active");
        var categoryId = 0;

        var dt = $("#dish_table").DataTable({
            "oLanguage":defaultDataTableOLanguage,
            "columns": [
                {
                    "data": "id",
                    "width": 25
                },
                {
                    "data": "picPath",
                    "name": "pic-path",
                    "className": "center-td",
                    "render" :function(data, type, row){
                        if(row.picPath)
                            return "<img class='pic-path' name = 'pic-path' src = '<%=realPath %>/resources/img/icon/dish/"+row.picPath+"' height = 48 width = 80 />";
                        else
                            return "";
                    }
                    //"visible": false
                },
                {
                    "data": "name"
                },
                { "data": "price",
                  "className":"right-td",
                  "render":function(data){
                      return data + " ¥";
                  }
                },
                { "data": "stars",
                  className:"center-td",
                  "render":function(data){
                      var starHtml = "<p class='text-warning'>";
                      for(var i = 0;i < data;i++){
                          starHtml += "<i class='fa fa-star'></i>";
                      }
                      for(var i = data ; i < 5;i++){
                          starHtml += "<i class='fa fa-star-o'></i>";
                      }
                      starHtml += "</p>";
                      return starHtml;
                  }
                },
                { "data": "sales",
                  "className":"left-td"
                },
                { "data": "detail"
                },
                {
                    "data": "unitName"
                },
                {
                   className:"center-td",
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
                [4, 'desc'],[0, 'asc']
            ],
            "dom": '<"toolbar">frtip',
            "pageLength": 10
        });

        $(document).on('mouseover','#dish_table tr td:nth-child(2)',function(){
            var tr = $(this).closest("tr");
            $("td img[name='pic-path']",tr).css("width",200).css("height",122);
        });

        $(document).on('mouseout','#dish_table tr td:nth-child(2)',function(){
            var tr = $(this).closest("tr");
            $("td img[name='pic-path']",tr).css("width",80).css("height",48);
        });

        $("div.toolbar").html('<button name="add-dish" data-toggle="modal" data-target="#editDishModal" class="btn btn-sm btn-primary">增加</button>');

        $(".menu-list li a").click(function(){
            if($(this).parent("li").children("ul").length == 0){
                $('#menu_panel div[class^="ol_loading"]').css('display','block');
                categoryId = $(this).data("categoryid");
                dt.ajax.reload(function(json){
                    $('#menu_panel div[class^="ol_loading"]').css('display','none');
                });
                $(this).parents("ul").find("li.active a").each(function(){
                   if($(this).data("categoryid") != categoryId)
                        $(this).parent().removeClass("active");
                });
            }
        });

        $(document).on("click",'button[name=edit-dish]', function (){
            picEdited = 0;
            $("#editDishModal div.modal-header h4").html("修改菜式");
            var tr = $(this).closest("tr");
            var rowData = dt.row(tr).data();
            //var td = $("td",tr);
            $("#editDishModal input,#editDishModal select").each(function(index,input){
                $(input).val(rowData[$(input).attr('name')]);
            });

            var validator = $("#editDishForm").data('bootstrapValidator');
            validator.resetForm();
        });

        $('button[name=add-dish]').click(function (){
            picEdited = 0;
            $("#editDishModal div.modal-header h4").html("增加菜式");

            var validator = $("#editDishForm").data('bootstrapValidator');
            validator.resetForm(true);

            $("#editDishModal input,#editDishModal select").each(function(index,input){
                $(input).val($(input).data("dv"));
            });

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

        /*$("button[name=confirmDishEdit]").click(function(){


        });*/

        var picEdited = 0;

        $(document).on("change","#editDishForm input[name=pic]",function(){
            picEdited = 1;
        });

        var editDishFormValidator = $("#editDishForm").bootstrapValidator({
            //submitButtons:'button[name="confirmDishEdit"]',
            excluded:[':disabled'],
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                name: {
                    validators: {
                        notEmpty: {
                            message: '菜名非空'
                        }
                    }
                },
                price:{
                    validators:{
                        notEmpty: {
                            message: '价格非空'
                        },
                        numeric: {
                            message: '价格金额必须为有效数字'
                        },
                        greaterThan:{
                            value:0,
                            inclusive:false,
                            message:"价格必须为正数"
                        }
                    }
                }
            }
        }).on('error.field.bv',function (e, data) {
            $(data.element).val("");
            //$("button[name='confirmDishEdit']").addClass("disabled");

        }).on('success.validator.bv', function (e, data) {
            //$("button[name='confirmDishEdit']").removeClass("disabled");
        }).on('success.form.bv', function(e) {
            // Prevent form submission
            e.preventDefault();

            // Get the form instance
            var $form = $(e.target);

            // Get the BootstrapValidator instance
            var bv = $form.data('bootstrapValidator');

           /* var params = {};
            $("#editDishModal input,#editDishModal select").each(function(index,input){
                if($(input).val() == "")
                    $(input).val($(input).data("dv"));
                params[$(input).attr("name")] = $(input).val();
            });
            params["categoryId"] = $(".menu-list li.active a").data("categoryid");*/
            var categoryId = $(".menu-list li.active a").data("categoryid");
            $("#editDishForm").ajaxSubmit({
                url:"<%=realPath %>/menu/updateDish",
                dataType:"json",
                type:"POST",
                async:false,
                headers:{
                    Accept : "application/json; charset=utf-8"
                },
                data: {"categoryId":categoryId,"picEdited":picEdited},
                beforeSerialize:function($form,options){
                    var picInput = $form.find("input[name=pic]")
                    if(picEdited == 0)
                        picInput.prop("disabled",true);
                },
                success:function(result){
                    if(result.success){
                        var curPageNo = dt.page();
                        $('#menu_panel div[class^="ol_loading"]').css('display','block');
                        dt.ajax.reload(function(json){
                            dt.page(curPageNo).draw(false);
                            $('#menu_panel div[class^="ol_loading"]').css('display','none');
                        });
                        noty({"text":"修改成功!","layout":"topCenter","type":"success"});
                    }
                },error:errorFunction
            });

            //先禁掉，再开启
            $form.find("input[name=pic]").prop("disabled",false);

            //关闭窗口
            $("#editDishModal button.close").trigger('click');

        });

    });

    function errorFunction(XMLHttpRequest, textStatus, errorThrown){
        if(XMLHttpRequest.status==403){
            noty({"text":"权限不足!","layout":"topCenter","type":"error"});
        }else if(XMLHttpRequest.status==500){
            noty({"text":"后台错误!","layout":"topCenter","type":"error"});
        }else if(XMLHttpRequest.status==408){
            noty({"text":"blablabla!","layout":"topCenter","type":"error"});
        }
    }

</script>

</body>

</html>
