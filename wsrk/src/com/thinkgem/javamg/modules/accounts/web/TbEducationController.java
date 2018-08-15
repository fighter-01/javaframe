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
import com.thinkgem.javamg.modules.accounts.entity.TbAffairsOpen;
import com.thinkgem.javamg.modules.accounts.entity.TbEducation;
import com.thinkgem.javamg.modules.accounts.service.TbEducationService;
import com.thinkgem.javamg.modules.sys.entity.User;
import com.thinkgem.javamg.modules.sys.utils.UserUtils;

/**
 * 廉政教育谈话情况Controller
 * @author wht
 * @version 2017-06-03
 */
@Controller
@RequestMapping(value = "${adminPath}/accounts/tbEducation")
public class TbEducationController extends BaseController {

	@Autowired
	private TbEducationService tbEducationService;
	
	@ModelAttribute
	public TbEducation get(@RequestParam(required=false) String id) {
		TbEducation entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tbEducationService.get(id);
		}
		if (entity == null){
			entity = new TbEducation();
		}
		return entity;
	}
	
	@RequiresPermissions("accounts:tbEducation:view")
	@RequestMapping(value = {"list", ""})
	public String list(TbEducation tbEducation, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TbEducation> page = tbEducationService.findPage(new Page<TbEducation>(request, response), tbEducation); 
		model.addAttribute("page", page);
		return "modules/accounts/tbEducationList";
	}

	@RequiresPermissions("accounts:tbEducation:view")
	@RequestMapping(value = {"scoreView", ""})
	public String scoreView(TbEducation tbEducation, Model model) {
		
		model.addAttribute("tbEducation",tbEducation);
		return "modules/accounts/tbEducationScoreView";
		
	}
	
	@RequiresPermissions("accounts:tbEducation:view")
	@RequestMapping(value = "form")
	public String form(TbEducation tbEducation, Model model) {
		if (tbEducation.getCompany()==null || tbEducation.getCompany().getId()==null){
			tbEducation.setCompany(UserUtils.getUser().getCompany());
		}
		if (tbEducation.getOffice()==null || tbEducation.getOffice().getId()==null){
			tbEducation.setOffice(UserUtils.getUser().getOffice());
		}
		model.addAttribute("tbEducation", tbEducation);
		return "modules/accounts/tbEducationForm";
	}

	@RequiresPermissions("accounts:tbEducation:edit")
	@RequestMapping(value = "save")
	public String save(TbEducation tbEducation, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, tbEducation)){
			return form(tbEducation, model);
		}
		User user = UserUtils.getUser();
		tbEducation.setCreateName(user.getName());
		tbEducationService.save(tbEducation);
		addMessage(redirectAttributes, "保存廉政教育谈话情况成功");
		return "redirect:"+Global.getAdminPath()+"/accounts/tbEducation/list?repage";
	}
	
	@RequiresPermissions("accounts:tbEducation:edit")
	@RequestMapping(value = "delete")
	public String delete(TbEducation tbEducation, RedirectAttributes redirectAttributes) {
		tbEducationService.delete(tbEducation);
		addMessage(redirectAttributes, "删除廉政教育谈话情况成功");
		return "redirect:"+Global.getAdminPath()+"/accounts/tbEducation/list?repage";
	}

}