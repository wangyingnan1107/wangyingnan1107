<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>excel导出扩展分享</title>
	<link rel="stylesheet" type="text/css" href="xlsup/layui/css/layui.css">
	<style>
		.layui-container {
			padding-bottom: 50px;
		}
	</style>
	<script type="text/javascript" src="xlsup/layui/layui.js"></script>
	<script type="text/javascript">
	layui.config({
		base: 'xlsup/layui_exts/'
	}).extend({
		excel: 'excel'
	});
	</script>
	<!-- IE需要把JS放在上边，否则onclick失效 -->
	<script src="xlsup/index.js"></script>
</head>
<body>
<div class="layui-container">
	<div class="layui-row">
		<div class="layui-col-md11 layui-col-md-offset1">
			<fieldset class="layui-elem-field layui-field-title"><legend>excel导出操作演示</legend></fieldset>
			<blockquote class="layui-elem-quote">
					导出数据速度由运行的电脑性能决定，插件基于 xlsx.js 和 FileSaver，只是做了一个简单的封装。<br>
					经本人工作电脑测试，前端导出<b>纯数据 9列10w</b> 的数据量需要 <b>7秒左右</b>的时间，<b>30W数据占用1.8G，耗时24秒</b>，普通电脑<b>最多能导出50w数据，耗时45秒</b>，文件大小173M，提示内存超限<br><br>

				<b>电脑配置及系统状况：</b><br>
						CPU(占用24%)：Intel(R) Core(TM) i5-6300U CPU @ 2.40GHz <br>
						内存(占用73%)： 8.0 GB DDR3,Speed:	1600 MHz <br>
				<b>数据量测试：</b><br>
						在决定使用本插件前，请根据业务实际需求量修改『导出数据测试样例』或者『导入样例』进行浏览器压力测试，满足需求再使用本插件。<br>
						PS：效率和内存占用的问题我目前也没有好的解决方案，因为文件生成逻辑在XLSX.JS那边 <br>
				<b>非Layui框架支持：</b><br>
						通过全局变量 LAY_EXCEL 调用函数，具体可见demo，<a href="demos/noLayui/index.html">点此进入</a>

					<p style="color: #f00;margin-top: 20px;">注：不能直接在IFRAME里边直接调用导出方法，因为浏览器会限制这种导出行为，如有遇到此类情况，可使用 parent.layui.excel.exportExcel() 的方式调用父级页面函数以避免这个问题（父页面需要先加载插件）</p>
			</blockquote>
			<div class="layui-form">
				
				
				
				
				<div class="layui-form-item">
					<div class="layui-form-label">Upload模块</div>
					<div class="layui-form-block">
						<button type="button" class="layui-btn" id="LAY-excel-upload">
							<i class="layui-icon">&#xe67c;</i>上传文档
						</button>
					</div>
				</div>
				<div id="LAY-excel-demo-list-dom"></div>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/html" id="LAY-excel-export-ans">
	{{# layui.each(d.data, function(file_index, item){ }}
		<blockquote class="layui-elem-quote">{{d.files[file_index].name}}</blockquote>
		<div class="layui-tab">
		  <ul class="layui-tab-title">
		  	{{# layui.each(item, function(sheet_name, content) { }}
			    <li>{{sheet_name}}</li>
		  	{{# }); }}
		  </ul>
		  <div class="layui-tab-content">
		  	{{# layui.each(item, function(sheet_name, content) { }}
			    <div class="layui-tab-item">
						<table class="layui-table">
							{{# layui.each(content, function(row_index, value) { }}
                {{# var col_index = 0 }}
								<tr>
									{{# layui.each(value, function(col_key, val) { }}
									<td id="table-export-{{file_index}}-{{sheet_name}}-{{row_index}}-{{col_index++}}">{{val}}</td>
									{{# });}}
								</tr>
							{{# });}}
						</table>
						<pre class="layui-code">{{JSON.stringify(content, null, 2)}}</pre>
					</div>
		  	{{# }); }}
		  </div>
		</div>
	{{# }) }}
</script>

</html>
