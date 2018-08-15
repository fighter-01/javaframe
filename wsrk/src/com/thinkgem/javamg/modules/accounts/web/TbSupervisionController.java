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
import com.thinkgem.javamg.modules.accounts.entity.TbEducation;
import com.thinkgem.javamg.modules.accounts.entity.TbSupervision;
import com.thinkgem.javamg.modules.accounts.service.TbSupervisionService;
import com.thinkgem.javamg.modules.sys.entity.User;
import com.thinkgem.javamg.modules.sys.utils.UserUtils;

/**
 * 接受监督情况Controller
 * @author wht
 * @version 2017-06-03
 */
@Controller
@RequestMapping(value = "${adminPath}/accounts/tbSupervision")
public class TbSupervisionController extends BaseController {

	@Autowired
	private TbSupervisionService tbSupervisionService;
	
	@ModelAttribute
	public TbSupervision get(@RequestParam(required=false) String id) {
		TbSupervision entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tbSupervisionService.get(id);
		}
		if (entity == null){
			entity = new TbSupervision();
		}
		return entity;
	}
	
	@RequiresPermissions("accounts:tbSupervision:view")
	@RequestMapping(value = {"list", ""})
	public String list(TbSupervision tbSupervision, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TbSupervision> page = tbSupervisionService.findPage(new Page<TbSupervision>(request, response), tbSupervision); 
		model.addAttribute("page", page);
		return "modules/accounts/tbSupervisionList";
	}

	@RequiresPermissions("accounts:tbSupervision:view")
	@RequestMapping(value = {"scoreView", ""})
	public String scoreView(TbSupervision tbSupervision, Model model) {
		
		model.addAttribute("tbSupervision",tbSupervision);
		return "modules/accounts/tbSupervisionScoreView";
		
	}
	
	@RequiresPermissions("accounts:tbSupervision:view")
	@RequestMapping(value = "form")
	public String form(TbSupervision tbSupervision, Model model) {
		if (tbSupervision.getCompany()==null || tbSupervision.getCompany().getId()==null){
			tbSupervision.setCompany(UserUtils.getUser().getCompany());
		}
		if (tbSupervision.getOffice()==null || tbSupervision.getOffice().getId()==null){
			tbSupervision.setOffice(UserUtils.getUser().getOffice());
		}
		model.addAttribute("tbSupervision", tbSupervision);
		return "modules/accounts/tbSupervisionForm";
	}

	@RequiresPermissions("accounts:tbSupervision:edit")
	@RequestMapping(value = "save")
	public String save(TbSupervision tbSupervision, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, tbSupervision)){
			return form(tbSupervision, model);
		}
		User user = UserUtils.getUser();
		tbSupervision.setCreateName(user.getName());
		tbSupervisionService.save(tbSupervision);
		addMessage(redirectAttributes, "保存接受监督情况成功");
		return "redirect:"+Global.getAdminPath()+"/accounts/tbSupervision/list?repage";
	}
	
	@RequiresPermissions("accounts:tbSupervision:edit")
	@RequestMapping(value = "delete")
	public String delete(TbSupervision tbSupervision, RedirectAttributes redirectAttributes) {
		tbSupervisionService.delete(tbSupervision);
		addMessage(redirectAttributes, "删除接受监督情况成功");
		return "redirect:"+Global.getAdminPath()+"/accounts/tbSupervision/list?repage";
	}

}