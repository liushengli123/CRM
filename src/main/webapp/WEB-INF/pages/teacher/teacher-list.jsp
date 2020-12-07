<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>教师信息</title>
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
  
  <body class="layui-anim layui-anim-up">
    <div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">演示</a>
        <a>
          <cite>导航元素</cite></a>
      </span>
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
    </div>
    <div class="x-body">
      <div class="layui-row">
        <div class="layui-form layui-col-md12 x-so">
          <%--<input class="layui-input" placeholder="开始日" name="start" id="start">--%>
          <%--<input class="layui-input" placeholder="截止日" name="end" id="end">--%>
          <input type="text" name="keywords"  placeholder="请输入关键字"
                 autocomplete="off" class="layui-input">
          <button id="search" class="layui-btn"  lay-submit=""
                  lay-filter="sreach"><i
                  class="layui-icon">&#xe615;</i></button>
        </div>
      </div>
      <xblock>
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn"
                onclick="x_admin_show('添加教师','${pageContext.request.contextPath}/teacher/add/page',600,400)"><i
                class="layui-icon"></i>添加</button>
        <span class="x-right" style="line-height:40px">共有数据：<span id="total">0</span></span>
      </xblock>
      <table class="layui-table" id="tablebody">
        <thead>
          <tr>
            <th>
              <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th>
            <th>教师编号</th>
            <th>教师名字</th>
            <th>教师年龄</th>
            <th>教师性别</th>
            <th>所教课程</th>
            <th>更新时间</th>
            <th>操作</th></tr>
        </thead>
        <tbody id="teacher-body">
          <tr>
            <td>
              <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
            </td>
            <td>1</td>
            <td>小明</td>
            <td>男</td>
            <td>13000000000</td>
            <td>admin@mail.com</td>
            <td>北京市 海淀区</td>
            <td>2017-01-01 11:11:42</td>
            <td class="td-manage">
              <a title="编辑"  onclick="x_admin_show('编辑','member-edit.html',600,400)" href="javascript:;">
                <i class="layui-icon">&#xe642;</i>
              </a>
              <a title="删除" onclick="member_del(this,${course.id})"
                 href="javascript:;">
                <i class="layui-icon">&#xe640;</i>
              </a>
            </td>
          </tr>
        </tbody>
      </table>
      <div class="page">
        <div id="page-container">
          <a class="prev" href="">&lt;&lt;</a>
          <a class="num" href="">1</a>
          <span class="current">2</span>
          <a class="num" href="">3</a>
          <a class="num" href="">489</a>
          <a class="next" href="">&gt;&gt;</a>
        </div>
      </div>

    </div>
    <script>
      layui.use('laydate', function(){
        var laydate = layui.laydate;
        
        //执行一个laydate实例
        laydate.render({
          elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
          elem: '#end' //指定元素
        });
      });
      $("#search").click(function () {
          getData(1,3);
      })
      /*用户-删除*/
      function member_del(obj,id){
          layer.confirm('确认要删除吗？',function(index){
              //发异步删除数据
              $.ajax({
                  type:"post",
                  url:"${pageContext.request.contextPath}/teacher/delete/page",
                  data:{id:id},
                  dataType:"json",
                  success:function (data) {
                      if (data.code == 200) {
                          $(obj).parents("tr").remove();
                         layer.msg('已删除!',{icon:1,time:1000});
                      }
                  }
              });
      });
      }



      function delAll (argument) {
        var ids= tableCheck.getData();
        layer.confirm('确认要删除吗？',function(index){
            //捉到所有被选中的，发异步进行删除
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/teacher/delete",
                data:{ids:ids},
                dataType:"json",
                success:function (data) {
                    if (data.code == 200) {
                        layer.msg('删除成功', {icon: 1});
                        $(".layui-form-checked").not('.header').parents('tr').remove();
                    }
                }
            });
        });
      }

      function getData(pageNum,pageSize) {
          var keywords=$("input[name=keywords]").val();
          var teacherParam={keywords:keywords,page:pageNum,pageSize:pageSize};
          var teacherGenders=["女","男"];
          $.ajax({
              type:"get",
              url:"${pageContext.request.contextPath}/teacher/list/data",
              data:teacherParam,
              dataType:"json",
              success:function (data){
                  console.log(data);
                  if(data.code==200){
                      $("#total").text(data.data.total)
                      $("#teacher-body").empty();
                      $(data.data.list).each(function () {
                          var tr=$('<tr>\n' +
                              '            <td>\n' +
                              '              <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id="'+this.id+'"><i class="layui-icon">&#xe605;</i></div>\n' +
                              '            </td>\n' +
                              '            <td>'+this.id+'</td>\n' +
                              '            <td>'+this.teacherName+'</td>\n' +
                              '            <td>'+this.teacherAge+'</td>\n' +
                              '            <td>'+teacherGenders[this.teacherGender]+'</td>\n' +
                              '            <td>'+this.course.courseName+'</td>\n' +
                              '            <td>'+(this.updateTime==null?'未更新':this.updateTime)+'</td>\n' +
                              '            <td class="td-manage">\n' +
                              '              <a title="编辑"  onclick="x_admin_show(\'编辑\',\'${pageContext.request.contextPath}/teacher/edit/page/'+this.id+'\',600,400)" href="javascript:;">\n' +
                              '                <i class="layui-icon">&#xe642;</i>\n' +
                              '              </a>\n' +
                              '              <a title="删除" onclick="member_del(this,'+this.id+')" href="javascript:;">\n' +
                              '                <i class="layui-icon">&#xe640;</i>\n' +
                              '              </a>\n' +
                              '            </td>\n' +
                              '          </tr>');
                          $("#teacher-body").append(tr);
                      })
                      $("#page-container").empty();
                      $("#page-container").append('<a class="prev" href="">&lt;&lt;</a>');
                      $(data.data.navigatepageNums).each(function () {
                          if(pageNum==this){
                              $("#page-container").append('<span class="current">'+this+'</span>');
                          }else {
                              $("#page-container").append('<a class="num" href="javascript:change_page('+this+');">'+this+'</a>');
                          }
                      })
                      $("#page-container").append('  <a class="next" href="">&gt;&gt;</a>');
                  }
              }
          });
      }

      function change_page(pageNum) {
          getData(pageNum,3);
      }
      $(function () {
        getData(1,3);
      });
    </script>

  </body>

</html>