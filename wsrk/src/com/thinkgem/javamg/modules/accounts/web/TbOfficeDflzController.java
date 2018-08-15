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
import com.thinkgem.javamg.modules.accounts.entity.TbOfficeDflz;
import com.thinkgem.javamg.modules.accounts.entity.TbPlan;
import com.thinkgem.javamg.modules.accounts.service.TbOfficeDflzService;
import com.thinkgem.javamg.modules.sys.entity.User;
import com.thinkgem.javamg.modules.sys.utils.UserUtils;

/**
 * 参加机关党风廉政建设活动情况Controller
 * @author wht
 * @version 2017-06-02
 */
@Controller
@RequestMapping(value = "${adminPath}/accounts/tbOfficeDflz")
public class TbOfficeDflzController extends BaseController {

	@Autowired
	private TbOfficeDflzService tbOfficeDflzService;
	
	@ModelAttribute
	public TbOfficeDflz get(@RequestParam(required=false) String id) {
		TbOfficeDflz entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tbOfficeDflzService.get(id);
		}
		if (entity == null){
			entity = new TbOfficeDflz();
		}
		return entity;
	}
	
	@RequiresPermissions("accounts:tbOfficeDflz:view")
	@RequestMapping(value = {"scoreView", ""})
	public String scoreView(TbOfficeDflz tbOfficeDflz, Model model) {
		
		model.addAttribute("tbOfficeDflz", tbOfficeDflz);
		return "modules/accounts/tbOfficeDflzScoreView";
		
	}
	
	@RequiresPermissions("accounts:tbOfficeDflz:view")
	@RequestMapping(value = {"list", ""})
	public String list(TbOfficeDflz tbOfficeDflz, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TbOfficeDflz> page = tbOfficeDflzService.findPage(new Page<TbOfficeDflz>(request, response), tbOfficeDflz); 
		model.addAttribute("page", page);
		return "modules/accounts/tbOfficeDflzList";
	}

	@RequiresPermissions("accounts:tbOfficeDflz:view")
	@RequestMapping(value = "form")
	public String form(TbOfficeDflz tbOfficeDflz, Model model) {
		if (tbOfficeDflz.getCompany()==null || tbOfficeDflz.getCompany().getId()==null){
			tbOfficeDflz.setCompany(UserUtils.getUser().getCompany());
		}
		if (tbOfficeDflz.getOffice()==null || tbOfficeDflz.getOffice().getId()==null){
			tbOfficeDflz.setOffice(UserUtils.getUser().getOffice());
		}
		model.addAttribute("tbOfficeDflz", tbOfficeDflz);
		return "modules/accounts/tbOfficeDflzForm";
	}

	@RequiresPermissions("accounts:tbOfficeDflz:edit")
	@RequestMapping(value = "save")
	public String save(TbOfficeDflz tbOfficeDflz, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, tbOfficeDflz)){
			return form(tbOfficeDflz, model);
		}
		User user = UserUtils.getUser();
		tbOfficeDflz.setCreateName(user.getName());
		tbOfficeDflzService.save(tbOfficeDflz);
		addMessage(redirectAttributes, "保存参加机关党风廉政建设活动情况成功");
		return "redirect:"+Global.getAdminPath()+"/accounts/tbOfficeDflz/list?repage";
	}
	
	@RequiresPermissions("accounts:tbOfficeDflz:edit")
	@RequestMapping(value = "delete")
	public String delete(TbOfficeDflz tbOfficeDflz, RedirectAttributes redirectAttributes) {
		tbOfficeDflzService.delete(tbOfficeDflz);
		addMessage(redirectAttributes, "删除参加机关党风廉政建设活动情况成功");
		return "redirect:"+Global.getAdminPath()+"/accounts/tbOfficeDflz/list?repage";
	}

}