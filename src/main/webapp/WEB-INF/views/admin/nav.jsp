<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<ul class="nav" id="side-menu">
    <li class="sidebar-search">
        <div class="input-group custom-search-form">
            <input type="text" class="form-control" placeholder="Search...">
                <span class="input-group-btn">
                    <button class="btn btn-default" type="button">
                        <i class="fa fa-search"></i>
                    </button>
                </span>
        </div>
        <!-- /input-group -->
    </li>
    <li name="cashier">
        <a class="" href="<%=realPath%>/admin/cashier"><i class="fa fa-dollar fa-fw"></i> 收银台</a>
    </li>
    <li name="menu">
        <a class="" href="<%=realPath%>/admin/menu"><i class="fa fa-book fa-fw"></i> 菜单</a>
    </li>
    <li name="user">
        <a class="" href="<%=realPath%>/admin/user"><i class="fa fa-user fa-fw"></i> 用户</a>
    </li>
</ul>
