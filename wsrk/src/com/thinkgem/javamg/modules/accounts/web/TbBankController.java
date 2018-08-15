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
import com.thinkgem.javamg.modules.accounts.entity.TbBank;
import com.thinkgem.javamg.modules.accounts.service.TbBankService;
import com.thinkgem.javamg.modules.sys.entity.User;
import com.thinkgem.javamg.modules.sys.utils.UserUtils;

/**
 * 个人有关金融事项报告表Controller
 * @author wht
 * @version 2017-09-26
 */
@Controller
@RequestMapping(value = "${adminPath}/accounts/tbBank")
public class TbBankController extends BaseController {

	@Autowired
	private TbBankService tbBankService;
	
	@ModelAttribute
	public TbBank get(@RequestParam(required=false) String id) {
		TbBank entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tbBankService.get(id);
		}
		if (entity == null){
			entity = new TbBank();
		}
		return entity;
	}
	
	@RequiresPermissions("accounts:tbBank:view")
	@RequestMapping(value = {"list", ""})
	public String list(TbBank tbBank, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TbBank> page = tbBankService.findPage(new Page<TbBank>(request, response), tbBank); 
		model.addAttribute("page", page);
		return "modules/accounts/tbBankList";
	}

	@RequiresPermissions("accounts:tbBank:view")
	@RequestMapping(value = "form")
	public String form(TbBank tbBank, Model model) {
		
		if (tbBank.getCompany()==null || tbBank.getCompany().getId()==null){
			tbBank.setCompany(UserUtils.getUser().getCompany());
		}
		if (tbBank.getOffice()==null || tbBank.getOffice().getId()==null){
			tbBank.setOffice(UserUtils.getUser().getOffice());
		}
		model.addAttribute("tbBank", tbBank);
		return "modules/accounts/tbBankForm";
	}

	@RequiresPermissions("accounts:tbBank:edit")
	@RequestMapping(value = "save")
	public String save(TbBank tbBank, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, tbBank)){
			return form(tbBank, model);
		}
		tbBankService.save(tbBank);
		addMessage(redirectAttributes, "保存个人有关金融事项报告表成功");
		return "redirect:"+Global.getAdminPath()+"/accounts/tbBank/?repage";
	}
	
	@RequiresPermissions("accounts:tbBank:edit")
	@RequestMapping(value = "delete")
	public String delete(TbBank tbBank, RedirectAttributes redirectAttributes) {
		tbBankService.delete(tbBank);
		addMessage(redirectAttributes, "删除个人有关金融事项报告表成功");
		return "redirect:"+Global.getAdminPath()+"/accounts/tbBank/?repage";
	}

}