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
    <title>发布通知</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="<%=basePath %>resources/lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=basePath %>resources/css/public.css" media="all">
    <style>
        body {
            background-color: #ffffff;
        }
    </style>
</head>
<body>
	<div class="layui-form layuimini-form">
		<div class="layui-form-item">
	        <label class="layui-form-label required">通知id</label>
	        <div class="layui-input-block">
	            <input readonly="readonly" id="nid" type="text" name="nid" lay-verify="required" lay-reqtext="标题不能为空" placeholder="请输入标题" value="" class="layui-input">
	        </div>
	    </div>
	    <div class="layui-form-item">
	        <label class="layui-form-label required">通知标题</label>
	        <div class="layui-input-block">
	            <input id="ntit" type="text" name="ntit" lay-verify="required" lay-reqtext="标题不能为空" placeholder="请输入标题" value="" class="layui-input">
	        </div>
	    </div>
	    <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">通知内容</label>
            <div class="layui-input-block">
                <textarea placeholder="请输入内容" class="layui-textarea" name='nbody' id='nbody'></textarea>
            </div>
        </div>
	    <div class="layui-form-item">
	        <div class="layui-input-block">
	            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="saveBtn">确认修改</button>
	        </div>
	    </div>
	</div>
	<script src="<%=basePath %>resources/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
	<script src="<%=basePath %>resources/js/lay-config.js?v=1.0.4" charset="utf-8"></script>
	<script>
	    layui.use(['form'], function () {
	        var form = layui.form,
	            layer = layui.layer,
	            da= window.parent.data,//使用父窗口的data
	            $ = layui.$;
	        //监听提交
	        form.on('submit(saveBtn)', function (data) {
	        	$.ajax({   
	                url:'<%=basePath%>notice/update',       
	                method:'post',       
	                data:data.field,        
	                dataType:'JSON',         
	                success:function(res){       
                    	if(res=='1'){       
                    		layer.msg('修改成功');
                    		var index = parent.layer.getFrameIndex(window.name);
                    		setTimeout("parent.layer.close(index)",2000);
                    		setTimeout("window.parent.location.reload()",2000);
                        }                
                    	else            
	                    	layer.msg('修改失败，未知错误');
                        	  
                    }         
               }) ; 
	            return false;
	        });
	
	    });
	   
	</script>
</body>
</html>