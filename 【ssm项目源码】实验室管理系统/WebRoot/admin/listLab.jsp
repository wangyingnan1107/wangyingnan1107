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
    <title>实验室信息</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="<%=basePath %>resources/lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=basePath %>resources/css/public.css" media="all">
    <style type="text/css">
    	.layui-table-cell {
        overflow: visible;
    }
 
    .layui-table-box {
        overflow: visible;
    }
 
    .layui-table-body {
        overflow: visible;
    }
    /* 调整高度 */
    td .layui-form-select{
        margin-top: -10px;
        margin-left: -15px;
        margin-right: -15px;
    }
    
    </style>
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">

        <h2 style="text-align: center;">实验室管理</h2>

        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
				<button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="add"> 添加实验室 </button>
            </div>
        </script>
        <script type="text/html" id="checkboxTpl">
			<div style="width:100%">
				<select name="fieldType" id="{{d.lid}}" lay-filter="lockDemo">
        			<option value="1" {{d.lstate==1?'selected':''}}>空闲中</option>
        			<option value="2" {{d.lstate==2?'selected':''}}>使用中</option>
        			<option value="3" {{d.lstate==3?'selected':''}}>不可用</option>
    			</select>
    		</div>
		</script>

        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

        <script type="text/html" id="currentTableBar">
            <a class="layui-btn layui-btn-normal layui-btn-xs data-count-list" lay-event="edit">使用记录</a>
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
            url: '<%=basePath %>lab/listAllLabs',
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            cols: [[
                
                {field: 'lid', title: 'id', sort: true},
                {field: 'lname',  title: '名字'},
                {field: 'ldesc', title: '描述', sort: true},
                {field: 'lphoto', title: '照片', templet:'<div><img style="width: 50px;height: 50px;" src="<%=basePath%>img/lab{{d.lphoto}}"></div>',sort: true},
                {field:'lstate', title:'状态',templet: '#checkboxTpl',sort: true},
                {title: '操作', minWidth: 150, toolbar: '#currentTableBar', align: "center"}
            ]],
            limits: [10, 15, 20, 25, 50, 100],
            limit: 15,
            page: true/* ,
            skin: 'line' */

            
        });

      //监听锁定操作
        form.on('select(lockDemo)', function(obj){
          	//layer.tips(obj.value + ' ' + obj.elem.id + '：'+ obj.elem, obj.othis);
			console.log(obj);
	         $.ajax({
	              url: '<%=basePath%>lab/changeState',
	              type: "GET",
	              async: false,
	              data: {
	                  lid :obj.elem.id,
	                  lstate : obj.value
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
        	 if (obj.event === 'add') {  // 监听添加操作
                 var index = layer.open({
                     title: '添加用户',
                     type: 2,
                     shade: 0.2,
                     maxmin:true,
                     shadeClose: true,
                     area: ['100%', '100%'],
                     content: 'addLab.jsp',
                 });
                 $(window).on("resize", function () {
                     layer.full(index);
                 });
             }
        });

        
		//监听操作事件
        table.on('tool(currentTableFilter)', function (obj) {
            var data = obj.data;
            window.data= data;
            if (obj.event === 'edit') {
                if(data.lstate=='1'){
                	var index = layer.open({
                        title: '编辑实验室',
                        type: 2,
                        shade: 0.2,
                        maxmin:true,
                        shadeClose: true,
                        area: ['100%', '100%'],
                        content: 'editLab.jsp',
                        success: function(layero, index){
                            var body = layer.getChildFrame('body', index);
                            var iframeWin = window[layero.find('iframe')[0]['name']]; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
                            console.log(body.html()) //得到iframe页的body内容
                            body.find('#lid').val(data.lid)
                            body.find('#lname').val(data.lname)
                            body.find('#ldesc').val(data.ldesc)
                            body.find('#lphoto').val(data.lphoto)
                          }
                        
                    });
                    $(window).on("resize", function () {
                        layer.full(index);
                    });

                }else{
					layer.msg('当前状态不可编辑')
                }
                
                return false;
            } else if (obj.event === 'delete') {

            	if(data.lstate=='1'){
            		layer.confirm('真的删除此实验室么', function (index) {
                    	$.ajax({
                            url: '<%=basePath%>lab/delLab',
                            type: "GET",
                            async: false,
                            data: {
                                lid:data.lid
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
                	
            	}else{
            		layer.msg('当前状态不可删除')

                }
                
            }
        });

    });
</script>

</body>
</html>