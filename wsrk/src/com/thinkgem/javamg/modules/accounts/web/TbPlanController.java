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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.javamg.common.config.Global;
import com.thinkgem.javamg.common.persistence.Page;
import com.thinkgem.javamg.common.web.BaseController;
import com.thinkgem.javamg.common.utils.StringUtils;
import com.thinkgem.javamg.modules.accounts.entity.TbPlan;
import com.thinkgem.javamg.modules.accounts.service.TbPlanService;
import com.thinkgem.javamg.modules.sys.entity.User;
import com.thinkgem.javamg.modules.sys.utils.UserUtils;

/**
 * 党风廉政建设工作计划及措施Controller
 * @author wht
 * @version 2017-06-01
 */
@Controller
@RequestMapping(value = "${adminPath}/accounts/tbPlan")
public class TbPlanController extends BaseController {

	@Autowired
	private TbPlanService tbPlanService;
	
	@ModelAttribute
	public TbPlan get(@RequestParam(required=false) String id) {
		TbPlan entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tbPlanService.get(id);
		}
		if (entity == null){
			entity = new TbPlan();
		}
		return entity;
	}
	
	@RequiresPermissions("accounts:tbPlan:view")
	@RequestMapping(value = {"list", ""})
	public String list(TbPlan tbPlan, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TbPlan> page = tbPlanService.findPage(new Page<TbPlan>(request, response), tbPlan); 
		model.addAttribute("page", page);
		return "modules/accounts/tbPlanList";
	}

	@RequiresPermissions("accounts:tbPlan:view")
	@RequestMapping(value = {"scoreView", ""})
	public String scoreView(TbPlan tbPlan, Model model) {
		
		model.addAttribute("tbPlan", tbPlan);
		return "modules/accounts/tbPlanScoreView";
		
	}
	
	
	@RequiresPermissions("accounts:tbPlan:view")
	@RequestMapping(value = "form")
	public String form(TbPlan tbPlan, Model model) {
		if (tbPlan.getCompany()==null || tbPlan.getCompany().getId()==null){
			tbPlan.setCompany(UserUtils.getUser().getCompany());
		}
		if (tbPlan.getOffice()==null || tbPlan.getOffice().getId()==null){
			tbPlan.setOffice(UserUtils.getUser().getOffice());
		}
		model.addAttribute("tbPlan", tbPlan);
		return "modules/accounts/tbPlanForm";
	}

	@RequiresPermissions("accounts:tbPlan:edit")
	@RequestMapping(value = "save")
	public String save(TbPlan tbPlan, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, tbPlan)){
			return form(tbPlan, model);
		}
		User user = UserUtils.getUser();
		tbPlan.setCreateName(user.getName());
		tbPlanService.save(tbPlan);
		addMessage(redirectAttributes, "保存党风廉政建设工作计划及措施成功");
		return "redirect:"+Global.getAdminPath()+"/accounts/tbPlan/list?repage";
	}
	
	@RequiresPermissions("accounts:tbPlan:edit")
	@RequestMapping(value = "delete")
	public String delete(TbPlan tbPlan, RedirectAttributes redirectAttributes) {
		tbPlanService.delete(tbPlan);
		addMessage(redirectAttributes, "删除党风廉政建设工作计划及措施成功");
		return "redirect:"+Global.getAdminPath()+"/accounts/tbPlan/list?repage";
	}

}