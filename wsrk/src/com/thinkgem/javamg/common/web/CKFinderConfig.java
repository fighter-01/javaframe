/**
 * 
 */
package com.thinkgem.javamg.common.web;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;

import com.thinkgem.javamg.common.config.Global;
import com.thinkgem.javamg.common.utils.FileUtils;
import com.thinkgem.javamg.modules.sys.entity.User;
import com.thinkgem.javamg.modules.sys.security.SystemAuthorizingRealm.Principal;
import com.thinkgem.javamg.modules.sys.utils.UserUtils;

import com.ckfinder.connector.configuration.Configuration;
import com.ckfinder.connector.data.AccessControlLevel;
import com.ckfinder.connector.utils.AccessControlUtil;

/**
 * CKFinder配置
 * 
 * @version 2014-06-25
 */
public class CKFinderConfig extends Configuration {

	public CKFinderConfig(ServletConfig servletConfig) {
        super(servletConfig);  
    }
	
	@Override
    protected Configuration createConfigurationInstance() {
		Principal principal = (Principal) UserUtils.getPrincipal();
		if (principal == null){
			return new CKFinderConfig(this.servletConf);
		}
		boolean isView = false;//UserUtils.getSubject().isPermitted("cms:ckfinder:view");
		boolean isUpload = false;
		boolean isEdit = false;
		if(Global.TYPE.equals("all")){
			if(UserUtils.getSubject().isPermitted("report:ckfinder:edit")){
				isEdit = true;
			}
			if(UserUtils.getSubject().isPermitted("report:ckfinder:view")){
				isView = true;
			}
			if(UserUtils.getSubject().isPermitted("report:ckfinder:upload")){
				isUpload = true;
			}
		}else if(Global.TYPE.equals("files")){
			if(UserUtils.getSubject().isPermitted("cms:ckfinder:view")){
				isView = true;
			}
			//有编辑权限则isEdit为true
			if(UserUtils.getSubject().isPermitted("cms:ckfinder:edit")){
				isEdit = true;
			}
			//是否有上传权限，默认为无
			if(UserUtils.getSubject().isPermitted("cms:ckfinder:upload")){
				isUpload = true;
			}
		}else if(Global.TYPE.equals("oaNotifyFiles")){
			isView = true;
			isUpload = true;
			isEdit = true;
		}
		//有编辑权限则isEdit为true
		if(UserUtils.getSubject().isPermitted("cms:ckfinder:edit")){
			isEdit = true;
		}
		//是否有上传权限，默认为无
		if(UserUtils.getSubject().isPermitted("cms:ckfinder:upload")){
			isUpload = true;
		}
		if(Global.TYPE.equals("khfiles")){
			isUpload = true;
			isEdit = false;
			isView = true;
		}
		AccessControlLevel alc = this.getAccessConrolLevels().get(0);
		alc.setFolderView(true);
		alc.setFolderCreate(isEdit);
		alc.setFolderRename(isEdit);
		alc.setFolderDelete(isEdit);
		alc.setFileView(isView);
		alc.setFileUpload(isUpload);
		alc.setFileRename(isEdit);
		alc.setFileDelete(isEdit);
//		for (AccessControlLevel a : this.getAccessConrolLevels()){
//			System.out.println(a.getRole()+", "+a.getResourceType()+", "+a.getFolder()
//					+", "+a.isFolderView()+", "+a.isFolderCreate()+", "+a.isFolderRename()+", "+a.isFolderDelete()
//					+", "+a.isFileView()+", "+a.isFileUpload()+", "+a.isFileRename()+", "+a.isFileDelete());
//		}
		
		
		AccessControlUtil.getInstance(this).loadACLConfig();
		try {
//			Principal principal = (Principal)SecurityUtils.getSubject().getPrincipal();
//			this.baseURL = ServletContextFactory.getServletContext().getContextPath()+"/userfiles/"+principal+"/";
		
			if(Global.TYPE.equals("khfiles")){
				User user = UserUtils.getUser();
				String officeId = user.getCompany().getId();
				this.baseURL = FileUtils.path(Servlets.getRequest().getContextPath() + Global.USERFILES_BASE_URL + officeId + "/"+Global.formId);
				this.baseDir = FileUtils.path(Global.getUserfilesBaseDir() + Global.USERFILES_BASE_URL + officeId +"/"+Global.formId);
			
			}else if(Global.TYPE.equals("oaNotifyFiles")){
				this.baseURL = FileUtils.path(Servlets.getRequest().getContextPath() + Global.USERFILES_BASE_URL + principal + "/");
				this.baseDir = FileUtils.path(Global.getUserfilesBaseDir() + Global.USERFILES_BASE_URL + principal + "/");

			}else if(Global.TYPE.equals("files")){
				
				this.baseURL = FileUtils.path(Servlets.getRequest().getContextPath() + Global.USERFILES_BASE_URL+"sharefile");
				this.baseDir = FileUtils.path(Global.getUserfilesBaseDir() + Global.USERFILES_BASE_URL+"sharefile");

			}else if(Global.TYPE.equals("all")){
				
				this.baseURL = FileUtils.path(Servlets.getRequest().getContextPath() + Global.USERFILES_BASE_URL+"all");
				this.baseDir = FileUtils.path(Global.getUserfilesBaseDir() + Global.USERFILES_BASE_URL+"all");

			}
			
			
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return new CKFinderConfig(this.servletConf);
    }

    @Override  
    public boolean checkAuthentication(final HttpServletRequest request) {
        return UserUtils.getPrincipal()!=null;
    }

}
