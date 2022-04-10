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

        <fieldset class="table-search-fieldset">
            <legend>搜索信息</legend>
            <div style="margin: 10px 10px 10px 10px">
                <form class="layui-form layui-form-pane" action="">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">学生姓名</label>
                            <div class="layui-input-inline">
                                <input type="text" name="sname" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        
                        
                        <div class="layui-inline">
						    <label class="layui-form-label">班级</label>
						    <div class="layui-input-inline">
						        <input type="text" name="cid" placeholder="请输入" autocomplete="off" class="layui-input" id="demo2">
						    </div>
					     </div>
                        
                        <div class="layui-inline">
                            <label class="layui-form-label">学生学号</label>
                            <div class="layui-input-inline">
                                <input type="text" name="sno" autocomplete="off" class="layui-input">
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
    layui.use(['form', 'table','tableSelect'], function () {
        var $ = layui.jquery,
            form = layui.form,
            tableSelect = layui.tableSelect,
            table = layui.table;

        table.render({
            elem: '#currentTableId',
            url: '<%=basePath %>student/listAllStudent',
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            cols: [[
                {type: "checkbox", width: 50},
                {field: 'sno', title: '学号', sort: true},
                {field: 'cid',  title: '班级'},
                {field: 'sname', title: '姓名', sort: true},
                {field: 'stel', title: '电话'},
                {field: 'ssex', title: '性别', sort: true},
                {field: 'sphoto',title: '照片', sort: true},
                {title: '操作', minWidth: 150, toolbar: '#currentTableBar', align: "center"}
            ]],
            limits: [10, 15, 20, 25, 50, 100],
            limit: 15,
            page: true,
            skin: 'line'
        });

        // 监听搜索操作
        form.on('submit(data-search-btn)', function (data) {
            var result = JSON.stringify(data.field);
            

            //执行搜索重载
            table.reload('currentTableId', {
            	url: '<%=basePath %>student/listStudent'
                ,page: {
                    curr: 1
                }
                , where: {
                    sno: data.field.sno,
                    sname: data.field.sname,
                    cid: data.field.cid
                }
            }, 'data');

      

            return false;
        });

        tableSelect.render({
            elem: '#demo2',
            checkedKey: 'id',
            table: {
                url: '<%=basePath %>classes/listAllClass',
                cols: [[
                    { type: 'radio' },
                    { field: 'cid', title: 'ID' },
                    { field: 'cname', title: '班级名' },
                    { field: 'cyear', title: '入学年份' }
                ]]
            },
            done: function (elem, data) {
                var NEWJSON = []
                layui.each(data.data, function (index, item) {
                    NEWJSON.push(item.cid)
                })
                elem.val(NEWJSON.join(","))
            }
        })

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
                    content: 'addStudent.jsp',
                });
                $(window).on("resize", function () {
                    layer.full(index);
                });
            } else if (obj.event === 'delete') {  // 监听删除操作
                var checkStatus = table.checkStatus('currentTableId')
                    , data = checkStatus.data;
                
                var NEWJSON = []
                layui.each(data, function (index, item) {
                    NEWJSON.push(item.sno)
                })
                var sel = NEWJSON.join(",");
                var mmsg = '';

                $.ajax({
                    url: '<%=basePath%>student/delStudent',
                    type: "GET",
                    async: false,
                    data: {
                        sno:sel
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
                    content: 'editStudent.jsp',
                    success: function(layero, index){
                        var body = layer.getChildFrame('body', index);
                        var iframeWin = window[layero.find('iframe')[0]['name']]; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
                        console.log(body.html()) //得到iframe页的body内容
                        body.find('#sno').val(data.sno)
                        body.find('#sname').val(data.sname)
                        body.find('#stel').val(data.stel)
                        body.find('#demo2').val(data.cid)
                        body.find('#sphoto').val(data.sphoto)
                        body.find('#demo1').attr('src', data.photo)
                        body.find(".ssex input[value="+data.ssex+"]").prop("checked","checked");
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

</body>
</html>