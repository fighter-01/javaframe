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
import com.thinkgem.javamg.common.web.BaseController;
import com.thinkgem.javamg.common.utils.StringUtils;
import com.thinkgem.javamg.modules.accounts.entity.TbHalfyear;
import com.thinkgem.javamg.modules.accounts.entity.TbHalfyearTable;
import com.thinkgem.javamg.modules.accounts.service.TbHalfyearService;
import com.thinkgem.javamg.modules.accounts.service.TbHalfyearTableService;
import com.thinkgem.javamg.modules.sys.entity.User;
import com.thinkgem.javamg.modules.sys.utils.UserUtils;

/**
 * 部门落实党风廉政建设责任制情况半年自查表Controller
 * @author wht
 * @version 2017-06-04
 */
@Controller
@RequestMapping(value = "${adminPath}/accounts/tbHalfyear")
public class TbHalfyearController extends BaseController {

	@Autowired
	private TbHalfyearService tbHalfyearService;
	@Autowired
	private  TbHalfyearTableService tbHalfyearTableService;
	
	@ModelAttribute
	public TbHalfyear get(@RequestParam(required=false) String id) {
		TbHalfyear entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tbHalfyearService.get(id);
		}
		if (entity == null){
			entity = new TbHalfyear();
		}
		return entity;
	}
	
	@RequiresPermissions("accounts:tbHalfyear:view")
	@RequestMapping(value = {"list", ""})
	public String list(TbHalfyear tbHalfyear, HttpServletRequest request, HttpServletResponse response, Model model,
			@RequestParam(value="flag", required=true) String flag) {
		if(flag.equals("2")){
			tbHalfyear.setStatus2("2");
			tbHalfyear.setStatus1("3");
		}
		Page<TbHalfyear> page = tbHalfyearService.findPage(new Page<TbHalfyear>(request, response), tbHalfyear); 
		model.addAttribute("page", page);
		//flag=1表示普通角色，flag=2表示审核角色
		if(flag.equals("1")){
			return "modules/accounts/tbHalfyearList";
		}else if(flag.equals("2")){
			return "modules/accounts/shTbHalfyearList";
		}else{
			return "";
		}
		
	}

	@RequiresPermissions("accounts:tbHalfyear:view")
	@RequestMapping(value = "form")
	public String form(TbHalfyear tbHalfyear, Model model) {
		if (tbHalfyear.getCompany()==null || tbHalfyear.getCompany().getId()==null){
			tbHalfyear.setCompany(UserUtils.getUser().getCompany());
		}
		if (tbHalfyear.getOffice()==null || tbHalfyear.getOffice().getId()==null){
			tbHalfyear.setOffice(UserUtils.getUser().getOffice());
		}
		TbHalfyearTable tbHalfyearTable =  tbHalfyearTableService.get("1");
		tbHalfyear.setTbHalfyearTable(tbHalfyearTable);
		model.addAttribute("tbHalfyear", tbHalfyear);
		return "modules/accounts/tbHalfyearForm";
	}


	@RequiresPermissions("accounts:tbHalfyear:view")
	@RequestMapping(value = "view")
	public String view(TbHalfyear tbHalfyear, Model model) {
		TbHalfyearTable tbHalfyearTable =  tbHalfyearTableService.get("1");
		tbHalfyear.setTbHalfyearTable(tbHalfyearTable);
		model.addAttribute("tbHalfyear", tbHalfyear);
		return "modules/accounts/tbHalfyearView";
	}
	
	
	@RequiresPermissions("accounts:tbHalfyear:view")
	@RequestMapping(value = "shview")
	public String shView(TbHalfyear tbHalfyear, Model model) {
		TbHalfyearTable tbHalfyearTable =  tbHalfyearTableService.get("1");
		tbHalfyear.setTbHalfyearTable(tbHalfyearTable);
		model.addAttribute("tbHalfyear", tbHalfyear);
		return "modules/accounts/shtbHalfyearView";
	}
	
	@RequiresPermissions("accounts:tbHalfyear:edit")
	@RequestMapping(value = "save")
	public String save(TbHalfyear tbHalfyear, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, tbHalfyear)){
			return form(tbHalfyear, model);
		}
		User user = UserUtils.getUser();
		tbHalfyear.setCreateName(user.getName());
		tbHalfyearService.save(tbHalfyear);
		addMessage(redirectAttributes, "保存部门落实党风廉政建设责任制情况半年自查表成功");
		return "redirect:"+Global.getAdminPath()+"/accounts/tbHalfyear/list?flag=1";
	}
	@ResponseBody
	@RequiresPermissions("accounts:tbHalfyear:edit")
	@RequestMapping(value = "updateStatus")
	public String updateStatus(String id,String status) {
		tbHalfyearService.updateStatus(id, status);
		return "1";
	}

	@ResponseBody
	@RequiresPermissions("accounts:tbHalfyear:edit")
	@RequestMapping(value = "updateRemarks")
	public String updateRemarks(String id,String remarks) {
		
		tbHalfyearService.updateRemarks(id, remarks);
		return "1";
	}
	//审核通过后，添加审核人姓名日期，及更新状态
	@ResponseBody
	@RequiresPermissions("accounts:tbHalfyear:edit")
	@RequestMapping(value = "updateSign")
	public String updateSign(String id,String status) {
		User user = UserUtils.getUser();
		
		tbHalfyearService.updateSign(id, status,user.getName());
		return "1";
	}
	
	@RequiresPermissions("accounts:tbHalfyear:edit")
	@RequestMapping(value = "delete")
	public String delete(TbHalfyear tbHalfyear, RedirectAttributes redirectAttributes) {
		tbHalfyearService.delete(tbHalfyear);
		addMessage(redirectAttributes, "删除部门落实党风廉政建设责任制情况半年自查表成功");
		return "redirect:"+Global.getAdminPath()+"/accounts/tbHalfyear/?repage";
	}

}