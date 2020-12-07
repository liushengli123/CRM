<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>添加</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="/static/css/font.css">
    <link rel="stylesheet" href="/static/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/static/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  
  <body>
    <div class="x-body layui-anim layui-anim-up">
        <form class="layui-form">
          <div class="layui-form-item">
              <label for="L_email" class="layui-form-label">
                  <span class="x-red">*</span>课程名字
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="L_email" name="courseName" required=""
                         lay-verify="courseName"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_username" class="layui-form-label">
                  <span class="x-red">*</span>课程价格
              </label>
              <div class="layui-input-inline">
                  <input type="number" value="1000" id="L_username"
                         name="coursePrice"
                         required=""
                         lay-verify="coursePrice"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_pass" class="layui-form-label">
                  <span class="x-red">*</span>课程课时
              </label>
              <div class="layui-input-inline">
                  <input type="number" value="10" id="L_pass" name="courseCount"
                         required=""
                         lay-verify="courseCount"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
              <label  class="layui-form-label">
                  <span class="x-red">*</span>课程描述
              </label>
              <div class="layui-input-inline">
                <textarea name="courseDesc" placeholder="请输入课程简介"
                          required=""
                          class="layui-textarea"></textarea>
              </div>
          </div>
          <div class="layui-form-item">
              <label class="layui-form-label">
              </label>
              <button  class="layui-btn" lay-filter="add" lay-submit="">
                  增加
              </button>
          </div>
      </form>
    </div>
    <script>
        layui.use(['form','layer'], function(){
            $ = layui.jquery;
          var form = layui.form
          ,layer = layui.layer;
        
          //自定义验证规则
          form.verify({
              courseName: function (value) {
                  if (value.length < 2 || value.length > 10) {
                      return '课程名字长度不符合规则';
                  }
              }
              ,coursePrice: function (value) {
                  var price = parseFloat(value)
                  console.log(price)
                  if(price<=0){
                      return '课程价格不正确';
                  }
              }
              ,courseCount: function (value) {
                  var count = parseFloat(value)
                  console.log(count)
                  if(count<=0){
                      return '课程课时不正确';
                  }
              }
          });
          //监听提交
          form.on('submit(add)', function(data){
              $.ajax({
                  type:"post",
                  url:"${pageContext.request.contextPath}/course/add",
                  data:data.field,
                  dataType:"json",
                  success:function (data){
                      console.log(data);
                      layer.alert(data.msg, {icon: 6},function () {
                // 获得frame索引
                        var index = parent.layer.getFrameIndex(window.name);
                //关闭当前frame
                        parent.layer.close(index);
                        parent.location.replace(parent.location.href);
                          });
                  }
              });
            return false;
          });
        });
    </script>
  </body>

</html>