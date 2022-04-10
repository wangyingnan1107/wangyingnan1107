<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>实验详细</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="<%=basePath %>resources/lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=basePath %>resources/lib/font-awesome-4.7.0/css/font-awesome.min.css" media="all">
    <link rel="stylesheet" href="<%=basePath %>resources/css/public.css" media="all">
    <link href="<%=basePath %>resources/css/article.css" rel="stylesheet" />
    <link href="<%=basePath %>resources/plug/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <link href="<%=basePath %>resources/css/global.css" rel="stylesheet" />
    <!-- 本页样式表 -->
    <link href="<%=basePath %>resources/css/detail.css" rel="stylesheet" />
    <style>
        .layui-card {border:1px solid #f2f2f2;border-radius:5px;}
        .icon {margin-right:10px;color:#1aa094;}
        .icon-cray {color:#ffb800!important;}
        .icon-blue {color:#1e9fff!important;}
        .icon-tip {color:#ff5722!important;}
        .layuimini-qiuck-module {text-align:center;margin-top: 10px}
        .layuimini-qiuck-module a i {display:inline-block;width:100%;height:60px;line-height:60px;text-align:center;border-radius:2px;font-size:30px;background-color:#F8F8F8;color:#333;transition:all .3s;-webkit-transition:all .3s;}
        .layuimini-qiuck-module a cite {position:relative;top:2px;display:block;color:#666;text-overflow:ellipsis;overflow:hidden;white-space:nowrap;font-size:14px;}
        .welcome-module {width:100%;height:210px;}
        .panel {background-color:#fff;border:1px solid transparent;border-radius:3px;-webkit-box-shadow:0 1px 1px rgba(0,0,0,.05);box-shadow:0 1px 1px rgba(0,0,0,.05)}
        .panel-body {padding:10px}
        .panel-title {margin-top:0;margin-bottom:0;font-size:12px;color:inherit}
        .label {display:inline;padding:.2em .6em .3em;font-size:75%;font-weight:700;line-height:1;color:#fff;text-align:center;white-space:nowrap;vertical-align:baseline;border-radius:.25em;margin-top: .3em;}
        .layui-red {color:red}
        .main_btn > p {height:40px;}
        .layui-bg-number {background-color:#F8F8F8;}
        .layuimini-notice:hover {background:#f6f6f6;}
        .layuimini-notice {padding:7px 16px;clear:both;font-size:12px !important;cursor:pointer;position:relative;transition:background 0.2s ease-in-out;}
        .layuimini-notice-title,.layuimini-notice-label {
            padding-right: 70px !important;text-overflow:ellipsis!important;overflow:hidden!important;white-space:nowrap!important;}
        .layuimini-notice-title {line-height:28px;font-size:14px;}
        .layuimini-notice-extra {position:absolute;top:50%;margin-top:-8px;right:16px;display:inline-block;height:16px;color:#999;}
    </style>
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">
        <div class="layui-row layui-col-space15">
            <div class="layui-col-md9">
	            <div class="layui-row layui-col-space15">
	                <div class="layui-col-md12">
	                	<div class="layui-card">
		                    <div class="layui-card-header"><i class="fa fa-paper-plane-o icon"></i>实验文档</div>
		                    <div class="layui-card-body layui-text layadmin-text pdff">
		                    	<!-- <object data="http://localhost:8080/LIMS_SSM/img/experiment" type="application/pdf" width="100%" height="500px">
								    <embed src="http://localhost:8080/LIMS_SSM/img/experiment" type="application/pdf">
								        <p>This browser does not support PDFs. Please download the PDF to view it: <a href="http://localhost:8080/LIMS_SSM/img/experiment">Download PDF</a>.</p>
								    </embed>
								</object> -->
		                    </div>
		                </div>
	                </div>
	                <div class="layui-col-md12">
		            	<div class="layui-card">
		                    <div class="layui-card-header"><i class="fa fa-paper-plane-o icon"></i>评论区域</div>
		                    <div class="layui-card-body">
		                    	<div class="blog-module shadow" style="box-shadow: 0 1px 8px #a6a6a6;">
		                        <fieldset class="layui-elem-field layui-field-title" style="margin-bottom:0">
		                            <div class="layui-field-box">
		                                <form class="layui-form blog-editor" action="">
		                                    <div class="layui-form-item">
		                                        <textarea name="editorContent" lay-verify="content" id="remarkEditor" placeholder="请输入内容" class="layui-textarea layui-hide"></textarea>
		                                    </div>
		                                    <div class="layui-form-item">
		                                        <button class="layui-btn" lay-submit="formRemark" lay-filter="formRemark">提交评论</button>
		                                    </div>
		                                </form>
		                            </div>
		                        </fieldset>
		                        <div class="blog-module-title">最新评论</div>
		                        <ul class="blog-comment">
		                           <!--  <li>
		                                <div class="comment-parent">
		                                    <img src="http://localhost:8080/LIMS_SSM/img/lab/images/2020-05-06/e9c0fe26-0fca-4d7b-9428-df24abba9712.jpg" alt="absolutely" />
		                                    <div class="info">
		                                        <span class="username">Absolutely</span>
		                                        <span class="time">2017-03-18 18:46:06</span>
		                                    </div>
		                                    <div class="content">
		                                        我为大家做了模拟评论功能！还有，这个评论功能也可以改成和留言一样，但是目前没改，有兴趣可以自己改
		                                    </div>
		                                </div>
		                            </li> -->
		                        </ul>
		                    </div>
		                    </div>
		                </div>
		            
		            </div>
	            </div>
            </div >
            <div class="layui-col-md3">
            	
				<div class="layui-card" >
	                   <div class="layui-card-header"><i class="fa fa-bullhorn icon icon-tip"></i>实验信息</div>
	                   <div class="layui-card-body layui-text">
	                   		<h3>实验名:</h3>
	                   		<p id="ename"></p>
	                   		<hr class="layui-bg-green">
	                   		<h3>实验描述：</h3>
	                   		<p id="edesc"></p>
	                   		<hr class="layui-bg-green">
	                   		<h3>实验室：</h3>
	                   		<p id="lname"></p>
	                   		<img alt="图片不见了" src="" id="lphoto" style="width: 100px;height: 100px;padding-left: 20px">
	                   		<hr class="layui-bg-green">
	                   		<h3>教师：</h3>
	                   		<p id="tname"></p>
	                   		<img alt="图片不见了" src="" id="tphoto" style="width: 100px;height: 100px;padding-left: 20px">
	                   		<hr class="layui-bg-green">
	                   		<h3>实验时间：</h3>
	                   		<p id="etime"></p>
	                   		<hr class="layui-bg-green">
	                   		<button type="button" class="layui-btn layui-btn-radius" id="yuyue">预约实验</button>
	                   </div>
	               </div>
          
            
            </div>
            
        </div>
    </div>
</div>
<!-- 底部 -->
    <footer class="blog-footer">
        <p>实验室管理系统</p>
        <p>兰州理工大学-李俊杰</a></p>
    </footer>
<script>
WIDGET = {ID: 'AV38ZRzDCZ'};
</script>
<script type="text/javascript" src="https://apip.weatherdt.com/view/static/js/r.js?v=1111"></script>
<script src="<%=basePath %>resources/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script src="<%=basePath %>resources/js/lay-config.js?v=1.0.4" charset="utf-8"></script>
<!-- 自定义全局脚本 -->
<script src="<%=basePath %>resources/js/global.js"></script>
<!-- 本页脚本 -->
<script src="<%=basePath %>resources/js/detail.js"></script>
<script type="text/javascript">


layui.use(['form', 'layedit'], function () {
    var form = layui.form;
    var $ = layui.jquery;
    var layedit = layui.layedit;
    var mmsg='',
    	msg='';
    //点击预约实验事件
    $("#yuyue").click(function(){
		//layer.msg("点击事件");
    	$.ajax({
    	    url:'<%=basePath%>experiment/isYuyue?eid=${param.eid }&sid=${student.sno}',      
    	    type:"GET",
    	    data:{
    	    },         
    	   	success:function(res){
    	   		if(res=='1'){
    				layer.confirm('是否预约?', function (index) {
    	            	$.ajax({
    	                    url: '<%=basePath%>experiment/yuyue?eid=${param.eid }&sid=${student.sno}',
    	                    type: "GET",
    	                    async: false,
    	                    data: {
    	                    },
    	                    dataType: 'HTML',
    	                   	success: function (data) {
    	                       msg = data;
    	                    } 
    	                });
    	     		   if(msg=='1'){
    	     			   layer.msg('预约成功', { icon: 1, time: 1500 }, function () {
    	                        obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
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
		

		
	});
    
    
    //ajax异步加载界面信息
    $.ajax({
	    url:'<%=basePath%>experiment/exmsg?eid=${param.eid }',      
	    type:"post",
	    data:{
	    },         
	   	success:function(res){
	        console.log(res);
			var html='<object data="http://localhost:9001/LIMS_SSM/img/experiment'+res.el.ehelp+'" type="application/pdf" width="100%" height="500px">'+
			    		'<embed src="http://localhost:9001/LIMS_SSM/img/experiment'+res.el.ehelp+'" type="application/pdf">'+
	        				'<p>This browser does not support PDFs. Please download the PDF to view it: <a href="http://localhost:9001/LIMS_SSM/img/experiment'+res.el.ehelp+'">Download PDF</a>.</p>'+
	    				'</embed>'+
					'</object>';
			$('.pdff').append(html);
			$('#ename').html('&nbsp;&nbsp;&nbsp;&nbsp;'+res.el.ename);
			$('#edesc').html('&nbsp;&nbsp;&nbsp;&nbsp;'+res.el.edesc);
			$('#lname').html('&nbsp;&nbsp;&nbsp;&nbsp;'+res.el.lname);
			$('#lphoto').attr('src','<%=basePath%>img/lab'+res.el.lphoto);
			$('#tname').html('&nbsp;&nbsp;&nbsp;&nbsp;'+res.el.tname);
			$('#tphoto').attr('src','<%=basePath%>img/lab'+res.el.tphoto);
			$('#etime').html('&nbsp;&nbsp;&nbsp;&nbsp;'+layui.util.toDateString(res.el.estime, "yyyy-MM-dd HH:mm:ss")+' ~ '+layui.util.toDateString(res.el.eetime, "yyyy-MM-dd HH:mm:ss"));
	        
	    }  
	       
     });
    //ajax异步加载评论
    $.ajax({
	    url:'<%=basePath%>message/listMsg?eid=${param.eid }',      
	    type:"post",
	    data:{
		    
	    },         
	   	success:function(res){
	        console.log(res);
	        for(var i=0;i<res.mes.length;i++){
	            var html = '<li><div class="comment-parent"><img src="http://localhost:9001/LIMS_SSM/img/student'+res.mes[i].uphoto+'" alt="丢啦"/><div class="info"><span class="username">'+res.mes[i].uname+'</span><span class="time">'+layui.util.toDateString(res.mes[i].mtime, "yyyy-MM-dd HH:mm:ss")+'</span></div><div class="content">' + res.mes[i].mbody + '</div></div></li>';
	            $('.blog-comment').append(html);
	        }
	    }  
	       
     });

    //评论和留言的编辑器
    var editIndex = layedit.build('remarkEditor', {
        height: 150,
        tool: ['face', '|', 'left', 'center', 'right', '|', 'link'],
    });
    //评论和留言的编辑器的验证
    layui.form.verify({
        content: function (value) {
            value = $.trim(layedit.getText(editIndex));
            if (value == "") return "自少得有一个字吧";
            layedit.sync(editIndex);
        }
    });

    //监听评论提交
    form.on('submit(formRemark)', function (data) {
        var index = layer.load(1);
        $.ajax({
    	    url:'<%=basePath%>message/addMessage?eid=${param.eid }&sname=${student.sname}&sphoto=${student.sphoto}',      
    	    type:"get",
    	    data:{
        	    mbody: data.field.editorContent
    	    },         
    	   	success:function(res){
    	        console.log(res);
    	        
    	    }  
    	       
          });



        
        //模拟评论提交
        setTimeout(function () {
            layer.close(index);
            
            var content = data.field.editorContent;
            var html = '<li><div class="comment-parent"><img src="http://localhost:9001/LIMS_SSM/img/student${student.sphoto}" alt="${student.sname}"/><div class="info"><span class="username">${student.sname}</span><span class="time">'+layui.util.toDateString(new Date(), "yyyy-MM-dd HH:mm:ss")+'</span></div><div class="content">' + content + '</div></div></li>';
            $('.blog-comment').append(html);
            $('#remarkEditor').val('');
            
            editIndex = layui.layedit.build('remarkEditor', {
                height: 150,
                tool: ['face', '|', 'left', 'center', 'right', '|', 'link'],
            });
            layer.msg("评论成功", { icon: 1 });
        }, 500);
        return false;
    });
});









</script>
</body>
</html>
