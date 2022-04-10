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
    <title>我的实验</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="<%=basePath %>resources/lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=basePath %>resources/css/public.css" media="all">
    <style type="text/css">
    	.layui-table-cell{
			height:auto !important;
		}
    
    </style>
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">
        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>
    </div>
</div>
<script type="text/html" id="currentTableBar">
   <a class="layui-btn layui-btn-normal layui-btn-xs data-count-edit" lay-event="edit">预约</a>
</script>
<script type="text/html" id="urlTpl">
   <a href="<%=basePath%>img/experiment{{d.ehelp}}" download="{{d.ename}}实验文档">{{d.ehelp}}</a>
</script>
<script type="text/html" id="urlTpl2">
   
  {{#  if(d.sereport == null){ }}
      	<span class="layui-btn layui-btn-danger layui-btn-xs">未上传</span>
  {{#  } else if(d.sereport != null) { }}
      <a href="<%=basePath%>img/student{{d.sereport}}" download="{{d.ename}}实验报告">{{d.sereport}}</a>
  {{#  } }}
</script>
<script type="text/html" id="uploadItem">
  <a class="layui-btn layui-btn-xs upload_btn" lay-data="{data: {id: '{{d.seid}}', other: 100} }">报告上传</a>
</script>
<script type="text/html" id="statusTpl">
  {{#  if(d.estate == 3){ }}
      <span class="layui-btn layui-btn-normal layui-btn-xs">未开始</span>
  {{#  } else if(d.estate == 4) { }}
      <span class="layui-btn layui-btn-danger layui-btn-xs">进行中</span>
  {{#  } else if(d.estate == 5) { }}
      <span class="layui-btn layui-btn-warm layui-btn-xs">已结束</span>
  {{#  } }}
</script>
<script src="<%=basePath %>resources/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script src="<%=basePath %>resources/js/lay-config.js?v=1.0.4" charset="utf-8"></script>
<script>
    layui.use(['form', 'table','upload'], function () {
        var $ = layui.jquery,
            form = layui.form,
            upload = layui.upload,
            table = layui.table;

        table.render({
            elem: '#currentTableId',
            url: '<%=basePath %>student/myEx?sno=${student.sno}',
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            cols: [[
                {field: 'ename', title: '实验名', sort: true},
                {field: 'lname', title: '实验室', sort: true},
                {field: 'tname', title: '教师', sort: true},
                {field: 'estime',title: '实验时间',templet:'<div>{{ layui.util.toDateString(d.estime, "yyyy-MM-dd HH:mm:ss") }}</div>', sort: true},
                {field: 'estate',title: '实验状态', templet: "#statusTpl",sort: true},
                {field: 'ehelp',title: '文档',templet: "#urlTpl", sort: true},
                {field: 'sereport',title: '实验报告',templet: "#urlTpl2", sort: true},
                {field: 'scores', title: '分数', sort: true},
                {field: 'upload',title: '报告上传',templet: '#uploadItem'}
            ]],
            limits: [10, 15, 20, 25, 50, 100],
            limit: 15,
            page: true,
            done: function (res, curr, count) {
                var tableId = this.id;
                console.log("hahahaha"+this.id);
                console.log(this.elem);
                var tableElem = this.elem;
                // table render出来实际显示的table组件
                var tableViewElem = tableElem.next();
                // 渲染当前页面的所有的upload组件
                var uploadInst = upload.render({
                    elem: tableViewElem.find('.upload_btn')
                    ,url: '<%=basePath%>student/uploadReport' 
                    	,accept: 'file' 
                		,before: function(obj){
                			console.log("开始")
                		}
                		,done: function(res){
    	              		//如果上传失败
    	              		if(res.code > 0){
    	                		layer.msg('上传失败');
    	              		}else{
    	              			//上传成功
        	              		$.ajax({
        	      	              url: '<%=basePath%>student/addReport',
        	      	              type: "GET",
        	      	              async: false,
        	      	              data: {
        	      	            	sereport :res.data.src,
        	      	                  seid : res.data.seid
        	      	              },
        	      	              dataType: 'HTML',
        	      	             	success: function (data) {
        	      	
        	      	                 	mmsg=data;
        	      	              } 
        	      	          });
        	              		if(mmsg=='1'){
        	              			layer.msg('上传成功');
        	              			table.reload('currentTableId');
        	           		   }else{
        	           			layer.msg('文件已上传，数据更新失败！');
        	           		   }
        	              	}
                		}
                		,error: function(){
                			layer.msg('上传失败，未知错误！')
                		}
                });
            }
        });
        table.on('tool(currentTableFilter)', function (obj) {
            var data = obj.data;
            window.data= data;
            if (obj.event === 'edit') {
				$.ajax({
		    	    url:'<%=basePath%>experiment/isYuyue?sid=${student.sno}',      
		    	    type:"GET",
		    	    data:{
			    	    eid:data.eid
		    	    },         
		    	   	success:function(res){
		    	   		if(res=='1'){
		    				layer.confirm('是否预约?', function (index) {
		    	            	$.ajax({
		    	                    url: '<%=basePath%>experiment/yuyue?sid=${student.sno}',
		    	                    type: "GET",
		    	                    async: false,
		    	                    data: {
			    	                    eid:data.eid
		    	                    },
		    	                    dataType: 'HTML',
		    	                   	success: function (data) {
		    	                       msg = data;
		    	                    } 
		    	                });
		    	     		   if(msg=='1'){
		    	     			   layer.msg('预约成功', { icon: 1, time: 1500 }, function () {
		    	                    });
		    	     			   layer.close(index);
		    	     		   }else{
		    	     			   layer.msg('预约失败', { icon: 2, time: 1500 });
		    	     		   }

		    	            });
		    				
		    			}else{
		    				layer.msg("无法预约！您已经预约实验！")
		    			}
		    	    }  
		         });
                return false;
            } 
        });
    });
</script>

</body>
</html>