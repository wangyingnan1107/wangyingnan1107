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
    <title>报告评分</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="<%=basePath %>resources/lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=basePath %>resources/css/public.css" media="all">
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">
        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>
    </div>
</div>
<script type="text/html" id="currentTableBar">
    <a class="layui-btn layui-btn-normal layui-btn-xs data-count-edit" lay-event="edit">评分</a>
</script>

<script src="<%=basePath %>resources/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script src="<%=basePath %>resources/js/lay-config.js?v=1.0.4" charset="utf-8"></script>
<script>
    layui.use(['form', 'table','laydate','element'], function () {
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table,
            element = layui.element,
            laydate = layui.laydate;
      //日期时间范围
        laydate.render({
          elem: '#test1'
          ,type: 'datetime'
          ,range: '~'
        });

        table.render({
            elem: '#currentTableId',
            url: '<%=basePath %>experiment/listEnd?tid=${teacher.tid}',
            defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            cols: [[
                {field: 'eid', title: '实验编号', sort: true},
                {field: 'ename',  title: '实验名'},
                {field: 'edesc',  title: '实验描述'},
                {field: 'eetime',title: '结束日期', templet:'<div>{{ layui.util.toDateString(d.eetime, "yyyy-MM-dd HH:mm:ss") }}</div>',sort: true},
                {field: 'reportnum',title: '报告提交状态',width: 300, templet: "#progressTpl",sort: true},
                {field: 'scoresnum',title: '评分状态',width: 300, templet: "#progressTpl1",sort: true},
                {title: '操作', width: 60, toolbar: '#currentTableBar', align: "center"}
            ]],
            limits: [10, 15, 20, 25, 50, 100],
            limit: 15,
            page: true/* ,
            skin: 'line' */
            ,done: function (res, curr, count) {
                console.log(res, curr, count);
                element.init();
            },
        });

        // 监听搜索操作
        form.on('submit(data-search-btn)', function (data) {
            var result = JSON.stringify(data.field);
            //执行搜索重载
            table.reload('currentTableId', {
            	url: '<%=basePath %>experiment/listExWithSel?tid=${teacher.tid}'
                ,page: {
                    curr: 1
                }
                , where: {
                    ename: data.field.ename,
                    entime: data.field.entime
                }
            }, 'data');
            return false;
        });



        table.on('tool(currentTableFilter)', function (obj) {
            var data = obj.data;
            window.data= data;
            if (obj.event === 'edit') {

                var index = layer.open({
                    
                    title: '实验评分',
                    type: 2,
                    shade: 0.2,
                    maxmin:true,
                    shadeClose: true,
                    area: ['100%', '100%'],
                    content: 'pingfen.jsp',
                    success: function(layero, index){
                        
                      }
                    
                });
                $(window).on("resize", function () {
                    layer.full(index);
                });
                return false;
            } else if (obj.event === 'delete') {
                layer.confirm('真的删除行么', function (index) {
                	$.ajax({
                        url: '<%=basePath%>student/delStudent',
                        type: "GET",
                        async: false,
                        data: {
                            sno:data.sno
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
<!-- 任务进度 -->
<script type="text/html" id="progressTpl">
	<div class="layui-progress layui-progress-big" lay-showpercent="true" style="top: 6px">
        <div class="layui-progress-bar layui-bg-green" lay-percent="{{d.reportnum}} / {{d.num}}"></div>
    </div>
</script>
<!-- 任务进度 -->
<script type="text/html" id="progressTpl1">
	<div class="layui-progress layui-progress-big" lay-showpercent="true" style="top: 6px">
        <div class="layui-progress-bar layui-bg-blue" lay-percent="{{d.scoresnum}} / {{d.num}}"></div>
    </div>
</script>
</body>
</html>