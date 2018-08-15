/**
 * 
 */
package com.thinkgem.javamg.modules.accounts.web;

import java.util.List;

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
import com.thinkgem.javamg.common.web.BaseController;
import com.thinkgem.javamg.common.utils.StringUtils;
import com.thinkgem.javamg.modules.accounts.entity.TbEmployee;
import com.thinkgem.javamg.modules.accounts.service.TbEmployeeService;
import com.thinkgem.javamg.modules.sys.entity.User;
import com.thinkgem.javamg.modules.sys.utils.UserUtils;

/**
 * 部门人员基本情况表Controller
 * @author wht
 * @version 2017-05-23
 */
@Controller
@RequestMapping(value = "${adminPath}/accounts/tbEmployee")
public class TbEmployeeController extends BaseController {

	@Autowired
	private TbEmployeeService tbEmployeeService;
	
	@ModelAttribute
	public TbEmployee get(@RequestParam(required=false) String id) {
		TbEmployee entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tbEmployeeService.get(id);
		}
		if (entity == null){
			entity = new TbEmployee();
		}
		return entity;
	}
	
	@RequiresPermissions("accounts:tbEmployee:view")
	@RequestMapping(value = {"list", ""})
	public String list(TbEmployee tbEmployee, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TbEmployee> page = tbEmployeeService.findPage(new Page<TbEmployee>(request, response), tbEmployee); 
		model.addAttribute("page", page);
		return "modules/accounts/tbEmployeeList";
	}

	@RequiresPermissions("accounts:tbEmployee:view")
	@RequestMapping(value = {"scoreEmployeeList", ""})
	public String scoreEmployeeList(TbEmployee tbEmployee, HttpServletRequest request, HttpServletResponse response, Model model) {
		List<TbEmployee> list = tbEmployeeService.findScoreEmployeeList(tbEmployee);
		model.addAttribute("list", list);
		return "modules/accounts/tbEmployeeScoreList";
	}
	
	@RequiresPermissions("accounts:tbEmployee:view")
	@RequestMapping(value = "form")
	public String form(TbEmployee tbEmployee, Model model) {
		
		if (tbEmployee.getCompany()==null || tbEmployee.getCompany().getId()==null){
			tbEmployee.setCompany(UserUtils.getUser().getCompany());
		}
		if (tbEmployee.getOffice()==null || tbEmployee.getOffice().getId()==null){
			tbEmployee.setOffice(UserUtils.getUser().getOffice());
		}
		model.addAttribute("tbEmployee", tbEmployee);
		return "modules/accounts/tbEmployeeForm";
	}

	@RequiresPermissions("accounts:tbEmployee:edit")
	@RequestMapping(value = "save")
	public String save(TbEmployee tbEmployee, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, tbEmployee)){
			return form(tbEmployee, model);
		}
			User user = UserUtils.getUser();
			tbEmployee.setCreatName(user.getName());
		tbEmployeeService.save(tbEmployee);
		addMessage(redirectAttributes, "保存部门人员基本情况表成功");
		return "redirect:"+Global.getAdminPath()+"/accounts/tbEmployee/list?repage";
	}
	
	@RequiresPermissions("accounts:tbEmployee:edit")
	@RequestMapping(value = "delete")
	public String delete(TbEmployee tbEmployee, RedirectAttributes redirectAttributes) {
		tbEmployeeService.delete(tbEmployee);
		addMessage(redirectAttributes, "删除部门人员基本情况表成功");
		return "redirect:"+Global.getAdminPath()+"/accounts/tbEmployee/list?repage";
	}

}