/**  
 * @Description:TODO:
 * @Title:  FileUploadUtil.java   
 * @Package com.icss.util   
 * @author: WallE     
 * @date:   2019年9月24日 下午3:43:04   
 */
package com.walle.util;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

/**
 * 文件上传工具类
 * 
 * @author WallE
 */
public class FileUploadUtil {

	/*
	 * 上传文件
	 */
	public static String upload(MultipartFile f, String path) throws IllegalStateException, IOException {
		String fileName = null;
		// 获取原始文件名
		String uploadFileName = f.getOriginalFilename();
		// 为了避免文件名重复获取uuid
		String uuid = UUID.randomUUID().toString().replace("-", "").toUpperCase();
		// 拼接文件名
		fileName = uuid + uploadFileName;
		// 判断文件路径是否存在
		File file = new File(path);
		if (!file.exists()) {
			//不存在创建文件夹
			file.mkdirs();
		}
		f.transferTo(new File(path, fileName));
		return fileName;

	}

}
