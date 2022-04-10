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
    <title>编辑实验室</title>
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
        <label class="layui-form-label required">id</label>
        <div class="layui-input-block">
            <input id="lid" readonly="readonly" type="text" name="lid" lay-verify="required" lay-reqtext="不能为空" placeholder="请输入" value="" class="layui-input">
        </div>
    </div>
   
    <div class="layui-form-item">
        <label class="layui-form-label required">名字</label>
        <div class="layui-input-block">
            <input id="lname" type="text" name="lname" lay-verify="required" lay-reqtext="不能为空" placeholder="请输入" value="" class="layui-input">
        </div>
    </div>
   	<div class="layui-form-item layui-form-text">
         <label class="layui-form-label">描述</label>
         <div class="layui-input-block">
             <textarea placeholder="请输入内容" class="layui-textarea" name='ldesc' id='ldesc'></textarea>
         </div>
     </div>
   
    <div class="layui-form-item">
        <label class="layui-form-label required">图片</label>
        <input id="lphoto" type="hidden" name="lphoto" class="image">
        <div class="layui-upload">
		  <button type="button" class="layui-btn" id="test1">上传图片</button>
		  <div class="layui-upload-list">
		    <img style="width: 70px;height: 70px;padding-left: 160px" class="layui-upload-img" id="demo1">
		    <p id="demoText"></p>
		  </div>
		</div>  
    </div>
    
    

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="saveBtn">确认保存</button>
        </div>
    </div>
</div>
<script src="<%=basePath %>resources/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script src="<%=basePath %>resources/js/lay-config.js?v=1.0.4" charset="utf-8"></script>
<script>
    layui.use(['form','upload'], function () {
        var form = layui.form,
            layer = layui.layer,
            upload = layui.upload,
            $ = layui.$,
            da= window.parent.data;//使用父窗口的data
            $('#demo1').attr('src', '<%=basePath%>img/lab'+da.lphoto);
        var uploadInst = upload.render({
            elem: '#test1'
            ,url: '<%=basePath%>lab/upload' //改成您自己的上传接口
            ,before: function(obj){
              //预读本地文件示例，不支持ie8
              obj.preview(function(index, file, result){
                $('#demo1').attr('src', result); //图片链接（base64）
              });
            }
            ,done: function(res){
              //如果上传失败
              if(res.code > 0){
                return layer.msg('上传失败');
              }
              //上传成功
              var fileupload = $(".image");
              fileupload.attr("value",res.data.src);
              console.log(fileupload.attr("value"));
            }
            ,error: function(){
              //演示失败状态，并实现重传
              var demoText = $('#demoText');
              demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
              demoText.find('.demo-reload').on('click', function(){
                uploadInst.upload();
              });
            }
          });

        //监听提交
        form.on('submit(saveBtn)', function (data) {
		      $.ajax({   
	                url:'<%=basePath%>lab/updateLab',       
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