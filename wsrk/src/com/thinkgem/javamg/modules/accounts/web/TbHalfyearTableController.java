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
import com.thinkgem.javamg.modules.accounts.entity.TbHalfyearTable;
import com.thinkgem.javamg.modules.accounts.service.TbHalfyearTableService;

/**
 * 半年自查表维护Controller
 * @author wht
 * @version 2017-10-21
 */
@Controller
@RequestMapping(value = "${adminPath}/accounts/tbHalfyearTable")
public class TbHalfyearTableController extends BaseController {

	@Autowired
	private TbHalfyearTableService tbHalfyearTableService;
	
	@ModelAttribute
	public TbHalfyearTable get(@RequestParam(required=false) String id) {
		TbHalfyearTable entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tbHalfyearTableService.get(id);
		}
		if (entity == null){
			entity = new TbHalfyearTable();
		}
		return entity;
	}
	
	@RequiresPermissions("accounts:tbHalfyearTable:view")
	@RequestMapping(value = {"list", ""})
	public String list(TbHalfyearTable tbHalfyearTable, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TbHalfyearTable> page = tbHalfyearTableService.findPage(new Page<TbHalfyearTable>(request, response), tbHalfyearTable); 
		model.addAttribute("page", page);
		return "modules/accounts/tbHalfyearTableList";
	}

	@RequiresPermissions("accounts:tbHalfyearTable:view")
	@RequestMapping(value = "form")
	public String form(TbHalfyearTable tbHalfyearTable, Model model) {
		model.addAttribute("tbHalfyearTable", tbHalfyearTable);
		if(tbHalfyearTable.getId().equals("1")){
			return "modules/accounts/tbHalfyearTableForm";
		}else{
			return "modules/accounts/tbyearTableForm";
		}
		
	}

	@RequiresPermissions("accounts:tbHalfyearTable:edit")
	@RequestMapping(value = "save")
	public String save(TbHalfyearTable tbHalfyearTable, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, tbHalfyearTable)){
			return form(tbHalfyearTable, model);
		}
		tbHalfyearTableService.save(tbHalfyearTable);
		
		if(tbHalfyearTable.getId().equals("1")){
			addMessage(redirectAttributes, "保存半年自查表成功");
			return "redirect:"+Global.getAdminPath()+"/accounts/tbHalfyearTable/form?id=1";
		}else{
			addMessage(redirectAttributes, "保存年度考核表成功");
			return "redirect:"+Global.getAdminPath()+"/accounts/tbHalfyearTable/form?id=2";
		}
		
	}
	
	@RequiresPermissions("accounts:tbHalfyearTable:edit")
	@RequestMapping(value = "delete")
	public String delete(TbHalfyearTable tbHalfyearTable, RedirectAttributes redirectAttributes) {
		tbHalfyearTableService.delete(tbHalfyearTable);
		addMessage(redirectAttributes, "删除半年自查表成功");
		return "redirect:"+Global.getAdminPath()+"/accounts/tbHalfyearTable/?repage";
	}

}