<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>市场计划列表</title>
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
        <form class="layui-form layui-col-md12 x-so">
          <input class="layui-input" placeholder="开始日" name="start" id="start">
          <input class="layui-input" placeholder="截止日" name="end" id="end">
          <div class="layui-input-inline">
            <select name="contrller">
              <option>支付状态</option>
              <option>已支付</option>
              <option>未支付</option>
            </select>
          </div>
          <div class="layui-input-inline">
            <select name="contrller">
              <option>支付方式</option>
              <option>支付宝</option>
              <option>微信</option>
              <option>货到付款</option>
            </select>
          </div>
          <div class="layui-input-inline">
            <%--<select name="contrller">--%>
              <%--<option value="">订单状态</option>--%>
              <%--<option value="0">待确认</option>--%>
              <%--<option value="1">已确认</option>--%>
              <%--<option value="2">已收货</option>--%>
              <%--<option value="3">已取消</option>--%>
              <%--<option value="4">已完成</option>--%>
              <%--<option value="5">已作废</option>--%>
            <%--</select>--%>
          </div>
          <input type="text" name="username"  placeholder="请输入订单号" autocomplete="off" class="layui-input">
          <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
        </form>
      </div>
      <xblock>
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn"
                onclick="x_admin_show('添加计划','${pageContext.request.contextPath}/market/add/page')"><i
                class="layui-icon"></i>添加</button>
        <span class="x-right" style="line-height:40px">共有数据：88 条</span>
      </xblock>
      <table class="layui-table" id="tablebody">
        <thead>
          <tr>
            <th>
              <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th>
            <th>ID</th>
            <th>计划名字</th>
            <th>计划详情</th>
            <th>计划课程</th>
            <th>计划老师</th>
            <th>计划教室</th>
            <th>计划人数</th>
            <th>状态</th>
            <th>截止日期</th>
            <th >操作</th>
            </tr>
        </thead>
        <tbody id="table-list">
          <tr>
            <td>
              <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
            </td>
            <td>20170091718</td>
            <td>老王:18925139194</td>
            <td>7829.10</td>
            <td>7854.10</td>
            <td>待确认</td>
            <td>未支付</td>
            <td>未发货</td>
            <td>其他方式</td>
            <td>2017-08-17 18:22</td>
            <td class="td-manage">
              <a title="查看"  onclick="x_admin_show('编辑','order-view.html')" href="javascript:;">
                <i class="layui-icon">&#xe63c;</i>
              </a>
              <a title="删除" onclick="member_del(this,'要删除的id')" href="javascript:;">
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

       /*用户-停用*/
      function member_stop(obj,id){
          layer.confirm('确认要停用吗？',function(index){

              if($(obj).attr('title')=='启用'){

                //发异步把用户状态进行更改
                $(obj).attr('title','停用')
                $(obj).find('i').html('&#xe62f;');

                $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                layer.msg('已停用!',{icon: 5,time:1000});

              }else{
                $(obj).attr('title','启用')
                $(obj).find('i').html('&#xe601;');

                $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                layer.msg('已启用!',{icon: 5,time:1000});
              }
              
          });
      }

      /*用户-删除*/
      function member_del(obj,id){
          layer.confirm('确认要删除吗？',function(index){
              //发异步删除数据
              $.ajax({
                  type:"post",
                  url:"${pageContext.request.contextPath}/market/delete/page",
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
                  url:"${pageContext.request.contextPath}/market/delete/all",
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
          var pstatus=["未开始","进行中","已结束"]
          var keywords=$("input[name=keywords]").val();
          var marketplanParam={keywords:keywords,page:pageNum,pageSize:pageSize};
          $.ajax({
              type:"get",
              url:"${pageContext.request.contextPath}/market/list/data",
              data:marketplanParam,
              dataType:"json",
              success:function (data){
//                  console.log(data);
                  if(data.code==200){
                      $("#total").text(data.data.total)
                      $("#table-list").empty();
                      $(data.data.list).each(function () {
                          var tr=$('<tr>\n' +
                              '            <td>\n' +
                              '              <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id="'+this.id+'"><i class="layui-icon">&#xe605;</i></div>\n' +
                              '            </td>\n' +
                              '            <td>'+this.id+'</td>\n' +
                              '            <td>'+this.planName+'</td>\n' +
                              '            <td>'+this.planDatail+'</td>\n' +
                              '            <td>'+this.course.courseName+'</td>\n' +
                              '            <td>'+this.teacher.teacherName+'</td>\n' +
                              '            <td>'+this.classRoom.num+'</td>\n' +
                              '            <td>'+this.planStuCount+'</td>\n' +
                              '            <td>'+pstatus[this.status]+'</td>\n' +
                              '            <td>'+this.planEndTime+'</td>\n' +
                              '            <td class="td-manage">\n' +
                              '              <a title="编辑"  onclick="x_admin_show(\'编辑\',\'${pageContext.request.contextPath}/market/edit/page/'+this.id+'\',600,400)" href="javascript:;">\n' +
                              '                <i class="layui-icon">&#xe642;</i>\n' +
                              '              </a>\n' +
                              '              <a title="删除" onclick="member_del(this,'+this.id+')" href="javascript:;">\n' +
                              '                <i class="layui-icon">&#xe640;</i>\n' +
                              '              </a>\n' +
                              '            </td>\n' +
                              '          </tr>');
                          $("#table-list").append(tr);
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