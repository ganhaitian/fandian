/**
 * Created by gan on 14-7-29.
 */
function errorFunction(XMLHttpRequest, textStatus, errorThrown){
    if(XMLHttpRequest.status==403){
        noty({"text":"权限不足!","layout":"topCenter","type":"error"});
    }else if(XMLHttpRequest.status==500){
        noty({"text":"后台错误!","layout":"topCenter","type":"error"});
    }else if(XMLHttpRequest.status==408){
        noty({"text":"blablabla!","layout":"topCenter","type":"error"});
    }
}

var defaultDataTableOLanguage = {
    "sLengthMenu": "每页显示 _MENU_ 条记录",
    "sZeroRecords": "抱歉， 没有找到",
    "sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
    "sInfoEmpty": "没有数据",
    "sInfoFiltered": "(从 _MAX_ 条数据中检索)",
    "sZeroRecords": "没有检索到数据",
    "sSearch": "搜索: ",
    "oPaginate": {
        "sFirst": "首页",
        "sPrevious": "前一页",
        "sNext": "后一页",
        "sLast": "尾页"
    }
};
