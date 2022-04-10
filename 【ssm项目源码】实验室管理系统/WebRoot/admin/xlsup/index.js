/**
 * 阅读指南：
 * 导出数据测试：搜索 「exportDataByUser」关键字，找到函数即可
 * 导出接口数据：搜索「exportApiDemo」关键字，找到函数即可
 * 导出复杂表头：搜索「exportExtendDemo」关键字，找到函数即可
 * 批量设置样式：搜索「exportStyleDemo」关键字，找到函数即可
 * 简单文件导入：搜索「uploadExcel」可找到导入的处理逻辑，拖拽文件/选择文件回调获取files对象请搜索「#LAY-excel-import-excel」
 * upload模块：搜索「uploadInst」查看使用逻辑，导入相关逻辑同上
 */

layui.use(['jquery', 'layer', 'upload', 'excel', 'laytpl', 'element', 'code'], function () {
  var $ = layui.jquery;
  var layer = layui.layer;
  var upload = layui.upload;
  var excel = layui.excel;
  var laytpl = layui.laytpl;
  var element = layui.element;


  /**
   * 上传excel的处理函数，传入文件对象数组
   * @param  {FileList} files [description]
   * @return {[type]}       [description]
   */
  function uploadExcel(files) {
    try {
      excel.importExcel(files, {
      }, function (data, book) {
        layer.open({
          title: '文件转换结果啊'
          , area: ['799px', '399px']
          , tipsMore: true
          , content: laytpl($('#LAY-excel-export-ans').html()).render({data: data, files: files})
          , success: function () {
        	  alert(JSON.stringify(data))
        	  console.log(JSON.stringify(data,null,2))
//        	  $.ajax({   
//	                url:'<%=basePath%>student/addManyStudent',       
//	                method:'get',       
//	                data:data,        
//	                dataType:'JSON',         
//	                success:function(res){       
//                  	if(res=='1'){       
//                  		layer.msg('添加成功');
//                  		//setTimeout("layer.closeAll()",2000);
//                  		var index = parent.layer.getFrameIndex(window.name);
//                  		setTimeout("parent.layer.close(index)",2000);
//                  		setTimeout("window.parent.location.reload()",2000);
//                          
//                      }                
//                  	else            
//	                    	layer.msg('添加失败，未知错误');
//                      	  
//                  }         
//             }) ;   
            //element.render('tab')
            //layui.code({})
            // 处理合并
            
          }
        })
      })
    } catch (e) {
      layer.alert(e.message)
    }
  }

  //upload上传实例
  var uploadInst = upload.render({
    elem: '#LAY-excel-upload' //绑定元素
    //, url: '/upload/' //上传接口（PS:这里不用传递整个 excel）
    , auto: false //选择文件后不自动上传
    , accept: 'file'
    , choose: function (obj) {// 选择文件回调
      var files = obj.pushFile()
      var fileArr = Object.values(files)// 注意这里的数据需要是数组，所以需要转换一下

      // 用完就清理掉，避免多次选中相同文件时出现问题
      for (var index in files) {
        if (files.hasOwnProperty(index)) {
          delete files[index]
        }
      }
      $('#LAY-excel-upload').next().val('');

      uploadExcel(fileArr) // 如果只需要最新选择的文件，可以这样写： uploadExcel([files.pop()])
    }
  });

  $(function () {
    // 监听上传文件的事件
    $('#LAY-excel-import-excel').change(function (e) {
      // 注意：这里直接引用 e.target.files 会导致 FileList 对象在读取之前变化，导致无法弹出文件
      var files = Object.values(e.target.files)
      uploadExcel(files)
      // 变更完清空，否则选择同一个文件不触发此事件
      e.target.value = ''
    })
    // 文件拖拽
    document.body.ondragover = function (e) {
      e.preventDefault()
    }
    document.body.ondrop = function (e) {
      e.preventDefault()
      var files = e.dataTransfer.files
      uploadExcel(files)
    }
    // 2019-08-17 页面直接展示所有demo
    renderDemoList()

  })
})




