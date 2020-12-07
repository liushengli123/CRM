<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>添加计划内容</title>
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
    <div class="x-body">
        <form class="layui-form">
          <div class="layui-form-item">
              <label for="planName" class="layui-form-label">
                  <span class="x-red">*</span>计划名字
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="planName" name="planName" required=""
                         lay-verify="planName"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
              <label class="layui-form-label">
                  <span class="x-red">*</span>计划课程
              </label>
              <div class="layui-input-inline">
                  <select id="course-list" name="courseId" class="valid"
                          lay-filter="course" required=""
                          lay-verify="planCourse">
                    <option value="0">地理</option>
                  </select>
              </div>
          </div>
          <div class="layui-form-item">
              <label class="layui-form-label">
                  <span class="x-red">*</span>计划教师
              </label>
              <div class="layui-input-inline">
                  <select name="teacherId" id="teacher-list" lay-verify="planTeacher">
                    <option value="0">没有教师数据</option>
                  </select>
              </div>
          </div>
            <div class="layui-form-item">
                <label class="layui-form-label">
                    <span class="x-red">*</span>计划教室
                </label>
                <div class="layui-input-inline">
                    <select name="classRoomId"    required=""
                            id="class-room"  lay-filter="classroom"
                            lay-verify="planClassRoom">
                        <option value="0">无可用教室</option>
                    </select>
                </div>
                <div class="layui-form-mid layui-word-aux" >
                        <span>可容纳人数:<span id="volume-list">10</span></span>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">
                    <span class="x-red">*</span>截止日期
                </label>
                <div class="layui-input-inline">
                    <input id="planEndTime" name="planEndTime"
                           class="layui-input"    required=""
                           placeholder="截止日期"  lay-verify="planEndTime">
                </div>
            </div>
          <div class="layui-form-item">
              <label class="layui-form-label">
                  <span class="x-red">*</span>计划人数
              </label>
              <div class="layui-input-inline">
                  <input type="number" id="planStuCount" name="planStuCount"
                         class="layui-input"    required=""
                         lay-verify="planStuCount" value="10">
              </div>
          </div>
          <div class="layui-form-item layui-form-text">
              <label class="layui-form-label">
                  计划详情
              </label>
              <div class="layui-input-block">
                  <textarea placeholder="请输入计划详情" id="planDatail"
                            name="planDatail"    required=""
                            class="layui-textarea" lay-verify="planDatail"
                           ></textarea>
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
        layui.use(['form','layer','laydate'], function(){
            $ = layui.jquery;
          var form = layui.form
          ,layer = layui.layer;
            var laydate = layui.laydate;

            //执行一个laydate实例
            laydate.render({
                elem: '#planEndTime' //指定元素
            });

            //自定义验证规则
          form.verify({
            planName: function(value){
              if(value.length < 2||value.length>10){
                return '计划名字在3~10字符';
              }
            }
              ,planClassRoom: function(value){
                  if(value == 0){
                      return '没有计划教室';
                  }
              }
              ,planEndTime: function(value){
                  if(value.length==0){
                      return '请输入时间';
                  }
              }
              ,planTeacher: function(value){
                  if(value == 0){
                      return '没有教师';
                  }
              }
              ,planStuCount: function(value){
                  var volume=$("#volume-list").text();
                  volume=parseInt(volume);
                  value=parseInt(value);
                  if(value>volume){
                      return '超过了该教室容量';
                  }
                  if(value<=0){
                      return '计划的数量不正确';
                  }
              }
              ,planDatail: function(value){
                  if(value.length == 0){
                      return '请输入计划详情';
                  }
              }
          });

            form.on('submit(add)', function(data){
                var param=data.field;
                param.planEndTime=param.planEndTime+" 00:00:00";
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/market/add",
                    data:param,
                    dataType:"json",
                    success:function (data){
                            layer.alert(data.msg, {icon: 6}, function () {
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

          form.on('select(course)', function (data) {
                var courseId=data.value;
                getCourseId(courseId);
                form.render("select");
          })
            form.on('select(classroom)', function (data) {
               var classRoomId=data.value;
               $("#class-room>option").each(function () {
                    var value=$(this).attr('value');
                    var  volume=$(this).attr('volume');
                    if(classRoomId==value){
                        $("#volume-list").text(volume);
                    }
               })
            })
          
        });

        function getCourseId(courseId) {
            $.ajax({
                type:"get",
                url:"${pageContext.request.contextPath}/teacher/list/course/"+courseId,
                async:false,//同步请求
                dataType:"json",
                success:function (data){
                    if(data.code==200){
                        $("#teacher-list").empty();
                        if(data.data.length==0){
                            $("#teacher-list").append('<option value="0">没有教师数据</option>');
                        }else {
                            $(data.data).each(function () {
                                var
                                    option = $(' <option value="' + this.id + '">' + this.teacherName + '</option>');
                                $("#teacher-list").append(option);
                            })
                        }
                    }
                }
            });
        }
        $(function () {
            $.ajax({
                type:"get",
                url:"${pageContext.request.contextPath}/course/list/all/data",
                async:false,//同步请求
                dataType:"json",
                success:function (data){
                      if(data.code==200){
                          $("#course-list").empty();
                          $(data.data).each(function () {
                              var option=$(' <option value="'+this.id+'">'+this.courseName+'</option>');
                              $("#course-list").append(option);
                          })
                      }
                }
            });
            var courseId=$("#course-list").val();
            getCourseId(courseId);
            $.ajax({
                type:"get",
                url:"${pageContext.request.contextPath}/class/room/list/all/data",
                dataType:"json",
                success:function (data){
                    if(data.code==200){
                        $("#class-room").empty();
                        if(data.data.length==0){
                            $("#class-room").append('<option value=\"0\">无可用教室</option>');
                        }else {
                            $(data.data).each(function () {
                                var
                                    option = $(' <option value="' + this.id +
                                        '" volume="'+this.volume+'">' +
                                        this.num +
                                        '</option>');
                                $("#class-room").append(option);
                            })
                        }
                    }
                }
            });
        })
    </script>

  </body>

</html>