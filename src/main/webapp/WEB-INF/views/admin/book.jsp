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
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">

    <link href="<%=realPath %>/resources/css/plugins/jquery.dataTables.min.css" rel="stylesheet">
    <link href="<%=realPath %>/resources/css/basic.css" rel="stylesheet">
    <link href="<%=realPath %>/resources/css/plugins/datepicker/datepicker.css" rel="stylesheet">

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

        .datepicker{
            z-index:1100;
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
            <h1 class="page-header">预定</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">预定记录
                    <button name="book" style="float:right;margin-top: -5px;" type="button" class="btn btn-primary btn-sm" data-dismiss="modal" data-target = "#confirmBook" data-toggle="modal">录入预定</button>
                </div>
                <div class="panel-body table-list">
                    <table id="bill_table" class="table table-striped dataTable no-footer">
                        <thead>
                            <tr role="row">
                                <th>#</th>
                                <th>预定客户</th>
                                <th>预定日期</th>
                                <th>桌号</th>
                                <th>手机号码</th>
                                <th>用餐人数</th>
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

<div class="modal fade" id="confirmBook" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">预定</h4>
            </div>
            <div class="modal-body">
                <form role="form" id="bookForm">
                    <div class="form-group" style="display: none">
                        <label>id</label>
                        <input name="id" class="form-control" value="">
                    </div>
                    <div class="form-group" >
                        <label>顾客姓名</label>
                        <input name="customerName" class="form-control" value="">
                    </div>
                    <div class="form-group">
                        <label>预定日期</label>
                        <input type="text" name="bookDate" class="form-control" value="">
                    </div>
                    <div class="form-group">
                        <label>区号</label>
                        <select name="area" class="form-control">
                            <option value="3">3区</option>
                            <option value="5">5区</option>
                            <option value="V">包厢</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>桌号</label>
                        <select name="tables" class="form-control">
                        </select>
                    </div>
                    <div class="form-group">
                        <label>手机号码</label>
                        <input name="phoneNum" class="form-control" value="">
                    </div>
                    <div class="form-group">
                        <label>用餐人数</label>
                        <input name="mealsNum" class="form-control" value="">
                    </div>

                    <div class="form-group" style="padding:15px;text-align:right;border-top: 1px solid #e5e5e5;">
                        <button name="confirmBookBtn" type="submit" class="btn btn-primary">确认
                        </button>
                    </div>

                </form>
            </div>

        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<div class="modal fade" id="confirmCancelBook" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                </button>
                <h4 class="modal-title" id="delCategoryModalLabel">取消预定</h4>
            </div>
            <div class="modal-body">
                是否确认取消预定?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button name="confirmCancelBook" type="button" data-dismiss="modal"
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
<script src="<%=realPath %>/resources/js/plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="<%=realPath %>/resources/js/plugins/date/date.js"></script>
<script src="<%=realPath %>/resources/js/plugins/form/jquery.form.min.js"></script>

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

    $(document).ready(function(){

        $("li[name=book] a").addClass("active");
        var userId = 0;

        var dt = $("#bill_table").DataTable({
            "oLanguage":defaultDataTableOLanguage,
            ajax:{
                "url":"<c:url value="/book/list"></c:url>",
                headers:{
                    Accept : "application/json; charset=utf-8"
                },
                async:false,
                "data":function(d){
                    var date = $("#book-date-search").val();
                    if(!date){
                        d.date = Date.today().toString("yyyy-MM-dd");
                    }else{
                        d.date = date;
                    }
                }
            },
            "columns":[
                {
                    "data":"id"
                },{
                    "data":"customerName"
                },{
                    "data":"bookDate"
                },{
                    "data":"tableNo"
                },{
                    "data":"phoneNum"
                },{
                    "data":"mealsNum",
                },{
                    "render": function ( data, type, full, meta ) {
                        return '<button name="edit-schedule" data-toggle="modal" data-target="#confirmBook" class="btn btn-sm btn-primary">修改</button>  '+
                               '<button name="cancel-schedule" data-toggle="modal" data-target="#confirmCancelBook" class="btn btn-sm btn-danger">删除</button>  ';
                    }
                }
            ],
            "order":[[0,'asc']],
            "dom": '<"toolbar">frtip'
        });

        $("div.toolbar").html(
            '日期:<input type="text" id="book-date-search" value="'+ Date.today().toString("yyyy-MM-dd") +'" >'
        );

        var currentBillId = null;

        $("button[name=book]").click(function(){
            $("#confirmBook div.modal-header h4").html("录入预定");
            //清空
            $("#confirmBook form").find("input,select").val("");
            $("#confirmBook input[name=bookDate]").val(Date.today().toString("yyyy-MM-dd"));
            $("#confirmBook input[name=mealsNum]").val(0);
            $("#confirmBook input[name=id]").val(0);
        });

        $(document).on("click",'button[name=edit-schedule]', function (){
            $("#confirmBook div.modal-header h4").html("修改预定");
            var tr = $(this).closest("tr");
            var row = dt.row(tr);
            var data = row.data();
            $("#confirmBook input,#confirmBook select").each(function(index,input){
                $(input).val(data[$(input).attr("name")]);
            });

            var tableNo = data.tableNo;
            var tables = tableNo % 100;

            $("#confirmBook select[name=area]").val((tableNo - tables)/100).trigger("change",{needValidate:0});
            $("#confirmBook select[name=tables]").val(parseInt(tables));

        });

        $(document).on("click",'button[name=cancel-schedule]', function (){
            var tr = $(this).closest("tr");
            var row = dt.row(tr);
            var rowData = row.data();
            $("#confirmBook div.modal-body").data("id",rowData.id);
        });

        $("button[name=confirmCancelBook]").click(function(){
            var scheduleId = $("#confirmBook div.modal-body").data("id");
            $.ajax({
                url:"<%=realPath %>/book/cancelSchedule",
                dataType:"json",
                headers:{
                    Accept : "application/json; charset=utf-8"
                },
                data:{"scheduleId":scheduleId},
                success:function(result){
                    if(result.success){
                        dt.ajax.reload();
                        noty({"text":"删除成功!","layout":"topCenter","type":"success"});
                    }
                }
            });
        });

        var detailRows = [];

        $("input[name=bookDate]").datepicker({
            format:"yyyy-mm-dd"
        });

        $("input#book-date-search").datepicker({
            format:"yyyy-mm-dd"
        }).on('changeDate', function(ev){
            dt.ajax.reload();
        });

        $(document).on('input',"#book-date-search",function(){
            dt.ajax.reload();
        });

        $("select[name=area]").change(function(e,param){

            var newAreaVal = $(this).val();
            var bookDate = $("#bookForm").find("input[name=bookDate]").val();

            var scheduledTable = [];
            for(var i = 0;i < 50;i++)
                scheduledTable.push(0);

            if(!param || param.needValidate == 1)
                $.ajax({
                    url:"<%=realPath %>/book/getScheduledTableList",
                    dataType:"json",
                    async:false,
                    data:{"date":bookDate,"area":newAreaVal},
                    success:function(data){
                        $.each(data,function(index,table){
                            var tableNo = table.tableNo;
                            scheduledTable[tableNo % 100]  = 1;
                        });
                    }
                });

            //每次区号一变，桌号就重置下
            $("select[name=tables]").html('');
            if(newAreaVal == 3 || newAreaVal == 5){
                for(var i = 1 ; i <= 23 ; i++){
                    if( i % 10 == 4 || i % 10 == 7 || scheduledTable[i] == 1)
                        continue;
                    $("select[name=tables]").append("<option value = '"+i+"' >"+i+"桌</option>")
                }
            }else if(newAreaVal == "V" ){
                for(var i = 1 ; i <= 33 ; i++){
                    if( i % 10 == 4 || i % 10 == 7 || scheduledTable[i] == 1)
                        continue;
                    $("select[name=tables]").append("<option value = '"+i+"' >"+i+"桌</option>")
                }
            }
            $("select[name=tables]").val(1);
        });

        $("#bookForm").bootstrapValidator({
            excluded:[':disabled'],
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                customerName:{
                    validators: {
                        notEmpty: {
                            message: '顾客姓名非空'
                        }
                    }
                },
                bookDate:{
                    validators: {
                        notEmpty: {
                            message: '预定日期非空'
                        }
                    }
                },
                area:{
                    validators: {
                        notEmpty: {
                            message: '区号非空'
                        }
                    }
                },
                tables:{
                    validators: {
                        notEmpty: {
                            message: '桌号非空'
                        }
                    }
                },
                phoneNum:{
                    validators: {
                        notEmpty: {
                            message: '手机号码非空'
                        },
                        numeric: {
                            message: '手机号码必须为数字'
                        }
                    }
                }
            }
        }).on('success.form.bv', function(e) {
            // Prevent form submission
            e.preventDefault();

            // Get the form instance
            var $form = $(e.target);

            // Get the BootstrapValidator instance
            var bv = $form.data('bootstrapValidator');

            $form.ajaxSubmit({
                url:"<%=realPath %>/book/updateSchedule",
                dataType:"json",
                type:"POST",
                async:false,
                headers:{
                    Accept : "application/json; charset=utf-8"
                },
                success:function(result){
                    if(result.success){
                        dt.ajax.reload();
                    }
                }
            });

            //关闭窗口
            $("#confirmBook button.close").trigger('click');

        });

    });
</script>

</body>

</html>
