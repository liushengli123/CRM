<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>CRM后台管理系统</title>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="/static/css/font.css">
	<link rel="stylesheet" href="/static/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/static/js/xadmin.js"></script>

</head>
<body>
    <!-- 顶部开始 -->
    <div class="container">
        <div class="logo"><a href="./index.jsp">CRM后台管理系统</a></div>
        <div class="left_open">
            <i title="展开左侧栏" class="iconfont">&#xe699;</i>
        </div>
        <ul class="layui-nav right" lay-filter="">
          <li class="layui-nav-item">
            <a href="javascript:;">${admin}</a>
            <dl class="layui-nav-child"> <!-- 二级菜单 -->
              <dd><a onclick="x_admin_show('个人信息','http://www.baidu.com')">个人信息</a></dd>
              <dd><a
                      onclick="x_admin_show('切换帐号','http://localhost:8080/login')">切换帐号</a></dd>
              <dd><a href="javascript:loginout()">退出</a></dd>
            </dl>
          </li>
        </ul>
    </div>
    <!-- 顶部结束 -->
    <!-- 中部开始 -->
     <!-- 左侧菜单开始 -->
    <div class="left-nav">
      <div id="side-nav">
        <ul id="nav">
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe723;</i>
                    <cite>课程管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a
                                _href="${pageContext.request.contextPath}/course/list">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>课程列表</cite>
                        </a>
                    </li >
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6b8;</i>
                    <cite>教师管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a
                                _href="${pageContext.request.contextPath}/teacher/list/all">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>教师列表</cite>
                        </a>
                    </li >
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe723;</i>
                    <cite>市场管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a
                                _href="${pageContext.request.contextPath}/market/list/page">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>市场计划</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="cate.html">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>市场活动 </cite>
                        </a>
                    </li >
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe723;</i>
                    <cite>城市联动</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="city.html">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>三级地区联动</cite>
                        </a>
                    </li >
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe726;</i>
                    <cite>管理员管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="${pageContext.request.contextPath}/list">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>管理员列表</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="admin-role.html">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>角色管理</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="admin-cate.html">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>权限分类</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="admin-rule.html">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>权限管理</cite>
                        </a>
                    </li >
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6ce;</i>
                    <cite>系统统计</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="echarts1.html">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>拆线图</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="echarts2.html">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>柱状图</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="echarts3.html">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>地图</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="echarts4.html">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>饼图</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="echarts5.html">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>雷达图</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="echarts6.html">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>k线图</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="echarts7.html">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>热力图</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="echarts8.html">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>仪表图</cite>
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6b4;</i>
                    <cite>图标字体</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="unicode.html">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>图标对应字体</cite>
                        </a>
                    </li>
                </ul>
            </li>
        </ul>
      </div>
    </div>
    <!-- <div class="x-slide_left"></div> -->
    <!-- 左侧菜单结束 -->
    <!-- 右侧主体开始 -->
    <div class="page-content">
        <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
          <ul class="layui-tab-title">
            <li class="home"><i class="layui-icon">&#xe68e;</i>我的桌面</li>
          </ul>
          <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <iframe src='${pageContext.request.contextPath}/welcome'
                        frameborder="0"
                        scrolling="yes"
                        class="x-iframe"></iframe>
            </div>
          </div>
        </div>
    </div>
    <div class="page-content-bg"></div>
    <!-- 右侧主体结束 -->
    <!-- 中部结束 -->
    <!-- 底部开始 -->
    <div class="footer">
        <div class="copyright">Copyright ©2017 x-admin 2.3 All Rights Reserved  更多模板：<a href="http://www.mycodes.net/" target="_blank">源码之家</a></div>  
    </div>
    <!-- 底部结束 -->

</body>
<script>
    function loginout() {
        layer.confirm("确定退出吗",function (index) {
            $.ajax({
                type:"get",
                url:"${pageContext.request.contextPath}/loginout",
                dataType:"json",
                success:function (data) {
                        if(data.code==200){
                            location.href='${pageContext.request.contextPath}/login'
                        }
                }
            })
        });
    }
</script>
</html>