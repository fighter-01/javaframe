/**
 * 
 */
package com.thinkgem.javamg.modules.rmyhkh.web;

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
import com.thinkgem.javamg.modules.rmyhkh.entity.TbRmyhKhnameInfo;
import com.thinkgem.javamg.modules.rmyhkh.service.TbRmyhKhnameInfoService;

/**
 * 考核表单名列表Controller
 * @author wht
 * @version 2016-09-19
 */
@Controller
@RequestMapping(value = "${adminPath}/rmyhkh/tbRmyhKhnameInfo")
public class TbRmyhKhnameInfoController extends BaseController {

	@Autowired
	private TbRmyhKhnameInfoService tbRmyhKhnameInfoService;
	
	@ModelAttribute
	public TbRmyhKhnameInfo get(@RequestParam(required=false) String id) {
		TbRmyhKhnameInfo entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tbRmyhKhnameInfoService.get(id);
		}
		if (entity == null){
			entity = new TbRmyhKhnameInfo();
		}
		return entity;
	}
	
	@RequiresPermissions("rmyhkh:tbRmyhKhnameInfo:view")
	@RequestMapping(value = {"list", ""})
	public String list(TbRmyhKhnameInfo tbRmyhKhnameInfo, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TbRmyhKhnameInfo> page = tbRmyhKhnameInfoService.findPage(new Page<TbRmyhKhnameInfo>(request, response), tbRmyhKhnameInfo); 
		model.addAttribute("page", page);
		return "modules/rmyhkh/tbRmyhKhnameInfoList";
	}

	@RequiresPermissions("rmyhkh:tbRmyhKhnameInfo:view")
	@RequestMapping(value = "form")
	public String form(TbRmyhKhnameInfo tbRmyhKhnameInfo, Model model) {
		model.addAttribute("tbRmyhKhnameInfo", tbRmyhKhnameInfo);
		return "modules/rmyhkh/tbRmyhKhnameInfoForm";
	}

	@RequiresPermissions("rmyhkh:tbRmyhKhnameInfo:edit")
	@RequestMapping(value = "save")
	public String save(TbRmyhKhnameInfo tbRmyhKhnameInfo, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, tbRmyhKhnameInfo)){
			return form(tbRmyhKhnameInfo, model);
		}
		tbRmyhKhnameInfoService.save(tbRmyhKhnameInfo);
		addMessage(redirectAttributes, "保存考核表名成功");
		return "redirect:"+Global.getAdminPath()+"/rmyhkh/tbRmyhKhnameInfo/?repage";
	}
	
	@RequiresPermissions("rmyhkh:tbRmyhKhnameInfo:edit")
	@RequestMapping(value = "delete")
	public String delete(TbRmyhKhnameInfo tbRmyhKhnameInfo, RedirectAttributes redirectAttributes) {
		tbRmyhKhnameInfoService.delete(tbRmyhKhnameInfo);
		addMessage(redirectAttributes, "删除考核表名成功");
		return "redirect:"+Global.getAdminPath()+"/rmyhkh/tbRmyhKhnameInfo/?repage";
	}

}