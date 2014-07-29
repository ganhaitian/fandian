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
