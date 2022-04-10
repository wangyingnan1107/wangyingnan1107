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
    <title>未通过实验申请</title>
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
                            <label class="layui-form-label">实验名</label>
                            <div class="layui-input-inline">
                                <input type="text" name="ename" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        
                        <div class="layui-inline">
						    <label class="layui-form-label">实验时间</label>
						    <div class="layui-input-inline">
						    	<input type="text" name="entime" class="layui-input" id="test1" placeholder="~">
						    </div>
					    </div>
                        
                        
                        <div class="layui-inline">
                            <button type="submit" class="layui-btn layui-btn-primary"  lay-submit lay-filter="data-search-btn"><i class="layui-icon"></i> 搜 索</button>
                        </div>
                    </div>
                </form>
            </div>
        </fieldset>


        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

        <script type="text/html" id="currentTableBar">
            <a class="layui-btn layui-btn-normal layui-btn-xs data-count-edit" lay-event="edit">查看原因</a>
            <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">删除</a>
        </script>
        <script type="text/html" id="statusTpl">
        	{{#  if(d.estate == 1){ }}
				<span class="layui-btn layui-btn-warm layui-btn-xs">未审核</span>
        	{{#  } else if(d.estate == 2) { }}
            	<span class="layui-btn layui-btn-normal layui-btn-xs">未通过</span>
			{{#  } }}
    	</script>

    </div>
</div>
<script src="<%=basePath %>resources/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script src="<%=basePath %>resources/js/lay-config.js?v=1.0.4" charset="utf-8"></script>
<script>
    layui.use(['form', 'table','laydate'], function () {
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table,
            laydate = layui.laydate;
      //日期时间范围
        laydate.render({
          elem: '#test1'
          ,type: 'datetime'
          ,range: '~'
        });

        table.render({
            elem: '#currentTableId',
            url: '<%=basePath %>experiment/listUnEx?tid=${teacher.tid}',
            defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            cols: [[
                {field: 'eid', title: '实验编号', sort: true},
                {field: 'ename',  title: '实验名'},
                {field: 'edesc',  title: '实验描述'},
                {field: 'lname', title: '实验室', sort: true},
                {field: 'dname', title: '设备'},
                {field: 'dnum', title: '设备数量'},
                {field: 'entime', title: '申请日期', templet:'<div>{{ layui.util.toDateString(d.entime, "yyyy-MM-dd HH:mm:ss") }}</div>', sort: true},
                {field: 'estime',title: '开始日期', templet:'<div>{{ layui.util.toDateString(d.estime, "yyyy-MM-dd HH:mm:ss") }}</div>',sort: true},
                {field: 'eetime',title: '结束日期', templet:'<div>{{ layui.util.toDateString(d.eetime, "yyyy-MM-dd HH:mm:ss") }}</div>',sort: true},
                {field: 'estate',title: '状态', templet: "#statusTpl",sort:true},
                {title: '操作', minWidth: 200, toolbar: '#currentTableBar', align: "center"}
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
            	url: '<%=basePath %>experiment/listUnExWithSel?tid=${teacher.tid}'
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