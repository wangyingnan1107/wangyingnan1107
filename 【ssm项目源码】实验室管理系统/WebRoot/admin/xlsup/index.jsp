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
	<title>excel导出扩展分享</title>
	<link rel="stylesheet" type="text/css" href="layui/css/layui.css">
	<style>
		.layui-container {
			padding-bottom: 50px;
		}
	</style>
	<script type="text/javascript" src="layui/layui.js"></script>
	<script type="text/javascript">
	layui.config({
		base: 'layui_exts/'
	}).extend({
		excel: 'excel'
	});
	</script>
	<!-- IE需要把JS放在上边，否则onclick失效 -->
	<script src="./index.js"></script>
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
					<div class="layui-form-label">导出操作</div>
					<div class="layui-form-block">
						<button type="button" class="layui-btn layui-btn-primary" onclick="exportDataByUser()">导出数据测试</button>
						<button type="button" class="layui-btn layui-btn-primary" onclick="exportApiDemo('./list.json')">导出接口数据</button>
						<button type="button" class="layui-btn layui-btn-primary" onclick="exportExtendDemo()">导出复杂表头</button>
						<button type="button" class="layui-btn layui-btn-primary" onclick="exportStyleDemo()">批量设置样式</button>
						<!--<button type="button" class="layui-btn layui-btn-primary" onclick="exportBorderDemo()">快速设置边框</button>-->
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-form-label">导入模板</div>
					<div class="layui-form-block">
						<a class="layui-btn layui-btn-primary" href="demos/test_import.xlsx">常规单元格数据</a>
						<a class="layui-btn layui-btn-primary" href="demos/test_merge.xlsx">合并单元格数据</a>
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-form-label">导入操作</div>
					<div class="layui-form-block">
						<input type="file" class="layui-btn layui-btn-primary" id="LAY-excel-import-excel" multiple="multiple">
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-form-label"></div>
					<div class="layui-form-block">
						<p class="help-block" style="color: #f00;">高级浏览器可以在本页面上直接将文件拖入</p>
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-form-label">Upload模块</div>
					<div class="layui-form-block">
						<button type="button" class="layui-btn" id="LAY-excel-upload">
							<i class="layui-icon">&#xe67c;</i>上传文档
						</button>
					</div>
				</div>
				<!--<div class="layui-form-item">-->
					<!--<div class="layui-form-label">使用样例</div>-->
					<!--<div class="layui-form-block">-->
						<!--<button type="button" class="layui-btn layui-btn-primary" onclick="demoList()">查看样例列表</button>-->
					<!--</div>-->
				<!--</div>-->
				<div class="layui-form-item">
					<div class="layui-form-label">更新及文档</div>
					<div class="layui-form-block">
						<a class="layui-btn layui-btn-primary" target="_blank" href="https://fly.layui.com/jie/46036/">社区原帖</a>
						<a class="layui-btn layui-btn-primary" target="_blank" href="http://excel.wj2015.com/_book/">在线文档</a>
						<a class="layui-btn layui-btn-primary" target="_blank" href="https://github.com/wangerzi/layui-excel">最新源码·github</a>
						<a class="layui-btn layui-btn-primary" target="_blank" href="https://gitee.com/wangerzi/layui-excel">备选源码·码云</a>
						<a class="layui-btn layui-btn-primary" target="_blank" href="http://mail.qq.com/cgi-bin/qm_share?t=qm_mailme&email=zfT5_fv19fn1-428vOOuoqA">邮件反馈</a>
						<button type="button" class="layui-btn layui-btn-primary" onclick="groupAdd()">加群交流</button>
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
<!-- 加群交流layer模板 -->
<script type="text/html" id="LAY-excel-group-add">
<!-- <fieldset class="layui-elem-field layui-field-title">
	<legend>加群交流</legend>
</fieldset>
--><p style="text-align: center;"><b>群号：</b>555056599，<a href="https://jq.qq.com/?_wv=1027&k=5uMuyRD" target="_blank">点我加群</a></p>
<img alt="QQ群二维码" src="https://raw.githubusercontent.com/wangerzi/layui-excel/master/qq_group_qrcode.png" style="max-width: 100%;display:block;margin: 0 auto;">
</script>
<!--demo列表模板-->
<script type="text/html" id="LAY-excel-demo-list">
<table class="layui-table">
	<thead>
	<tr>
		<td>样例描述</td>
		<td>样例路径 <b style="color: #f00;">(可点击跳转)</b></td>
		<td>贡献人</td>
	</tr>
	</thead>
	<tbody>
  {{# layui.each(d.list, function(index, value) { }}
	<tr>
		<td>{{value.desc}}</td>
		<td><a href="{{value.href}}" target="_blank">{{value.path}}</a></td>
		<td>{{value.person}}({{value.email}})</td>
	</tr>
	{{# });}}
	</tbody>
</table>
</script>
</html>
