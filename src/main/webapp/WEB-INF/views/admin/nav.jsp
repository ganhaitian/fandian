<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<ul class="nav" id="side-menu">
    <li class="sidebar-search">
        <div class="input-group custom-search-form">
            <input type="text" class="form-control" placeholder="搜索 ....">
                <span class="input-group-btn">
                    <button class="btn btn-default" type="button">
                        <i class="fa fa-search"></i>
                    </button>
                </span>
        </div>
        <!-- /input-group -->
    </li>
    <li name="cashier">
        <a class="" href="<%=realPath%>/admin/cashier"><i class="fa fa-dollar fa-fw"></i> 收银</a>
    </li>
    <li name="bcustomer">
        <a class="" href="<%=realPath%>/admin/bcustomer"><i class="fa fa-male fa-fw"></i> 大客户</a>
    </li>
    <li name="menu">
        <a class="" href="<%=realPath%>/admin/menu"><i class="fa fa-book fa-fw"></i> 菜单</a>
    </li>
    <li name="user">
        <a class="" href="<%=realPath%>/admin/user"><i class="fa fa-user fa-fw"></i> 用户</a>
    </li>
</ul>
