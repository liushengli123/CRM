<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>修改</title>
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
  +
  <body>
    <div class="x-body layui-anim layui-anim-up">
        <form class="layui-form">
            <input type="hidden"  name="id" value="${teacher.id}">
          <div class="layui-form-item">
              <label for="L_email" class="layui-form-label">
                  <span class="x-red">*</span>教师名字
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="L_email" value="${teacher.teacherName}"
                         name="teacherName"
                         required=""
                         lay-verify="teacherName"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_username" class="layui-form-label">
                  <span class="x-red">*</span>教师年龄
              </label>
              <div class="layui-input-inline">
                  <input type="number" value="${teacher.teacherAge}"
                         id="L_username"
                         name="teacherAge"
                         required=""
                         lay-verify="teacherAge"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
              <label class="layui-form-label">
                  <span class="x-red">*</span>教师性别
              </label>
              <div class="layui-input-inline">
                      <select name="teacherGender"    required=""
                              id="teacherGender" lay-filter="gender">
                          <option value="${teacher.teacherGender}">${gender}</option>
                          <option value="0">女</option>
                          <option value="1">男</option>
                      </select>
              </div>
          </div>
          <div class="layui-form-item">
              <label  class="layui-form-label">
                  <span class="x-red">*</span>所教课程
              </label>
              <div class="layui-input-inline">
                      <select id="course-list" name="courseId" class="valid"
                              lay-filter="course" required=""
                              lay-verify="teacherCourse">
                          <option value="${teacher.courseId}">${courseName}</option>
                      </select>
              </div>
          </div>
          <div class="layui-form-item">
              <label class="layui-form-label">
              </label>
              <button  class="layui-btn" lay-filter="edit" lay-submit="">
                  保存
              </button>
          </div>
      </form>
    </div>
    <script>
        layui.use(['form','layer'], function(){
            $ = layui.jquery;
          var form = layui.form
          ,layer = layui.layer;
          //监听提交
          form.on('submit(edit)', function(data){
              console.log(data);
              $.ajax({
                  type:"post",
                  url:"${pageContext.request.contextPath}/teacher/edit",
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
          //监听下拉课程列表
            form.on('select(course)', function (data) {
                var courseId=data.value;
                form.render("select");
            })
            form.on('select(gender)', function (data) {
                var teacherGender=data.value;
                form.render("select");
            })
        });
        //查询所有课程
        $(function () {
            $.ajax({
                type:"get",
                url:"${pageContext.request.contextPath}/course/list/all/data",
                dataType:"json",
                success:function (data){
                    if(data.code==200){
                        $(data.data).each(function () {
                            var option=$(' <option value="'+this.id+'">'+this.courseName+'</option>');
                            $("#course-list").append(option);
                        })
                    }
                }
            });
        });
    </script>
  </body>

</html>