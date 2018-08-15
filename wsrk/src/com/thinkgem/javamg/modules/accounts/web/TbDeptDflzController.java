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
import com.thinkgem.javamg.modules.accounts.entity.TbDeptDflz;
import com.thinkgem.javamg.modules.accounts.entity.TbOfficeDflz;
import com.thinkgem.javamg.modules.accounts.service.TbDeptDflzService;
import com.thinkgem.javamg.modules.sys.entity.User;
import com.thinkgem.javamg.modules.sys.utils.UserUtils;

/**
 * 部门组织的党风廉政建设活动Controller
 * @author wht
 * @version 2017-06-02
 */
@Controller
@RequestMapping(value = "${adminPath}/accounts/tbDeptDflz")
public class TbDeptDflzController extends BaseController {

	@Autowired
	private TbDeptDflzService tbDeptDflzService;
	
	@ModelAttribute
	public TbDeptDflz get(@RequestParam(required=false) String id) {
		TbDeptDflz entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tbDeptDflzService.get(id);
		}
		if (entity == null){
			entity = new TbDeptDflz();
		}
		return entity;
	}
	

	@RequiresPermissions("accounts:tbDeptDflz:view")
	@RequestMapping(value = {"scoreView", ""})
	public String scoreView(TbDeptDflz tbDeptDflz, Model model) {
		
		model.addAttribute("tbDeptDflz", tbDeptDflz);
		return "modules/accounts/tbDeptDflzScoreView";
		
	}
	
	@RequiresPermissions("accounts:tbDeptDflz:view")
	@RequestMapping(value = {"list", ""})
	public String list(TbDeptDflz tbDeptDflz, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TbDeptDflz> page = tbDeptDflzService.findPage(new Page<TbDeptDflz>(request, response), tbDeptDflz); 
		model.addAttribute("page", page);
		return "modules/accounts/tbDeptDflzList";
	}

	@RequiresPermissions("accounts:tbDeptDflz:view")
	@RequestMapping(value = "form")
	public String form(TbDeptDflz tbDeptDflz, Model model) {
		if (tbDeptDflz.getCompany()==null || tbDeptDflz.getCompany().getId()==null){
			tbDeptDflz.setCompany(UserUtils.getUser().getCompany());
		}
		if (tbDeptDflz.getOffice()==null || tbDeptDflz.getOffice().getId()==null){
			tbDeptDflz.setOffice(UserUtils.getUser().getOffice());
		}
		model.addAttribute("tbDeptDflz", tbDeptDflz);
		return "modules/accounts/tbDeptDflzForm";
	}

	@RequiresPermissions("accounts:tbDeptDflz:edit")
	@RequestMapping(value = "save")
	public String save(TbDeptDflz tbDeptDflz, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, tbDeptDflz)){
			return form(tbDeptDflz, model);
		}
		User user = UserUtils.getUser();
		tbDeptDflz.setCreateName(user.getName());
		tbDeptDflzService.save(tbDeptDflz);
		addMessage(redirectAttributes, "保存部门组织的党风廉政建设活动成功");
		return "redirect:"+Global.getAdminPath()+"/accounts/tbDeptDflz/list?repage";
	}
	
	@RequiresPermissions("accounts:tbDeptDflz:edit")
	@RequestMapping(value = "delete")
	public String delete(TbDeptDflz tbDeptDflz, RedirectAttributes redirectAttributes) {
		tbDeptDflzService.delete(tbDeptDflz);
		addMessage(redirectAttributes, "删除部门组织的党风廉政建设活动成功");
		return "redirect:"+Global.getAdminPath()+"/accounts/tbDeptDflz/list?repage";
	}

}