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
import com.thinkgem.javamg.modules.accounts.entity.TbOfficeDflz;
import com.thinkgem.javamg.modules.accounts.service.TbAffairsOpenService;
import com.thinkgem.javamg.modules.sys.entity.User;
import com.thinkgem.javamg.modules.sys.utils.UserUtils;

/**
 * 行(政)务公开情况Controller
 * @author wht
 * @version 2017-06-02
 */
@Controller
@RequestMapping(value = "${adminPath}/accounts/tbAffairsOpen")
public class TbAffairsOpenController extends BaseController {

	@Autowired
	private TbAffairsOpenService tbAffairsOpenService;
	
	@ModelAttribute
	public TbAffairsOpen get(@RequestParam(required=false) String id) {
		TbAffairsOpen entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tbAffairsOpenService.get(id);
		}
		if (entity == null){
			entity = new TbAffairsOpen();
		}
		return entity;
	}
	
	@RequiresPermissions("accounts:tbAffairsOpen:view")
	@RequestMapping(value = {"list", ""})
	public String list(TbAffairsOpen tbAffairsOpen, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TbAffairsOpen> page = tbAffairsOpenService.findPage(new Page<TbAffairsOpen>(request, response), tbAffairsOpen); 
		model.addAttribute("page", page);
		return "modules/accounts/tbAffairsOpenList";
	}
	
	@RequiresPermissions("accounts:tbAffairsOpen:view")
	@RequestMapping(value = {"scoreView", ""})
	public String scoreView(TbAffairsOpen tbAffairsOpen, Model model) {
		
		model.addAttribute("tbAffairsOpen", tbAffairsOpen);
		return "modules/accounts/tbAffairsOpenScoreView";
		
	}
	@RequiresPermissions("accounts:tbAffairsOpen:view")
	@RequestMapping(value = "form")
	public String form(TbAffairsOpen tbAffairsOpen, Model model) {
		if (tbAffairsOpen.getCompany()==null || tbAffairsOpen.getCompany().getId()==null){
			tbAffairsOpen.setCompany(UserUtils.getUser().getCompany());
		}
		if (tbAffairsOpen.getOffice()==null || tbAffairsOpen.getOffice().getId()==null){
			tbAffairsOpen.setOffice(UserUtils.getUser().getOffice());
		}
		model.addAttribute("tbAffairsOpen", tbAffairsOpen);
		return "modules/accounts/tbAffairsOpenForm";
	}

	@RequiresPermissions("accounts:tbAffairsOpen:edit")
	@RequestMapping(value = "save")
	public String save(TbAffairsOpen tbAffairsOpen, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, tbAffairsOpen)){
			return form(tbAffairsOpen, model);
		}
		User user = UserUtils.getUser();
		tbAffairsOpen.setCreateName(user.getName());
		tbAffairsOpenService.save(tbAffairsOpen);
		addMessage(redirectAttributes, "保存行(政)务公开情况成功");
		return "redirect:"+Global.getAdminPath()+"/accounts/tbAffairsOpen/list?repage";
	}
	
	@RequiresPermissions("accounts:tbAffairsOpen:edit")
	@RequestMapping(value = "delete")
	public String delete(TbAffairsOpen tbAffairsOpen, RedirectAttributes redirectAttributes) {
		tbAffairsOpenService.delete(tbAffairsOpen);
		addMessage(redirectAttributes, "删除行(政)务公开情况成功");
		return "redirect:"+Global.getAdminPath()+"/accounts/tbAffairsOpen/list?repage";
	}

}