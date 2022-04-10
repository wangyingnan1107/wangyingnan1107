<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>分步表单</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="<%=basePath %>resources/lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=basePath %>resources/css/public.css" media="all">
    <link rel="stylesheet" href="<%=basePath %>resources/js/lay-module/step-lay/step.css" media="all">
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">

        <div class="layui-fluid">
            <div class="layui-card">
                <div class="layui-card-body" style="padding-top: 40px;">
                    <div class="layui-carousel" id="stepForm" lay-filter="stepForm" style="margin: 0 auto;">
                        <div carousel-item>
                            <div>
                                <form class="layui-form" style="margin: 0 auto;max-width: 460px;padding-top: 40px;">
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">实验名:</label>
                                        <div class="layui-input-block">
                                            <input type="text" id="ename" name="ename" placeholder="请填写入实验名" class="layui-input" lay-verify="required" required />

                                        </div>
                                    </div>
                                    
                                    <div class="layui-form-item">
									    <label class="layui-form-label">实验时间</label>
									    <div class="layui-input-block">
									    	<input type="text" name="etime" class="layui-input" id="test1" placeholder="~">
									    </div>
								    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">实验说明:</label>
                                        <div class="layui-input-block">
                                            <textarea name="edesc" id="edesc" placeholder="实验说明" value="" class="layui-textarea"></textarea>
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <div class="layui-input-block">
                                            <button class="layui-btn" lay-submit lay-filter="formStep">
                                                &emsp;下一步&emsp;
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div>
                                <form class="layui-form" style="margin: 0 auto;max-width: 460px;padding-top: 40px;">
						        <input type="hidden" name="tid2" id="tid2" value='${ teacher.tid}'>
						        <input type="hidden" name="tname2" id="tname2" value='${ teacher.tname}'>
						        <input type="hidden" name="ename2" id="ename2">
						        <input type="hidden" name="edesc2" id="edesc2">
						        <input type="hidden" name="etime2" id="etime2">
						        <input type="hidden" name="lid2" id="lid2">
						        <input type="hidden" name="did2" id="did2">
						        <input type="hidden" name="dnum2" id="dnum2">
                                
                                	<div class="layui-form-item">
									    <label class="layui-form-label">实验室</label>
									    <div class="layui-input-block">
									        <input type="text" name="lname" placeholder="请输入" autocomplete="off" class="layui-input" id="demo2" lay-verify="required">
									    </div>
								     </div>
                                	<div class="layui-form-item">
									    <label class="layui-form-label">设备申请</label>
									    <div class="layui-input-block">
									        <input type="text" name="dname" placeholder="请输入" autocomplete="off" class="layui-input" id="demo1" >
									    </div>
								     </div>
								     
								     <div class="layui-form-item">
									    <label class="layui-form-label">设备数量</label>
									    <div class="layui-input-block">
									   	 <div id="slideTest8" class="demo-slider" style="top: 16px"></div>
									    </div>
								     </div>
                                    <div class="layui-form-item">
                                        <div class="layui-input-block">
                                            <button type="button" class="layui-btn layui-btn-primary pre">上一步</button>
                                            <button class="layui-btn" lay-submit lay-filter="formStep2">
                                                &emsp;提交&emsp;
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div>
                                <div style="text-align: center;margin-top: 90px;">
                                    <i class="layui-icon layui-circle"
                                       style="color: white;font-size:30px;font-weight:bold;background: #52C41A;padding: 20px;line-height: 80px;">&#xe605;</i>
                                    <div style="font-size: 24px;color: #333;font-weight: 500;margin-top: 30px;">
                                        申请已提交
                                    </div>
                                    <div style="font-size: 14px;color: #666;margin-top: 20px;">请等待管理员审核</div>
                                </div>
                                <div style="text-align: center;margin-top: 50px;">
                                    <button class="layui-btn next">再次申请</button>
                                    <button class="layui-btn layui-btn-primary">查看状态</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div style="color: #666;margin-top: 30px;margin-bottom: 40px;padding-left: 30px;">
                        <h3>说明</h3><br>
                        <h4>首先填写基础信息</h4>
                        <p>基础信息包括实验名以及实验描述和实验时间段</p>
                        <br><h4>实验室及设备申请</h4>
                        <p>实验室为必填项，设备可按需申请，若不需要不必填写</p>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<script src="<%=basePath %>resources/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script src="<%=basePath %>resources/js/lay-config.js?v=1.0.4" charset="utf-8"></script>
<script>
    layui.use([ 'form', 'step','laydate','tableSelect','slider'], function () {
        var $ = layui.$,
            form = layui.form,
            tableSelect = layui.tableSelect,
            step = layui.step,
            slider = layui.slider,
            laydate = layui.laydate;
      //日期时间范围
        laydate.render({
          elem: '#test1'
          ,type: 'datetime'
          ,range: '~'
        });
		
      
        

        
        step.render({
            elem: '#stepForm',
            filter: 'stepForm',
            width: '100%', //设置容器宽度
            stepWidth: '750px',
            height: '500px',
            stepItems: [{
                title: '填写基本信息'
            }, {
                title: '确认实验室及设备需求'
            }, {
                title: '完成'
            }]
        });


        form.on('submit(formStep)', function (data) {
            step.next('#stepForm');
            $("#etime2").val(data.field.etime);
            $("#ename2").val(data.field.ename);
            $("#edesc2").val(data.field.edesc);
            etime=data.field.etime;
            console.log(data);
            console.log(etime);
			//渲染实验室下拉选择框的数据
            tableSelect.render({
                elem: '#demo2',
                checkedKey: 'id',
                table: {
                    url: '<%=basePath %>lab/listUnusedLab',
                    where:{
    					time:$("#test1").val()
                        }
                    ,cols: [[
                        { type: 'radio' },
                        {field: 'lid', title: 'id'},
                        {field: 'lname',  title: '名字'},
                        {field: 'ldesc', title: '描述'},
                        {field: 'lphoto', title: '照片'}
                    ]]
                },
                done: function (elem, data) {
                    var NEWJSON = []
                    layui.each(data.data, function (index, item) {
                        NEWJSON.push(item.lname);
                        $("#lid2").val(item.lid);
                        
                    })
                    elem.val(NEWJSON.join(","))
                }
            });
			//渲染设备下拉选择框的数据
			tableSelect.render({
                elem: '#demo1',
                checkedKey: 'did',
                table: {
                    url: '<%=basePath %>device/listUnusedDevice',
                    where:{
    					time:$("#test1").val()
                        }
                    ,cols: [[
                        { type: 'radio' },
                        {field: 'did', title: 'did'},
                        {field: 'dname',  title: '设备名'},
                        {field: 'ddesc', title: '设备描述'},
                        {field: 'dnum', title: '设备可用数量'}
                    ]]
                },
                done: function (elem, data) {
                    var NEWJSON = []
                    layui.each(data.data, function (index, item) {
                        NEWJSON.push(item.dname);
                        $("#did2").val(item.did);
                      //开启输入框
                        slider.render({
                        	elem: '#slideTest8'
                        	,min: 1
                        	,max: item.dnum
                        	,input: true //输入框
                        	,change: function(vals){
                        		$("#dnum2").val(vals);
                        	}
                        });
                    })
                    elem.val(NEWJSON.join(","))
                }
            });


            
            return false;
        });

        form.on('submit(formStep2)', function (data) {
        	console.log(data)
        	$.ajax({   
                url:'<%=basePath%>experiment/apply',       
                method:'post',       
                data:data.field,        
                dataType:'JSON',         
                success:function(res){       
                	if(res=='1'){       
                		layer.msg('申请成功');
                		step.next('#stepForm');
                    }                
                	else            
                    	layer.msg('申请失败，未知错误，请稍后重试！');
                    	  
                }         
           }) ;
            
            //console.log($("#slideTest8").text()||"0")
            
            return false;
        });

        $('.pre').click(function () {
            step.pre('#stepForm');
        });

        $('.next').click(function () {
            step.next('#stepForm');
        });
    })
</script>
</body>
</html>