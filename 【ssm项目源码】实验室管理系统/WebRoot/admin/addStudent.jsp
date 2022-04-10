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
    <title>编辑学生</title>
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
        <label class="layui-form-label required">学号</label>
        <div class="layui-input-block">
            <input id="sno" type="text" name="sno" lay-verify="required" lay-reqtext="用户名不能为空" placeholder="请输入用户名" value="" class="layui-input">
        </div>
    </div>
   
    <div class="layui-form-item">
	    <label class="layui-form-label">班级</label>
	    <div class="layui-input-block">
	        <input type="text" name="cid" placeholder="请输入" autocomplete="off" class="layui-input" id="demo2">
	    </div>
     </div>
    <div class="layui-form-item">
        <label class="layui-form-label required">姓名</label>
        <div class="layui-input-block">
            <input id="sname" type="text" name="sname" lay-verify="required" lay-reqtext="用户名不能为空" placeholder="请输入用户名" value="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required">电话</label>
        <div class="layui-input-block">
            <input id="stel" type="number" name="stel" lay-verify="required" lay-reqtext="手机不能为空" placeholder="请输入手机" value="" class="layui-input">
        </div>
    </div>
   
    <div class="layui-form-item">
        <label class="layui-form-label required">性别</label>
        <div class="layui-input-block ssex">
            <input  type="radio" name="ssex" value="男" title="男" checked="">
            <input  type="radio" name="ssex" value="女" title="女">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required">图片</label>
        <input id="sphoto" type="hidden" name="sphoto" class="image">
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
    layui.use(['form','upload','tableSelect'], function () {
        var form = layui.form,
            layer = layui.layer,
            upload = layui.upload,
            tableSelect = layui.tableSelect,
            $ = layui.$,
            da= window.parent.data;//使用父窗口的data
        var uploadInst = upload.render({
            elem: '#test1'
            ,url: '<%=basePath%>student/upload' //改成您自己的上传接口
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

        //监听提交
        form.on('submit(saveBtn)', function (data) {
            /* var index = layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            }, function () {
                // 关闭弹出层
                layer.close(index);
                var iframeIndex = parent.layer.getFrameIndex(window.name);
                parent.layer.close(iframeIndex);
            }); */
            <%-- $.ajax({
		          url: '<%=basePath%>student/update',
		          type: "POST",
		          async: false,
		          data: {
		        	  /* sno:$('#sno').val(),
		        	  sname:$('#sname').val(),
		        	  cid:$('#demo2').val(),
		        	  stel:$('#stel').val(),
		        	  ssex:$('#stel').val()
		        	  sphoto:$('#sphoto').val() */
		          },
		          dataType: 'HTML',
		         success: function (data) {
			         if(data=='1'){
			        	 layer.msg('注册成功，请尽快登录并完善信息');
						 setTimeout("layer.closeAll()",2000);
				     }else{
				    	 layer.msg('注册失败，未知错误');
					     }
		          } 
		      }); --%>
		      $.ajax({   
	                url:'<%=basePath%>student/addStudent',       
	                method:'post',       
	                data:data.field,        
	                dataType:'JSON',         
	                success:function(res){       
                    	if(res=='1'){       
                    		layer.msg('添加成功');
                    		//setTimeout("layer.closeAll()",2000);
                    		var index = parent.layer.getFrameIndex(window.name);
                    		setTimeout("parent.layer.close(index)",2000);
                    		setTimeout("window.parent.location.reload()",2000);
                            
                        }                
                    	else            
	                    	layer.msg('添加失败，未知错误');
                        	  
                    }         
               }) ;         
	                
	           
            return false;
        });

    });
   
</script>
</body>
</html>