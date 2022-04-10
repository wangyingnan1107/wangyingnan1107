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
    <title>实验预约</title>
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
   <a class="layui-btn layui-btn-normal layui-btn-xs data-count-edit" lay-event="edit">打分</a>
</script>
<script type="text/html" id="urlTpl">
   <a href="<%=basePath%>img/experiment{{d.ehelp}}" download="{{d.ename}}实验文档">{{d.ehelp}}</a>
</script>
<script type="text/html" id="urlTpl2">
   
  {{#  if(d.sereport == null){ }}
      	<span class="layui-btn layui-btn-danger layui-btn-xs">未上传</span>
  {{#  } else if(d.sereport != null) { }}
      <a href="<%=basePath%>img/student{{d.sereport}}" download="{{d.sno}}-{{d.sname}}-{{da.ename}}实验报告">{{d.sereport}}</a>
  {{#  } }}
</script>
<script type="text/html" id="checkboxTpl">
	<div>
      <input type="number" name="scores" value="{{d.sescores}}"  autocomplete="off" class="layui-input" id="{{d.seid}}">
    </div>		
</script>
<script src="<%=basePath %>resources/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script src="<%=basePath %>resources/js/lay-config.js?v=1.0.4" charset="utf-8"></script>
<script>
    layui.use(['form', 'table'], function () {
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table;
        da= window.parent.data;//使用父窗口的data
		console.log(da);
        table.render({
            elem: '#currentTableId',
            url: '<%=basePath %>student/listScores?eid='+da.eid,
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            cols: [[
                {field: 'sno', title: '学号', sort: true},
                {field: 'sname',  title: '姓名'},
                {field: 'cname', title: '班级', sort: true},
                {field: 'sphoto', title: '图片',templet:'<div><img style="width: 100px;height: 50px;border-radius:10px;" src="<%=basePath%>img/student{{d.sphoto}}"></div>'},
                {field: 'sereport', title: '实验报告', templet: "#urlTpl2", sort: true},
                {field: 'sescores',title: '分数',templet:"#checkboxTpl", sort: true},
                {title: '操作', width: 70, toolbar: '#currentTableBar', align: "center"}
            ]],
            limits: [10, 15, 20, 25, 50, 100],
            limit: 15,
            page: true/* ,
            skin: 'line' */
        });



        table.on('tool(currentTableFilter)', function (obj) {
            var data = obj.data;
            window.data= data;
            var scores = document.getElementById(data.seid).value;
            if (obj.event === 'edit') {
				$.ajax({
		    	    url:'<%=basePath%>student/pingfen',      
		    	    type:"GET",
		    	    data:{
			    	    seid:data.seid,
			    	    sescores:scores
		    	    },         
		    	   	success:function(res){
		    	   		if(res=='1'){
             				layer.msg('评分成功', { icon: 1, time: 1500 }, function () {
             					table.reload('currentTableId');   
                        	});
             		   }else{
             			   layer.msg('评分失败', { icon: 2, time: 1500 });
             			   table.reload('currentTableId');
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