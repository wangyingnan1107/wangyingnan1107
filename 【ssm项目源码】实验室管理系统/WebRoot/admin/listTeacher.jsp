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
    <title>教师信息</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="<%=basePath %>resources/lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=basePath %>resources/css/public.css" media="all">
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">

        <fieldset class="table-search-fieldset">
            <legend>搜索信息</legend>
            <div style="margin: 10px 10px 10px 10px">
                <form class="layui-form layui-form-pane" action="">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">教师姓名</label>
                            <div class="layui-input-inline">
                                <input type="text" name="tname" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <button type="submit" class="layui-btn layui-btn-primary"  lay-submit lay-filter="data-search-btn"><i class="layui-icon"></i> 搜 索</button>
                        </div>
                    </div>
                </form>
            </div>
        </fieldset>

        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="add"> 添加 </button>
                <button class="layui-btn layui-btn-sm layui-btn-danger data-delete-btn" lay-event="delete"> 删除 </button>
            </div>
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
    layui.use(['form', 'table'], function () {
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table;

        table.render({
            elem: '#currentTableId',
            url: '<%=basePath %>teacher/listAllTeacher',
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            cols: [[
                {type: "checkbox", width: 50},
                {field: 'tid', title: 'id', sort: true},
                {field: 'tname',  title: '姓名'},
                {field: 'ttel', title: '电话', sort: true},
                {field: 'tdesc', title: '描述'},
                {field: 'tphoto',title: '照片', templet:'<div><img style="width: 100px;height: 100px;" src="/teacherImagesteacher{{d.tphoto}}" alt="Smiley face"></div>',sort: true},
                {title: '操作', minWidth: 150, toolbar: '#currentTableBar', align: "center"}
            ]],
            limits: [10, 15, 20, 25, 50, 100],
            limit: 15,
            page: true/* ,
            skin: 'line' */
        });

        // 监听搜索操作
        form.on('submit(data-search-btn)', function (data) {
            var result = JSON.stringify(data.field);
            //执行搜索重载
            table.reload('currentTableId', {
            	url: '<%=basePath %>teacher/listTeacher'
                ,page: {
                    curr: 1
                }
                , where: {
                    tname:data.field.tname
                }
            }, 'data');
            return false;
        });

        /**
         * toolbar监听事件
         */
        table.on('toolbar(currentTableFilter)', function (obj) {
            if (obj.event === 'add') {  // 监听添加操作
                var index = layer.open({
                    title: '添加用户',
                    type: 2,
                    shade: 0.2,
                    maxmin:true,
                    shadeClose: true,
                    area: ['100%', '100%'],
                    content: 'addTeacher.jsp',
                });
                $(window).on("resize", function () {
                    layer.full(index);
                });
            } else if (obj.event === 'delete') {  // 监听删除操作
                var checkStatus = table.checkStatus('currentTableId')
                    , data = checkStatus.data;
                
                var NEWJSON = []
                layui.each(data, function (index, item) {
                    NEWJSON.push(item.tid)
                })
                var sel = NEWJSON.join(",");
                var mmsg = '';

                $.ajax({
                    url: '<%=basePath%>teacher/delTeacher',
                    type: "GET",
                    async: false,
                    data: {
                        tid:sel
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

        table.on('tool(currentTableFilter)', function (obj) {
            var data = obj.data;
            window.data= data;
            if (obj.event === 'edit') {

                var index = layer.open({
                    
                    title: '编辑用户',
                    type: 2,
                    shade: 0.2,
                    maxmin:true,
                    shadeClose: true,
                    area: ['100%', '100%'],
                    content: 'editTeacher.jsp',
                    success: function(layero, index){
                        var body = layer.getChildFrame('body', index);
                        var iframeWin = window[layero.find('iframe')[0]['name']]; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
                        console.log(body.html()) //得到iframe页的body内容
                        body.find('#tid').val(data.tid)
                        body.find('#tname').val(data.tname)
                        body.find('#ttel').val(data.ttel)
                        body.find('#tdesc').val(data.tdesc)
                        body.find('#tphoto').val(data.tphoto)
                        body.find('#demo1').attr('src', data.tphoto)
                      }
                    
                });
                $(window).on("resize", function () {
                    layer.full(index);
                });
                return false;
            } else if (obj.event === 'delete') {
                layer.confirm('真的删除行么', function (index) {
                	$.ajax({
                        url: '<%=basePath%>teacher/delTeacher',
                        type: "GET",
                        async: false,
                        data: {
                            tid:data.tid
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