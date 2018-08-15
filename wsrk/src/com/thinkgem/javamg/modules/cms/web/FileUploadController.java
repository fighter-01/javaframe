/**
 * 
 */
package com.thinkgem.javamg.modules.cms.web;



import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;



import com.thinkgem.javamg.common.config.Global;
import com.thinkgem.javamg.common.web.BaseController;
import com.thinkgem.javamg.modules.cms.entity.CommentMessage;
import com.thinkgem.javamg.modules.cms.service.CommentMessageService;
import com.thinkgem.javamg.modules.cms.service.ReportService;
import com.thinkgem.javamg.modules.cms.utils.CmsUtils;

/**
 * 推送Controller
 * 
 * @version 2013-3-23
 */
@Controller
@RequestMapping(value = "${adminPath}/mobile/file")
public class FileUploadController extends BaseController {
	
	/**
	 * 文件上传接口
	 * @param report
	 * @param model
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "fileUpload", method = RequestMethod.POST)
	@ResponseBody
	public String fileUpload(MultipartHttpServletRequest request,HttpServletResponse response) {
		Map<String, Object> rtnMap = new LinkedHashMap<String, Object>();
		System.out.println("--->uploadFile");
		//1、此种方式不需要知道input的name值----下面方法2的“file”值，方法1不需要知道是多少
		MultiValueMap<String,MultipartFile> multiMap = request.getMultiFileMap();
		String savePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/javamg/uploadfile/";
		
		Set<String> keys = multiMap.keySet();
		List<String> rtnUrl = new ArrayList<String>();
		for (String key:keys) {
			List<MultipartFile> mutiFile = multiMap.get(key);
			rtnUrl = writeFileToDisk(mutiFile,savePath);
		}
		rtnMap.put("code", 0);
		rtnMap.put("message", "文件上传成功");
		rtnMap.put("data", rtnUrl);
		return renderString(response, rtnMap);
	}
	
	private List writeFileToDisk(List<MultipartFile> fileList,String url) {
		List<String> imgUrls = new ArrayList<String>();
		for (MultipartFile file : fileList) {
			InputStream is = null;
			FileOutputStream fos = null;
			try {
			System.out.println("--->"+file.getSize());
				is =  file.getInputStream();
				String[] s = file.getOriginalFilename().split("\\.");
				String uri = System.currentTimeMillis()+"."+s[1];
				fos = new FileOutputStream(Global.getUserfilesBaseDir()+"uploadfile\\"+uri);
				
				byte[] buffer = new byte[1024];
				int len=0;
				while ((len = is.read(buffer)) != -1) {
					fos.write(buffer, 0, len);
				} 
				fos.flush();
				imgUrls.add(url+uri);
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				try {
					if (fos != null) {
						fos.close();
					}
					if (is != null) {
						is.close();
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
				
			}
		}
		return imgUrls;
	}
	
}
