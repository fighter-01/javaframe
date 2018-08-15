/**
 * 
 */
package com.thinkgem.javamg.modules.accounts.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.javamg.common.config.Global;
import com.thinkgem.javamg.common.persistence.Page;
import com.thinkgem.javamg.common.utils.StringUtils;
import com.thinkgem.javamg.common.web.BaseController;
import com.thinkgem.javamg.modules.accounts.entity.TbWorkInspect;
import com.thinkgem.javamg.modules.accounts.service.TbWorkInspectService;
import com.thinkgem.javamg.modules.rmyhform.entity.TbRmyhKhformInfo;
import com.thinkgem.javamg.modules.sys.entity.User;
import com.thinkgem.javamg.modules.sys.utils.UserUtils;

/**
 * 部门落实党风廉政建设责任制年度量化考评表Controller
 * @author wht
 * @version 2017-06-10
 */
@Controller							
@RequestMapping(value = "${adminPath}/accounts/tbWorkInspect")
public class TbWorkInspectController extends BaseController {

	@Autowired
	private TbWorkInspectService tbWorkInspectService;
	
	@ModelAttribute
	public TbWorkInspect get(@RequestParam(required=false) String id) {
		TbWorkInspect entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tbWorkInspectService.get(id);
		}
		if (entity == null){
			entity = new TbWorkInspect();
		}
		return entity;
	}
	
	@RequiresPermissions("accounts:tbWorkInspect:view")
	@RequestMapping(value = {"list", ""})
	public String list(TbWorkInspect tbWorkInspect, HttpServletRequest request, HttpServletResponse response, Model model,
			@RequestParam(value="flag", required=true) String flag) {
	
		if(flag.equals("2")){
			tbWorkInspect.setStatus2("2");
			tbWorkInspect.setStatus1("3");
			tbWorkInspect.setStatus3("4");
			tbWorkInspect.setStatus4("6");
		}else if(flag.equals("3")){
			tbWorkInspect.setStatus5("3");
			tbWorkInspect.setStatus6("4");
		}
		Page<TbWorkInspect> page = tbWorkInspectService.findPage(new Page<TbWorkInspect>(request, response), tbWorkInspect); 
		model.addAttribute("page", page);
		//flag=1表示普通角色，flag=2表示审核角色
				if(flag.equals("1")){
					return "modules/accounts/tbWorkInspectList";
				}else if(flag.equals("2")){
					return "modules/accounts/shTbWorkInspectList";
				}else if(flag.equals("3")){
					return "modules/accounts/shHLDTbWorkInspectList";
				}else{
					return "";
				}
	}

	@RequiresPermissions("accounts:tbWorkInspect:view")
	@RequestMapping(value = "form")
	public String form(TbWorkInspect tbWorkInspect, Model model) {
		if (tbWorkInspect.getCompany()==null || tbWorkInspect.getCompany().getId()==null){
			tbWorkInspect.setCompany(UserUtils.getUser().getCompany());
		}
		if (tbWorkInspect.getOffice()==null || tbWorkInspect.getOffice().getId()==null){
			tbWorkInspect.setOffice(UserUtils.getUser().getOffice());
		}
		model.addAttribute("tbWorkInspect", tbWorkInspect);
		return "modules/accounts/tbWorkInspectForm";
	}

	
	
	@RequiresPermissions("accounts:tbWorkInspect:view")
	@RequestMapping(value = "view")
	public String view(TbWorkInspect tbWorkInspect, Model model) {
		
		model.addAttribute("tbWorkInspect", tbWorkInspect);
		return "modules/accounts/tbWorkInspectView";
	}
	
	@RequiresPermissions("accounts:tbWorkInspect:view")
	@RequestMapping(value = "shview")
	public String shView(TbWorkInspect tbWorkInspect, Model model) {
		
		model.addAttribute("tbWorkInspect", tbWorkInspect);
		return "modules/accounts/shtbWorkInspectView";
	}
	
	
	@RequiresPermissions("accounts:tbWorkInspect:edit")
	@RequestMapping(value = "save")
	public String save(TbWorkInspect tbWorkInspect, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, tbWorkInspect)){
			return form(tbWorkInspect, model);
		}
		User user = UserUtils.getUser();
		tbWorkInspect.setCreateName(user.getName());
		tbWorkInspectService.save(tbWorkInspect);
		addMessage(redirectAttributes, "保存部门落实党风廉政建设责任制年度量化考评表成功");
		return "redirect:"+Global.getAdminPath()+"/accounts/tbWorkInspect/list?flag=1";
	}
	
	
	@ResponseBody
	@RequiresPermissions("accounts:tbWorkInspect:edit")
	@RequestMapping(value = "updateStatus")
	public String updateStatus(String id,String status ,String remarks) {
		
		tbWorkInspectService.updateStatus(id, status,remarks);
		return "1";
	}

	@RequiresPermissions("accounts:tbWorkInspect:edit")
	@RequestMapping(value = "delete")
	public String delete(TbWorkInspect tbWorkInspect, RedirectAttributes redirectAttributes) {
		tbWorkInspectService.delete(tbWorkInspect);
		addMessage(redirectAttributes, "删除部门党风廉政建设工作检查记录表成功");
		return "redirect:"+Global.getAdminPath()+"/accounts/tbWorkInspect/list?flag=1";
	}


}