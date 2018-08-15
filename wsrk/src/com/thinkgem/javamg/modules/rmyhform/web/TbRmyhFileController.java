/**
 * 
 */
package com.thinkgem.javamg.modules.rmyhform.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.javamg.common.config.Global;
import com.thinkgem.javamg.common.persistence.Page;
import com.thinkgem.javamg.common.utils.StringUtils;
import com.thinkgem.javamg.common.web.BaseController;
import com.thinkgem.javamg.modules.rmyhform.entity.TbRmyhFile;
import com.thinkgem.javamg.modules.rmyhform.entity.TbRmyhKhformInfo;
import com.thinkgem.javamg.modules.rmyhform.service.TbRmyhFileService;
import com.thinkgem.javamg.modules.rmyhform.service.TbRmyhKhformInfoXfService;
import com.thinkgem.javamg.modules.sys.entity.User;
import com.thinkgem.javamg.modules.sys.utils.UserUtils;

/**
 * 考核文件Controller
 * @author wht
 * @version 2016-10-08
 */
@Controller
@RequestMapping(value = "${adminPath}/rmyhform/tbRmyhFile")
public class TbRmyhFileController extends BaseController {

	@Autowired
	private TbRmyhFileService tbRmyhFileService;
	@Autowired
	private TbRmyhKhformInfoXfService tbRmyhKhformInfoXfService;
	
	@ModelAttribute
	public TbRmyhFile get(@RequestParam(required=false) String id) {
		TbRmyhFile entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tbRmyhFileService.get(id);
		}
		if (entity == null){
			entity = new TbRmyhFile();
		}
		return entity;
	}
	
	@RequiresPermissions("rmyhform:tbRmyhFile:view")
	@RequestMapping(value = {"list", ""})
	public String list(TbRmyhFile tbRmyhFile, HttpServletRequest request, HttpServletResponse response, Model model,@RequestParam(required=false) String status) {
		if(status == null || status.equals("")){
			status = "1";
		}
		if(status.equals("2")){
			//得到当前用户
			User user = UserUtils.getUser();
			tbRmyhFile.setOfficeId(user.getOffice().getId());
			tbRmyhFile.setStatus(status);
			Page<TbRmyhFile> page = tbRmyhFileService.findOnePage1(new Page<TbRmyhFile>(request, response), tbRmyhFile); 
			model.addAttribute("page", page);
			model.addAttribute("status", status);
			return "modules/rmyhform/tbRmyhFileList";
		}
		//得到当前用户
		User user = UserUtils.getUser();
		tbRmyhFile.setOfficeId(user.getOffice().getId());
		tbRmyhFile.setStatus(status);
		Page<TbRmyhFile> page = tbRmyhFileService.findPage(new Page<TbRmyhFile>(request, response), tbRmyhFile); 
		model.addAttribute("page", page);
		model.addAttribute("status", status);
		return "modules/rmyhform/tbRmyhFileList";
	}
	
	@RequiresPermissions("rmyhform:tbRmyhFile:view")
	@RequestMapping(value = {"shlist", ""})
	public String shList(TbRmyhFile tbRmyhFile, HttpServletRequest request, HttpServletResponse response, Model model,@RequestParam(required=false) String file_status) {
		
		//1未审核  2审核完成列表     setStatus为5为评分完成    FileUlr 2 表示审核通过             status 为2 fileurl 为1时未审核          status为2fileulr为3审核未通过
		
		if(file_status == null || file_status.equals("")){
			file_status = "1";
		}
		if(file_status.equals("1")){
				
			//得到当前用户
			User user = UserUtils.getUser();
			tbRmyhFile.setOfficeId(user.getOffice().getId());
			tbRmyhFile.setStatus("2");
			tbRmyhFile.setFileUlr(file_status);
			Page<TbRmyhFile> page = tbRmyhFileService.findPage(new Page<TbRmyhFile>(request, response), tbRmyhFile); 
			model.addAttribute("page", page);
			model.addAttribute("file_status", file_status);
			return "modules/rmyhform/tbRmyhFileSHList";

		}else if(file_status.equals("2")){
			
			//得到当前用户
			User user = UserUtils.getUser();
			tbRmyhFile.setOfficeId(user.getOffice().getId());
			tbRmyhFile.setFileUlr(file_status);
			//得到考核文件一级审核完成列表
			Page<TbRmyhFile> page = tbRmyhFileService.findOnePage(new Page<TbRmyhFile>(request, response), tbRmyhFile); 
			model.addAttribute("page", page);
			model.addAttribute("file_status", file_status);
			return "modules/rmyhform/tbRmyhFileSHList";
		}else if(file_status.equals("3")){
			
			//得到当前用户
			User user = UserUtils.getUser();
			tbRmyhFile.setOfficeId(user.getOffice().getId());
			tbRmyhFile.setStatus("5");
			Page<TbRmyhFile> page = tbRmyhFileService.findPage(new Page<TbRmyhFile>(request, response), tbRmyhFile); 
			model.addAttribute("page", page);
			model.addAttribute("file_status", file_status);
			return "modules/rmyhform/tbRmyhFileSHList";
		}
		
		return null;
		
/*		//得到当前用户
				User user = UserUtils.getUser();
				tbRmyhFile.setOfficeId(user.getOffice().getId());
				tbRmyhFile.setStatus("2");
				tbRmyhFile.setFileUlr(file_status);
				Page<TbRmyhFile> page = tbRmyhFileService.findPage(new Page<TbRmyhFile>(request, response), tbRmyhFile); 
				model.addAttribute("page", page);
				model.addAttribute("file_status", file_status);
				return "modules/rmyhform/tbRmyhFileSHList";
				
				
		//获取考核结果
		if(file_status.equals("4")){
			//得到当前用户
			User user = UserUtils.getUser();
			tbRmyhFile.setOfficeId(user.getOffice().getId());
			tbRmyhFile.setStatus("5");
			Page<TbRmyhFile> page = tbRmyhFileService.findPage(new Page<TbRmyhFile>(request, response), tbRmyhFile); 
			model.addAttribute("page", page);
			model.addAttribute("file_status", file_status);
			return "modules/rmyhform/tbRmyhFileSHList";
		}
		//获得审核通过的表
		if(file_status.equals("2")){
			//得到当前用户
			User user = UserUtils.getUser();
			tbRmyhFile.setOfficeId(user.getOffice().getId());
			tbRmyhFile.setFileUlr("2");
			Page<TbRmyhFile> page = tbRmyhFileService.findPage(new Page<TbRmyhFile>(request, response), tbRmyhFile); 
			model.addAttribute("page", page);
			model.addAttribute("file_status", file_status);
			return "modules/rmyhform/tbRmyhFileSHList";
		}*/
		
	}
	
	
	@RequiresPermissions("rmyhform:tbRmyhFile:view")
	@RequestMapping(value = {"shlist2", ""})
	public String shList2(TbRmyhFile tbRmyhFile, HttpServletRequest request, HttpServletResponse response, Model model,@RequestParam(required=false) String file_status) {
		
		 //FileUlr 11 表示审核通过    12标示审核未通过 
		if(file_status == null || file_status.equals("")){
			file_status = "2";
		}
		if(file_status.equals("2")){
				
			//得到当前用户
			User user = UserUtils.getUser();
			tbRmyhFile.setOfficeId(user.getOffice().getId());
			tbRmyhFile.setStatus("2");
			tbRmyhFile.setFileUlr(file_status);
			Page<TbRmyhFile> page = tbRmyhFileService.findPage(new Page<TbRmyhFile>(request, response), tbRmyhFile); 
			model.addAttribute("page", page);
			model.addAttribute("file_status", file_status);
			return "modules/rmyhform/tbRmyhFileSHList2";

		}else if(file_status.equals("3")){
			//查询filrulr为11 或者status为5的
			//得到当前用户
			User user = UserUtils.getUser();
			tbRmyhFile.setOfficeId(user.getOffice().getId());
			tbRmyhFile.setFileUlr("11");
			//得到考核文件一级审核完成列表
			Page<TbRmyhFile> page = tbRmyhFileService.findOnePage(new Page<TbRmyhFile>(request, response), tbRmyhFile); 
			model.addAttribute("page", page);
			model.addAttribute("file_status", file_status);
			return "modules/rmyhform/tbRmyhFileSHList2";
		}else if(file_status.equals("4")){
			
			//得到当前用户
			User user = UserUtils.getUser();
			tbRmyhFile.setOfficeId(user.getOffice().getId());
			tbRmyhFile.setStatus("5");
			Page<TbRmyhFile> page = tbRmyhFileService.findPage(new Page<TbRmyhFile>(request, response), tbRmyhFile); 
			model.addAttribute("page", page);
			model.addAttribute("file_status", file_status);
			return "modules/rmyhform/tbRmyhFileSHList2";
		}
		return null;
		

		
	}
	
	
	//评分action
	@RequiresPermissions("rmyhform:tbRmyhFile:view")
	@RequestMapping(value = {"scoreList", ""})
	public String scoreList(TbRmyhFile tbRmyhFile, HttpServletRequest request, HttpServletResponse response, Model model,
			@RequestParam(required=false) String officeId,@RequestParam(required=false) String flag) {
		//flag=1为考核列表 flag=2为考核完成列表
		if(officeId==null || officeId.equals("1") || officeId.equals("")){
			officeId = null;
		}
		if(flag.equals("1")){
			tbRmyhFile.setOfficeId(officeId);
			tbRmyhFile.setStatus("2");
			tbRmyhFile.setFileUlr("11");
		}else if(flag.equals("2")){
			tbRmyhFile.setOfficeId(officeId);
			tbRmyhFile.setStatus("3");
			//查询状态为3、4、5、6、7
			Page<TbRmyhFile> page = tbRmyhFileService.findSHPage(new Page<TbRmyhFile>(request, response), tbRmyhFile); 
			model.addAttribute("page", page);
			model.addAttribute("officeId", officeId);
			model.addAttribute("flag", flag);
			return "modules/rmyhform/scoreList";
		}else if(flag.equals("3")){
			tbRmyhFile.setOfficeId(officeId);
			tbRmyhFile.setStatus("3");
		}else if(flag.equals("4")){
			tbRmyhFile.setOfficeId(officeId);
			tbRmyhFile.setStatus("4");
			//查询状态为3、4、5、6、7
			Page<TbRmyhFile> page = tbRmyhFileService.findSHPage(new Page<TbRmyhFile>(request, response), tbRmyhFile); 
			model.addAttribute("page", page);
			model.addAttribute("officeId", officeId);
			model.addAttribute("flag", flag);
			return "modules/rmyhform/scoreListSH1";
		}else if(flag.equals("5")){
			tbRmyhFile.setOfficeId(officeId);
			tbRmyhFile.setStatus("4");
		}else if(flag.equals("6")){
			tbRmyhFile.setOfficeId(officeId);
			tbRmyhFile.setStatus("5");
		}
		
		
		Page<TbRmyhFile> page = tbRmyhFileService.findPage(new Page<TbRmyhFile>(request, response), tbRmyhFile); 
		model.addAttribute("page", page);
		model.addAttribute("officeId", officeId);
		model.addAttribute("flag", flag);
		if(flag.equals("1")||flag.equals("2")){
			return "modules/rmyhform/scoreList";
		}else if(flag.equals("3")||flag.equals("4")) {
			return "modules/rmyhform/scoreListSH1";
		}else{
			return "modules/rmyhform/scoreListSH2";
		}
		
	}
	
	@RequiresPermissions("rmyhform:tbRmyhFile:view")
	@RequestMapping(value = "form")
	public String form(TbRmyhFile tbRmyhFile, Model model) {
		model.addAttribute("tbRmyhFile", tbRmyhFile);
		return "modules/rmyhform/tbRmyhFileForm";
	}

	@RequiresPermissions("rmyhform:tbRmyhFile:edit")
	@RequestMapping(value = "save")
	public String save(TbRmyhFile tbRmyhFile, Model model, RedirectAttributes redirectAttributes,@RequestParam(required=false) String fileUlr,
			@RequestParam(required=false) String remark, @RequestParam(required=false) String fromflag) {
		if (!beanValidator(model, tbRmyhFile)){
			return form(tbRmyhFile, model);
		}
		if(remark != null && remark != ""){
			tbRmyhFile.setRemarks(remark);
		}
		if(fromflag == null){
			fromflag = "";
		}
		if(fromflag.equals("20")){
			tbRmyhFile.setStatus("6");
			tbRmyhFile.setFileUlr("11");
			tbRmyhFileService.save(tbRmyhFile);
		
			return "redirect:"+Global.getAdminPath()+"/rmyhform/tbRmyhFile/list?repage";
		}else if(fromflag.equals("25")){
			tbRmyhFile.setStatus("7");
			tbRmyhFile.setFileUlr("11");
			tbRmyhFileService.save(tbRmyhFile);
		
			return "redirect:"+Global.getAdminPath()+"/rmyhform/tbRmyhFile/list?repage";
		}else if(fromflag.equals("88")){
			
			//tbRmyhFile.setStatus("2");
			tbRmyhFile.setFileUlr("12");
			tbRmyhFileService.save(tbRmyhFile);
			
			return "redirect:"+Global.getAdminPath()+"/rmyhform/tbRmyhFile/list?repage";
			
		}else{
			tbRmyhFile.setStatus("2");
			tbRmyhFile.setFileUlr(fileUlr);
			tbRmyhFileService.save(tbRmyhFile);
			
			return "redirect:"+Global.getAdminPath()+"/rmyhform/tbRmyhFile/list?repage";
		}
		
	}
	
	
	
	@RequiresPermissions("rmyhform:tbRmyhFile:edit")
	@RequestMapping(value = "delete")
	public String delete(TbRmyhFile tbRmyhFile, RedirectAttributes redirectAttributes) {
		
		tbRmyhFileService.delete(tbRmyhFile);
		TbRmyhKhformInfo temp = new TbRmyhKhformInfo();
		temp.setFlagId(tbRmyhFile.getFlagId());
		tbRmyhKhformInfoXfService.delete(temp);
		addMessage(redirectAttributes, "删除考核文件成功");
		String id = tbRmyhFile.getOfficeId();
		return "redirect:"+Global.getAdminPath()+"/rmyhform/tbRmyhFile/scoreList?flag=3&officeId="+id;
	}

}