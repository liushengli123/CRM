<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>后台登录-X-admin2.0</title>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/xadmin.js"></script>

</head>
<body class="login-bg">


    <div class="login layui-anim layui-anim-up">
        <div class="message">x-admin2.0-管理登录</div>
        <div id="darkbannerwrap"></div>

        <form method="post" class="layui-form" >
            <input name="name" placeholder="用户名"  type="text" lay-verify="required" class="layui-input" >
            <hr class="hr15">
            <input name="pwd" lay-verify="required" placeholder="密码"  type="password" class="layui-input">
            <hr class="hr15">
            <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
            <hr class="hr20" >
        </form>
    </div>

    <script>
        $(function() {
            layui.use('form', function(){
              var form = layui.form;
              form.on('submit(login)', function(data){
                  $.ajax({
                        type:"post",
                        url:"${pageContext.request.contextPath}/login",
                        data:data.field,
                        dataType:"json",
                        success:function (data) {
                            layer.msg(data.msg,function () {
                                if(data.code==200){
                                    location.href='${pageContext.request.contextPath}/index'
                                }
                            });
                        }
                    })
                  return false;
                });
              });
            });
    </script>

    
    <!-- 底部结束 -->

</body>
</html>