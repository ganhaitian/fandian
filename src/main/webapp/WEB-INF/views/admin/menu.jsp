<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        <div class="col-lg-2" >
                            <div class="sidebar" style="margin-top:0px;">
                                <ul class="nav" id = "menu-menu">
                                    <c:forEach items="${categories}" var="category">
                                        <li><a href="#menu_panel" role="tab" data-toggle="tab">${category.name}</a>
                                        
                                        </li>
                                    </c:forEach>
                                   <%-- <li>
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
                            <table id="bill_table" class="table table-striped dataTable no-footer">
                                <thead>
                                <tr role="row">
                                    <th></th>
                                    <th>#</th>
                                    <th>桌号</th>
                                    <th>微信用户</th>
                                    <th>状态</th>
                                    <th style="text-align: right;">总消费</th>
                                    <th style="text-align: center;">创建时间</th>
                                    <th style="text-align: center;">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${bills}" var="bill">
                                    <tr data-id="${bill.id}">
                                        <td style="line-height: 2;padding: 5px"></td>
                                        <td style="line-height: 2;padding: 5px"
                                            name="id">${bill.id}</td>
                                        <td style="line-height: 2;padding: 5px"
                                            name="tableNo">${bill.tableNo}</td>
                                        <td style="line-height: 2;padding: 5px"></td>
                                        <td style="line-height: 2;padding: 5px" name="status">
                                            <c:if test="${bill.status == 0}">
                                                <span class="label label-success">未结</span>
                                            </c:if>
                                            <c:if test="${bill.status == 1}">
                                                <span class="label label-danger">已结</span>
                                            </c:if>
                                        </td>
                                        <td style="line-height: 2;padding: 5px;text-align: right;">${bill.fee}¥</td>
                                        <td style="line-height: 2;padding: 5px;text-align: center;">${bill.createTime}</td>
                                        <td style="line-height: 2;padding: 5px;text-align: center;">
                                            <c:if test="${bill.status == 0}">
                                                <button name="confirmCheckout"
                                                        class="btn btn-sm btn-primary"
                                                        data-toggle="modal"
                                                        data-target="#confirmCheckModal">结账
                                                </button>
                                            </c:if>
                                            <c:if test="${bill.status == 1}">
                                                <button name="confirmCheckout"
                                                        class="btn btn-sm btn-primary disabled"
                                                        data-toggle="modal"
                                                        data-target="#confirmCheckModal">结账
                                                </button>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                </div>
            </div>
        </div>
    </div>

</div>

<div class="modal fade" id="confirmCheckModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                </button>
                <h4 class="modal-title" id="myModalLabel">确认结账</h4>
            </div>
            <div class="modal-body">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button name="finalConfirmCheck" type="button" data-dismiss="modal"
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

        var dt = $("#bill_table").DataTable({
            "columns": [
                {
                    "class": "details-control",
                    "orderable": false,
                    "defaultContent": ""
                },
                {
                },
                {
                },
                {
                },
                {
                },
                {
                },
                {
                },
                {

                }
            ],
            "order": [
                [4, 'desc']
            ]
        });

        var currentBillId = null;

        $("button[name='confirmCheckout']").each(function () {
            var oldConfirmCheckHandler = $(this).onclick;
            $(this).onclick = null;

            $(this).click(function () {
                var tableNo = $(this).parent("td").siblings("td[name='tableNo']").html();
                $("div#confirmCheckModal div.modal-body").html(tableNo + "号桌确认结账?");
                currentBillId = $(this).parents("tr").data("id");
            });

            $(this).click(oldConfirmCheckHandler);
        });

        $("button[name='finalConfirmCheck']").click(function () {

            if (!currentBillId)
                return;

            var tr = $("#bill_table tr[data-id=" + currentBillId + "]");
            $.ajax({
                url: "<%=realPath %>/bill/checkout",
                data: {"billId": currentBillId},
                dataType: "json",
                success: function (data) {
                    if (data.success) {
                        $("td[name=status]", tr).html("<span class='label label-danger'>已结</span>");
                        $("button[name=confirmCheckout]", tr).addClass("disabled");
                        noty({"text": "结账成功!", "layout": "topCenter", "type": "success"});
                    }
                }
            });
        });

        var detailRows = [];

        $('.table-list tbody').on('click', 'tr td:first-child', function () {
            var tr = $(this).closest('tr');
            var row = dt.row(tr);
            var idx = $.inArray(tr.attr('id'), detailRows);

            if (row.child.isShown()) {
                tr.removeClass('details');
                row.child.hide();

                // Remove from the 'open' array
                detailRows.splice(idx, 1);
            }
            else {
                tr.addClass('details');
                row.child(format(row.data())).show();

                // Add to the 'open' array
                if (idx === -1) {
                    detailRows.push(tr.attr('id'));
                }
            }
        });

        dt.on('draw', function () {
            $.each(detailRows, function (i, id) {
                $('#' + id + ' td:first-child').trigger('click');
            });
        });

    });
</script>

</body>

</html>