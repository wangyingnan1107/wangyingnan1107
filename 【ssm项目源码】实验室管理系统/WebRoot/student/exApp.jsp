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

        <fieldset class="table-search-fieldset">
            <legend>搜索s实验</legend>
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
						    <label class="layui-form-label">教师</label>
						    <div class="layui-input-inline">
						        <input type="text" name="tname" placeholder="请输入" autocomplete="off" class="layui-input" id="demo2">
						        <input type="hidden" name="tid" id="tid">
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

        

    </div>
</div>
<script type="text/html" id="currentTableBar">
   <a class="layui-btn layui-btn-normal layui-btn-xs data-count-edit" lay-event="edit">预约</a>
</script>
<script type="text/html" id="urlTpl">
   <a href="<%=basePath%>img/experiment{{d.ehelp}}" download="{{d.ename}}实验文档">{{d.ehelp}}</a>
</script>
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
            url: '<%=basePath %>experiment/listAllEx',
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            cols: [[
                {field: 'ename', title: '实验名', sort: true},
                {field: 'edesc',  title: '实验描述'},
                {field: 'lname', title: '实验室', sort: true},
                {field: 'lphoto', title: '图片',templet:'<div><img style="width: 100px;height: 50px;border-radius:10px;" src="<%=basePath%>img/lab{{d.lphoto}}"></div>'},
                {field: 'tname', title: '教师', sort: true},
                {field: 'tphoto',title: '照片',templet:'<div><img style="width: 50px;height: 50px;border-radius:50px;" src="<%=basePath%>img/teacher{{d.tphoto}}"></div>'},
                {field: 'estime',title: '开始时间',templet:'<div>{{ layui.util.toDateString(d.estime, "yyyy-MM-dd HH:mm:ss") }}</div>', sort: true},
                {field: 'eetime',title: '结束时间',templet:'<div>{{ layui.util.toDateString(d.eeime, "yyyy-MM-dd HH:mm:ss") }}</div>', sort: true},
                {field: 'ehelp',title: '文档',templet: "#urlTpl", sort: true},
                {title: '操作', width: 70, toolbar: '#currentTableBar', align: "center"}
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
            	url: '<%=basePath %>experiment/listExSel'
                ,page: {
                    curr: 1
                }
                , where: {
                    ename: data.field.ename,
                    tid:data.field.tid
                }
            }, 'data');
            return false;
        });

        tableSelect.render({
            elem: '#demo2',
            checkedKey: 'id',
            table: {
                url: '<%=basePath %>teacher/listAllTeacher',
                cols: [[
                    { type: 'radio' },
                    {field: 'tid', title: 'id'},
                    {field: 'tname',  title: '姓名'},
                    {field: 'ttel', title: '电话'},
                    {field: 'tdesc', title: '描述'},
                    {field: 'tphoto',title: '照片', templet:'<div><img style="width: 50px;height: 50px;" src="<%=basePath%>img/teacher{{d.tphoto}}"></div>'}
                ]]
            },
            done: function (elem, data) {
                var NEWJSON = []
                layui.each(data.data, function (index, item) {
                    NEWJSON.push(item.tname);
                    $("#tid").val(item.tid);
                })
                elem.val(NEWJSON.join(","))
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