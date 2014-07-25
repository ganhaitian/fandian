<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<%
  String realPath= application.getContextPath();
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
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">

    <link href="<%=realPath %>/resources/css/plugins/jquery.dataTables.min.css" rel="stylesheet">

    <style type="text/css">

        td {
           line-height: 2;
           padding:5px;
        }

        table.simple-table td{
            border-top: 1px solid #ddd;
        }

        table.simple-table tbody tr:first-child td{
            border-top: none;
        }

        td.details-control {
            background: url('<%=realPath %>/resources/img/details_open.png') no-repeat center center;
            cursor: pointer;
        }

        tr.details td.details-control {
            background: url('<%=realPath %>/resources/img/details_close.png') no-repeat center center;
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
            <h1 class="page-header">用户</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">用户列表
                    <button name="add-user" style="float:right;margin-top: -5px;" type="button" class="btn btn-primary btn-sm" data-dismiss="modal" data-target = "#confirmUpdateUser" data-toggle="modal">增加</button>
                </div>
                <div class="panel-body table-list">
                    <table id="bill_table" class="table table-striped dataTable no-footer">
                        <thead>
                            <tr role="row">
                                <th></th>
                                <th>#</th>
                                <th>User Code</th>
                                <th>用户名</th>
                                <th>OPEN-ID</th>
                                <th>角色权限</th>
                                <th>状态</th>
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

<div class="modal fade" id="confirmUpdateUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">增加用户</h4>
            </div>
            <div class="modal-body">
                <form role="form">
                    <div class="form-group" >
                        <label>User Code</label>
                        <input name="username" class="form-control" value="">
                    </div>
                    <div class="form-group">
                        <label>用户名</label>
                        <input name="usernamecn" class="form-control" value="">
                    </div>
                    <div class="form-group">
                        <label>OPEN-ID</label>
                        <input name="openId" class="form-control" value="">
                    </div>
                    <div class="form-group">
                        <label>角色权限</label>
                        <select name="authority" class="form-control">
                            <option value="ROLE_USER">普通用户</option>
                            <option value="ROLE_MANAGER">经理</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>状态</label>
                        <select name="enabled" class="form-control">
                            <option value="1">有效</option>
                            <option value="0">无效</option>
                        </select>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button name="confirmUpdateUser" type="button" data-dismiss="modal" class="btn btn-primary">确认</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<div class="modal fade" id="confirmDelUser" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                </button>
                <h4 class="modal-title" id="delCategoryModalLabel">删除用户</h4>
            </div>
            <div class="modal-body">
                是否确认删除用户?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button name="confirmDelUser" type="button" data-dismiss="modal"
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
            onShow: function() {},
            afterShow: function() {},
            onClose: function() {},
            afterClose: function() {}
        },
        buttons: false // an array of buttons
    };

    var authorityMap = {
        "ROLE_USER":"普通用户",
        "ROLE_MANAGER":"经理"
    };

    function format ( d ) {
        var childContent = '<table class="simple-table" cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;"><tbody>';
        $.ajax({
            url:"<%=realPath %>/bill/getBillDetails",
            dataType:"json",
            data:{"billId": d[1]},
            async:false,
            headers:{
                Accept : "application/json; charset=utf-8"
            },
            success:function(billDetails){
                $.each(billDetails,function(index,billDetail){
                    childContent += "<tr>";
                    childContent += "<td>"+billDetail.dishName+"</td>";
                    childContent += "<td>"+billDetail.amount+" × "+billDetail.price+"</td>";
                    childContent += "</tr>";
                });
            }
        });
        childContent += "</tbody></table>";
        return childContent;
    }

    $(document).ready(function(){

        $("li[name=user] a").addClass("active");
        var userId = 0;

        var dt = $("#bill_table").DataTable({
            ajax:{
                "url":"<c:url value="/user/listInternal"></c:url>",
                headers:{
                    Accept : "application/json; charset=utf-8"
                }
            },
            "columns":[
                {
                    "class":          "details-control",
                    "orderable":      false,
                    "defaultContent": ""
                },{
                    "data":"id",
                    "render":function(){
                        return ++userId;
                    }
                },{
                    "data":"username"
                },{
                    "data":"usernamecn"
                },{
                    "data":"openId"
                },{
                    "data":"authority",
                    "render": function ( data, type, full, meta ) {
                        return authorityMap[data];
                    }
                },{
                    "data":"enabled",
                    "render": function(data){
                        return data == 1?"有效":"失效";
                    }
                },{
                    "render": function ( data, type, full, meta ) {
                        return '<button name="edit-user" data-toggle="modal" data-target="#confirmUpdateUser" class="btn btn-sm btn-primary">修改</button>  '+
                               '<button name="del-user" data-toggle="modal" data-target="#confirmDelUser" class="btn btn-sm btn-danger">删除</button>  ';
                    }
                }
            ],
            "order":[[1,'asc']]
        });

        var currentBillId = null;

        $("button[name=add-user]").click(function(){
            $("#confirmUpdateUser div.modal-header h4").html("增加用户");
            //清空
            $("#confirmUpdateUser form").find("input").val("");
        });

        $(document).on("click",'button[name=edit-user]', function (){
            $("#confirmUpdateUser div.modal-header h4").html("修改用户");
            var tr = $(this).closest("tr");
            var row = dt.row(tr);
            var data = row.data();
            $("#confirmUpdateUser input,#confirmUpdateUser select").each(function(index,input){
                $(input).val(data[$(input).attr("name")]);
            });
        });

        $(document).on("click",'button[name=del-user]', function (){
            var tr = $(this).closest("tr");
            var row = dt.row(tr);
            var rowData = row.data();
            $("#confirmUpdateUser div.modal-body").data("username",rowData.username);
        });

        $("button[name=confirmDelUser]").click(function(){
            var username = $("#confirmUpdateUser div.modal-body").data("username");
            $.ajax({
                url:"<%=realPath %>/user/delUser",
                dataType:"json",
                headers:{
                    Accept : "application/json; charset=utf-8"
                },
                data:{"username":username},
                success:function(result){
                    if(result.success){
                        dt.ajax.reload();
                        noty({"text":"删除成功!","layout":"topCenter","type":"success"});
                    }
                }
            });
        });

        $("button[name=confirmUpdateUser]").click(function(){
            var params = {};
            $("#confirmUpdateUser input,#confirmUpdateUser select").each(function(index,input){
                params[$(input).attr("name")] = $(input).val();
            });
            $.ajax({
                url:"<%=realPath %>/user/updateUser",
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

        $("button[name='confirmCheckout']").each(function(){
            var oldConfirmCheckHandler = $(this).onclick;
            $(this).onclick = null;

            $(this).click(function(){
                var tableNo = $(this).parent("td").siblings("td[name='tableNo']").html();
                $("div#confirmCheckModal div.modal-body").html(tableNo+"号桌确认结账?");
                currentBillId = $(this).parents("tr").data("id");
            });

            $(this).click(oldConfirmCheckHandler);
        });

        $("button[name='finalConfirmCheck']").click(function(){

            if(!currentBillId)
                return;

            var tr = $("#bill_table tr[data-id="+currentBillId+"]");
            $.ajax({
               url:"<%=realPath %>/bill/checkout",
               data:{"billId":currentBillId},
               dataType:"json",
               success:function(data){
                  if(data.success){
                    $("td[name=status]",tr).html("<span class='label label-danger'>已结</span>");
                    $("button[name=confirmCheckout]",tr).addClass("disabled");
                    noty({"text":"结账成功!","layout":"topCenter","type":"success"});
                  }
               }
            });
        });

        var detailRows = [];

        $('.table-list tbody').on( 'click', 'tr td:first-child', function () {
            var tr = $(this).closest('tr');
            var row = dt.row( tr );
            var idx = $.inArray( tr.attr('id'), detailRows );

            if ( row.child.isShown() ) {
                tr.removeClass( 'details' );
                row.child.hide();

                // Remove from the 'open' array
                detailRows.splice( idx, 1 );
            }
            else {
                tr.addClass( 'details' );
                row.child( format( row.data() ) ).show();

                // Add to the 'open' array
                if ( idx === -1 ) {
                    detailRows.push( tr.attr('id') );
                }
            }
        } );

        dt.on( 'draw', function () {
            $.each( detailRows, function ( i, id ) {
                $('#'+id+' td:first-child').trigger( 'click' );
            } );
        } );

    });
</script>

</body>

</html>
