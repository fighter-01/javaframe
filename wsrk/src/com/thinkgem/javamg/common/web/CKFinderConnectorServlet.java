/**
 * 
 */
package com.thinkgem.javamg.common.web;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.javamg.common.config.Global;
import com.thinkgem.javamg.common.utils.FileUtils;
import com.thinkgem.javamg.modules.sys.entity.User;
import com.thinkgem.javamg.modules.sys.security.SystemAuthorizingRealm.Principal;
import com.thinkgem.javamg.modules.sys.utils.UserUtils;

import com.ckfinder.connector.ConnectorServlet;

/**
 * CKFinderConnectorServlet
 * 
 * @version 2014-06-25
 */
public class CKFinderConnectorServlet extends ConnectorServlet {
	
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		prepareGetResponse(request, response, false);
		super.doGet(request, response);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		prepareGetResponse(request, response, true);
		super.doPost(request, response);
	}
	
	private void prepareGetResponse(final HttpServletRequest request,
			final HttpServletResponse response, final boolean post) throws ServletException {
		Principal principal = (Principal) UserUtils.getPrincipal();
		if (principal == null){
			return;
		}
		String command = request.getParameter("command");
		String type = request.getParameter("type");
		
		if(type.equals("files") ){
			Global.TYPE = "files";
		}
		if(type.equals("all") ){
			Global.TYPE = "all";
		}
		// 初始化时，如果startupPath文件夹不存在，则自动创建startupPath文件夹
		if ("Init".equals(command)){
			String startupPath = request.getParameter("startupPath");// 当前文件夹可指定为模块名
			if (startupPath!=null){
				String[] ss = startupPath.split(":");
				String realPath = null ;
				if (ss.length==2){
					//如果是考核资料上传
					if(type.equals("khfiles")){
						
						User user = UserUtils.getUser();
						String officeId = user.getCompany().getId();
						String id = request.getParameter("id");
						
						Global.formId = id;
						Global.TYPE = "khfiles";
						 realPath = Global.getUserfilesBaseDir() + Global.USERFILES_BASE_URL
								+ officeId +"/"+ id+"/"+ ss[0];
					}if(type.equals("oaNotifyFiles")){
						Global.TYPE = "oaNotifyFiles";
						 realPath = Global.getUserfilesBaseDir() + Global.USERFILES_BASE_URL
								+ principal + "/" + ss[0] + ss[1];
					}
					//Global.formId = id;
					//String realPath = Global.getUserfilesBaseDir() + Global.USERFILES_BASE_URL
					//		+ officeId +"/"+ id+"/"+ ss[0];
					
					FileUtils.createDirectory(FileUtils.path(realPath));
				}
			}
		}
		// 快捷上传，自动创建当前文件夹，并上传到该路径
		else if ("QuickUpload".equals(command) && type!=null){
			String currentFolder = request.getParameter("currentFolder");// 当前文件夹可指定为模块名
			//String realPath = Global.getUserfilesBaseDir() + Global.USERFILES_BASE_URL
			//		+ officeId + "/" + type + (currentFolder != null ? currentFolder : "");
			String realPath = Global.getUserfilesBaseDir() + Global.USERFILES_BASE_URL
					+ principal + "/" + type + (currentFolder != null ? currentFolder : "");

			FileUtils.createDirectory(FileUtils.path(realPath));
		}else if("FileUpload".equals(command) && type!=null){
			
		}
		System.out.println("------------------------");
		/*for (Object key : request.getParameterMap().keySet()){
			System.out.println(key + ": " + request.getParameter(key.toString()));
		}*/
	}
	
}
