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
    <meta charset="UTF-8">
    <title>发布通知</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="<%=basePath %>resources/css/oksub.css">
</head>
<body>








    <div class="ok-body">
        <div id="editor"></div>
        <br/>
        <button type="button" class="layui-btn" onclick="setContent()">设置内容</button>
        <button type="button" class="layui-btn" onclick="appendContent()">追加内容</button>
        <button type="button" class="layui-btn" onclick="clearContent()">清空内容</button>
        <button type="button" class="layui-btn" onclick="getHtmlContent()">获取HTML内容</button>
        <button type="button" class="layui-btn" onclick="getTextContent()">获取TEXT内容</button>
    </div>
    <script src="<%=basePath %>resources/lib/wangEditor/release/wangEditor.min.js"></script>
    <script type="text/javascript">
        let E = window.wangEditor;
        let editor = new E("#editor");
        editor.create();

        function setContent() {
            editor.txt.html("<p>欢迎使用 <b>ok-admin v2.0</b> :) </p>");
        }

        function appendContent() {
            editor.txt.append("<p>追加的内容</p>");
        }

        function clearContent() {
            editor.txt.clear();
        }

        function getHtmlContent() {
            alert(editor.txt.html());
        }

        function getTextContent() {
            alert(editor.txt.text());
        }
    </script>
</body>
</html>
