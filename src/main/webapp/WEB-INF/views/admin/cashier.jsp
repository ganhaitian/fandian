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
    <link href="<%=realPath %>/resources/css/plugins/validator/bootstrapValidator.min.css"
          rel="stylesheet">

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

        .table > tbody > tr > td {
            padding: 5px;
            vertical-align: middle;
        }

        .table tbody tr:hover td,.table tbody tr:hover th{
            background-color: #FFFF00;
        }

        .common-td {
            line-height: 2;
            padding: 5px;
        }

        .center-td {
            line-height: 2;
            padding: 5px;
            text-align: center;
        }

        .right-td{
            text-align:right;
        }

        td .label {
            font-size: 85%;
        }

        div.toolbar{
            float:left;
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
                <h1 class="page-header">收银台</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">桌单列表</div>
                    <div class="panel-body table-list">
                        <table id="bill_table"
                               class="cell-border table table-striped dataTable no-footer">
                            <thead>
                            <tr role="row">
                                <th></th>
                                <th>#</th>
                                <th>桌号</th>
                                <th>微信用户</th>
                                <th style="text-align: center;">状态</th>
                                <th style="">总消费</th>
                                <th style="">折扣</th>
                                <th style="">实付</th>
                                <th style="text-align: center;">付费方式</th>
                                <th style="">挂账商户</th>
                                <th style="">操作员</th>
                                <th style="text-align: center;">创建时间</th>
                                <th style="text-align: center;">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%-- <c:forEach items="${bills}" var="bill">
                                 <tr data-id = "${bill.id}" >
                                     <td></td>
                                     <td name="id" >${bill.id}</td>
                                     <td name="tableNo">${bill.tableNo}</td>
                                     <td>${bill.userName}</td>
                                     <td name="status" >
                                         ${bill.status}
                                         &lt;%&ndash;<c:if test="${bill.status == 0}">
                                             <span class="label label-success">未结</span>
                                         </c:if>
                                         <c:if test="${bill.status == 1}">
                                             <span class="label label-danger">已结</span>
                                         </c:if>&ndash;%&gt;
                                     </td>
                                     <td name = "fee" style="line-height: 2;padding: 5px;" >¥ ${bill.fee}</td>
                                     <td>${bill.discount}</td>
                                     <td>¥ ${bill.actualFee}</td>
                                     <td>${bill.paymentType}</td>
                                     <td>${bill.operator}</td>
                                     <td>${bill.createTime}</td>
                                     <td>

                                     </td>
                                 </tr>
                             </c:forEach>--%>
                            </tbody>
                        </table>
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
                    <form id="confirmCheckForm" role="form">
                        <div class="form-group">
                            <p class="form-control-static confirm-msg"></p>
                        </div>
                        <div class="form-group">
                            <label>折扣金额<sup>*</sup></label>
                            <input type="text" class="form-control" name="discount">
                        </div>
                        <div class="form-group">
                            <label>付款方式</label>
                            <select class="form-control" name="payment-type">
                                <option value="0">现金</option>
                                <option value="1">刷卡</option>
                                <option value="3">微信</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <div class="alert alert-success checkout-msg" style="font-size: 17px;"
                                 role="alert"></div>
                        </div>
                    </form>

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

    <div class="modal fade" id="confirmLossesModal" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                    </button>
                    <h4 class="modal-title" id="lossesModalLabel">确认挂账</h4>
                </div>
                <div class="modal-body">
                    <form id="confirmLossesForm" role="form">
                        <div class="form-group">
                            <p class="form-control-static confirm-msg"></p>
                        </div>
                        <div class="form-group">
                            <label>挂账商户</label>
                            <select class="form-control" name="payment-type">
                            <c:forEach items = "${customers}" var="customer">
                                <option value = "${customer.id}">${customer.name}</option>
                            </c:forEach>
                            </select>
                        </div>
                    </form>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button name="finalConfirmLosses" type="button" data-dismiss="modal"
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
<script src="<%=realPath %>/resources/js/plugins/validator/bootstrapValidator.min.js"></script>
<script src="<%=realPath %>/resources/js/plugins/date/date.js"></script>

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
        data: {"billId": d.id},
        async: false,
        headers: {
            Accept: "application/json; charset=utf-8"
        },
        success: function (billDetails) {
            $.each(billDetails, function (index, billDetail) {
                childContent += "<tr>";
                childContent += "<td>" + billDetail.dishName + "</td>";
                var dishDetail = "<td>" + billDetail.amount + " × " + billDetail.price ;;
                if(billDetail.weightName){
                    dishDetail += " (" + billDetail.weightName;
                    if(billDetail.tasteName){
                        dishDetail += "," + billDetail.tasteName;
                    }
                    dishDetail += ")";
                }
                childContent += dishDetail + "</td>";
                childContent += "</tr>";
            });
        }
    });
    childContent += "</tbody></table>";
    return childContent;
}

$(document).ready(function () {

    $("li[name=cashier] a").addClass("active");

    var dt = $("#bill_table").DataTable({
        "oLanguage":defaultDataTableOLanguage,
        ajax: {
            "url": "<c:url value="/bill/getBills"></c:url>",
            headers: {
                Accept: "application/json; charset=utf-8"
            },
            async: false,
            "data":function(d){
                var areaVal = $("select[name=area]").val();
                if(!areaVal)
                    areaVal = 0;

                var tableVal = $("select[name=tables]").val();
                if(!tableVal)
                    tableVal = 0;

                d.area = areaVal;
                d.table = tableVal;
            }
        },
        "columns": [
            {
                "class": "details-control",
                "orderable": false,
                "defaultContent": ""
            },
            {
                className: "common-td",
                data: "id"
            },
            {
                className: "common-td",
                data: "tableNo"
            },
            {
                className: "common-td",
                data: "userName"
            },
            {
                className: "center-td",
                data: "status",
                "render": function (data, type, full, meta) {
                    if (data == 0) {
                        return '<span class="label label-success">未结</span>';
                    } else if (data == 1) {
                        return '<span class="label label-danger">已结</span>';
                    } else if (data = 2){
                        return '<span class="label label-warning">挂账</span>';
                    }
                }
            },
            {
                className: "right-td",
                data: "fee",
                "render": function (data, type, full, meta) {
                    return data + " ¥";
                }
            },
            {
                className: "right-td",
                data: "discount",
                "render": function (data, type, full, meta) {
                    return data + " ¥";
                }
            },
            {
                className: "right-td",
                data: "actualFee",
                "render": function (data, type, full, meta) {
                    return data + " ¥";
                }
            },
            {
                className: "center-td",
                data: "paymentType",
                "render": function (data, type, full, meta) {
                    if (data == 0) {
                        return '<span class="label label-default">现金</span>';
                    } else if (data == 1) {
                        return '<span class="label label-info">刷卡</span>';
                    } else if (data = 2){
                        return '<span class="label label-success">微信</span>';
                    }
                }
            },
            {
                className: "common-td",
                data: "lossesCustomerName"
            },
            {
                className: "common-td",
                data: "operator"
            },
            {
                className: "center-td",
                data: "createTimeStr"
            },
            {
                className: "center-td",
                data: "status",
                "render": function (data, type, full, meta) {
                    if (data == 0) {
                        return '<button name="confirmCheckout" class="btn btn-xs btn-primary" data-toggle="modal" data-target="#confirmCheckModal">结账</button>   '+
                                '<button name="confirmLosses" class="btn btn-xs btn-warning" data-toggle="modal" data-target="#confirmLossesModal">挂账</button>' ;
                    } else if (data == 1 || data == 2) {
                        return '<button name="confirmCheckout" class="btn btn-xs btn-primary disabled" data-toggle="modal" data-target="#confirmCheckModal">结账</button>   '+
                                '<button name="confirmLosses" class="btn btn-xs btn-warning disabled" data-toggle="modal" data-target="#confirmLossesModal">挂账</button>' ;
                    }
                }
            }
        ],
        "order": [
            [4, 'desc'],[11,'desc'],[2,'asc']
        ],
        "pageLength": 25,
        "dom": '<"toolbar">frtip'
    });

    $("div.toolbar").html(
        '<i class="fa fa-filter" style="border-right: 2px solid #e4e4e4">筛选</i>'+
        '区号: ' +
            '<select name = "area" class="form-control" >' +
                '<option value = "0">全部</option>' +
                '<option value = "3">3区</option>' +
                '<option value = "5">5区</option>' +
                '<option value = "6">包厢</option>' +
            '</select>   ' +
        '桌号: '+
            '<select name = "tables" class="form-control" >' +
                '<option value = "0">全部</option>' +
            '</select>'
    );

    $("select[name=area]").change(function(){
        //每次区号一变，桌号就重置下
        $("select[name=tables]").html('');
       var newAreaVal = $(this).val();
        $("select[name=tables]").append('<option value = "0">全部</option>');
       if(newAreaVal == 3 || newAreaVal == 5){
           for(var i = 1 ; i <= 23 ; i++){
               if( i % 10 == 4 || i % 10 == 7)
                continue;
               $("select[name=tables]").append("<option value = '"+i+"' >"+i+"桌</option>")
           }
       }else if(newAreaVal == 6){
           for(var i = 1 ; i <= 33 ; i++){
               if( i % 10 == 4 || i % 10 == 7)
                   continue;
               $("select[name=tables]").append("<option value = '"+i+"' >"+i+"桌</option>")
           }
       }
       $("select[name=tables]").val(0);
       dt.ajax.reload();
    });

    $("select[name=tables]").change(function(){
        dt.ajax.reload();
    });

    var currentBillId = null;

    $("button[name=confirmLosses]").each(function(){
        var rowData = dt.row($(this).closest("tr")).data();

        $(this).click(function () {
            var tableNo = rowData.tableNo;
            $("div#confirmLossesModal div.modal-body p.confirm-msg").html(tableNo + "号桌确认挂账?");
            currentBillId = rowData.id;
        });
    });


    function attackConfirmCheckoutBtnEvent(){

    }

    $(document).on('click',"button[name='confirmCheckout']",function(){
        //var fee = $(this).parent("td").siblings("td[name=fee]").html().substring(2);
        var rowData = dt.row($(this).closest("tr")).data();
        var fee = rowData.fee;

        var tableNo = rowData.tableNo;
        $("div#confirmCheckModal div.modal-body p.confirm-msg").html(tableNo + "号桌确认结账?");
        currentBillId = rowData.id;
        //折扣初始化为1.0
        var a = $("div#confirmCheckModal div.modal-body input[name=discount]").val(0);
        a.data("originfee", fee);
        $("div#confirmCheckModal div.modal-body div.checkout-msg").html("<strong>实付金额:" + fee + "元</strong>");

    });

    $("button[name='finalConfirmLosses']").click(function(){
        if (!currentBillId)
            return;
        var customerId = $("div#confirmLossesModal div.modal-body select").val();
        $.ajax({
            url: "<%=realPath %>/bill/losses",
            data: {"billId": currentBillId,"customerId":customerId},
            dataType: "json",
            success: function (data) {
                if (data.success) {
                    //$("td[name=status]",tr).html("<span class='label label-danger'>已结</span>");
                    //$("button[name=confirmCheckout]",tr).addClass("disabled");
                    dt.ajax.reload();
                    noty({"text": "挂账成功!", "layout": "topCenter", "type": "success"});
                } else {
                    noty({"text": "挂账失败，原因:" + data.errMsg, "layout": "topCenter", "type": "error"});
                }
            }, error: errorFunction
        });

    });

    $("button[name='finalConfirmCheck']").click(function () {

        //获得折扣金额
        var discountValue = $("input[name=discount]", $(this).parents("div.modal-content")).val();
        //获得付款方式
        var paymentType = $("select[name=payment-type]", $(this).parents("div.modal-content")).val();

        $.ajax({
            url: "<%=realPath %>/bill/checkout",
            data: {"billId": currentBillId, "discount": discountValue, "paymentType": paymentType},
            dataType: "json",
            success: function (data) {
                if (data.success) {
                    //$("td[name=status]",tr).html("<span class='label label-danger'>已结</span>");
                    //$("button[name=confirmCheckout]",tr).addClass("disabled");
                    dt.ajax.reload();
                    noty({"text": "结账成功!", "layout": "topCenter", "type": "success"});
                } else {
                    noty({"text": "结账失败，原因:" + data.errMsg, "layout": "topCenter", "type": "error"});
                }
            }, error: errorFunction
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

    var confirmCheckValidator = $("#confirmCheckForm").bootstrapValidator({
        message: "不合法的输入值",
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            discount: {
                validators: {
                    numeric: {
                        message: '折扣金额必须为有效数字'
                    },
                    between: {
                        inclusive: true,
                        min: 0,
                        max: getMaxDiscount,
                        message: '折扣金额必须为介于0和总消费之间'
                    },
                    notEmpty: {
                        message: '折扣值非空'
                    }
                }
            }
        }
    }).on('error.validator.bv',function (e, data) {
        // $(e.target)    --> The form instance
        // data.field     --> The field name
        // data.element   --> The field element
        // data.validator --> The validator name

        // Do something ...
        $(data.element).val("");
        var originFee = $(data.element).data("originfee");
        $("div#confirmCheckModal div.modal-body div.checkout-msg").html("<strong>实付金额:" + originFee + "元</strong>");
        $("button[name='finalConfirmCheck']").addClass("disabled");

    }).on('success.field.bv', function (e, data) {

        var currentDiscount = $(data.element).val();
        var originFee = $(data.element).data("originfee");
        var actualFee = parseFloat(originFee) - parseFloat(currentDiscount);
        $("div#confirmCheckModal div.modal-body div.checkout-msg").html("<strong>实付金额:" + actualFee + "元</strong>");
        $("button[name='finalConfirmCheck']").removeClass("disabled");
    });

    function getMaxDiscount(value, validator, $field) {
        var originFee = $field.data("originfee");
        return originFee;
    }

});


</script>

</body>

</html>
