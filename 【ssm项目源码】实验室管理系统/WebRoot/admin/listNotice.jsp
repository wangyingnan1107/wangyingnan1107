<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>学生信息</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="<%=basePath %>resources/lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=basePath %>resources/css/public.css" media="all">
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">

        <h2 style="text-align: center;">通知管理</h2>

        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-sm layui-btn-danger data-delete-btn" lay-event="delete"> 批量删除 </button>
            </div>
        </script>
        <script type="text/html" id="checkboxTpl">
  			<input type="checkbox" name="lock" value="{{d.nid}}" title="展示" lay-filter="lockDemo" {{ d.nstate == 1 ? 'checked' : '' }}>
		</script>

        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

        <script type="text/html" id="currentTableBar">
            <a class="layui-btn layui-btn-normal layui-btn-xs data-count-edit" lay-event="edit">编辑</a>
            <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">删除</a>
        </script>

    </div>
</div>
<script src="<%=basePath %>resources/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script src="<%=basePath %>resources/js/lay-config.js?v=1.0.4" charset="utf-8"></script>
<script>
    layui.use(['form', 'table','util'], function () {
        var $ = layui.jquery,
            form = layui.form,
            util = layui.util,
            table = layui.table;

        table.render({
            elem: '#currentTableId',
            url: '<%=basePath %>notice/listAllNotice',
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            cols: [[
                {type: "checkbox", width: 50},
                {field: 'nid', title: 'id', sort: true},
                {field: 'ntit',  title: '标题'},
                {field: 'nbody', title: '正文', sort: true},
                {field: 'ntime', title: '时间', templet:'<div>{{ layui.util.toDateString(d.ntime, "yyyy-MM-dd HH:mm:ss") }}</div>',sort: true},
                {field:'nstate', title:'是否首页展示',templet: '#checkboxTpl'},
                {title: '操作', minWidth: 150, toolbar: '#currentTableBar', align: "center"}
            ]],
            limits: [10, 15, 20, 25, 50, 100],
            limit: 15,
            page: true,
            skin: 'line'

            
        });

      //监听锁定操作
        form.on('checkbox(lockDemo)', function(obj){
            //layer.msg(obj);
          //layer.tips(this.value + ' ' + this.name + '：'+ obj.elem, obj.othis);

          var nid = this.value;
          var nstate = obj.elem.checked;
          $.ajax({
              url: '<%=basePath%>notice/changeState',
              type: "GET",
              async: false,
              data: {
                  nid :nid,
                  nstate : nstate
              },
              dataType: 'HTML',
             	success: function (data) {

                 	mmsg=data;
              } 
          });
        });
    

        /**
         * toolbar监听事件
         */
        table.on('toolbar(currentTableFilter)', function (obj) {
            if (obj.event === 'delete') {  // 监听删除操作
                var checkStatus = table.checkStatus('currentTableId')
                    , data = checkStatus.data;
                var NEWJSON = []
                layui.each(data, function (index, item) {
                    NEWJSON.push('"'+item.nid+'"')
                })
                var sel = NEWJSON.join(",");
                var mmsg = '';

                $.ajax({
                    url: '<%=basePath%>notice/delNotice',
                    type: "GET",
                    async: false,
                    data: {
                        nid:sel
                    },
                    dataType: 'HTML',
                   	success: function (data) {

                       	mmsg=data;
                    } 
                });
                if(mmsg=='1'){
      			   layer.msg('删除成功', { icon: 1, time: 1500 }, function () {
                       window.location.reload();
                     });
      			   layer.close(index);
      		   }else{
      			   layer.msg('删除失败', { icon: 2, time: 1500 });
      		   }
            }
        });

        //监听表格复选框选择
        table.on('checkbox(currentTableFilter)', function (obj) {
            console.log(obj)
        });
		//监听操作事件
        table.on('tool(currentTableFilter)', function (obj) {
            var data = obj.data;
            window.data= data;
            if (obj.event === 'edit') {
                var index = layer.open({
                    title: '编辑通知',
                    type: 2,
                    shade: 0.2,
                    maxmin:true,
                    shadeClose: true,
                    area: ['100%', '100%'],
                    content: 'editNotice.jsp',
                    success: function(layero, index){
                        var body = layer.getChildFrame('body', index);
                        var iframeWin = window[layero.find('iframe')[0]['name']]; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
                        console.log(body.html()) //得到iframe页的body内容
                        body.find('#nid').val(data.nid)
                        body.find('#ntit').val(data.ntit)
                        body.find('#nbody').val(data.nbody)
                      }
                    
                });
                $(window).on("resize", function () {
                    layer.full(index);
                });
                return false;
            } else if (obj.event === 'delete') {
                layer.confirm('真的删除此通知么', function (index) {
                	$.ajax({
                        url: '<%=basePath%>notice/delNotice',
                        type: "GET",
                        async: false,
                        data: {
                            nid:'"'+data.nid+'"'
                        },
                        dataType: 'HTML',
                       	success: function (data) {
                           msg = data;
                        } 
                    });
         		   if(msg=='1'){
         			   layer.msg('删除成功', { icon: 1, time: 1500 }, function () {
                            obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                        });
         			   layer.close(index);
         		   }else{
         			   layer.msg('删除失败', { icon: 2, time: 1500 });
         		   }

                });
            }
        });

    });
</script>

</body>
</html>