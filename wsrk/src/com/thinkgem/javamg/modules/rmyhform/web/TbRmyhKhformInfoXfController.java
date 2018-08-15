/**
 * 
 */
package com.thinkgem.javamg.modules.rmyhform.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.javamg.common.config.Global;
import com.thinkgem.javamg.common.utils.StringUtils;
import com.thinkgem.javamg.common.web.BaseController;
import com.thinkgem.javamg.modules.rmyhform.entity.TbRmyhKhformInfo;
import com.thinkgem.javamg.modules.rmyhform.service.TbRmyhKhformInfoXfService;

/**
 * 下发的表结构Controller
 * @author wht
 * @version 2016-10-18
 */
@Controller
@RequestMapping(value = "${adminPath}/rmyhform/tbRmyhKhformInfoXf")
public class TbRmyhKhformInfoXfController extends BaseController {

	@Autowired
	private TbRmyhKhformInfoXfService tbRmyhKhformInfoXfService;
	
	@ModelAttribute
	public TbRmyhKhformInfo get(@RequestParam(required=false) String id) {
		TbRmyhKhformInfo entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tbRmyhKhformInfoXfService.get(id);
		}
		if (entity == null){
			entity = new TbRmyhKhformInfo();
		}
		return entity;
	}
	
	@RequiresPermissions("rmyhform:tbRmyhKhformInfoXf:view")
	@RequestMapping(value = {"list", ""})
	public String list(TbRmyhKhformInfo tbRmyhKhformInfoXf, HttpServletRequest request, HttpServletResponse response, Model model) {
		List<TbRmyhKhformInfo> list = tbRmyhKhformInfoXfService.findList(tbRmyhKhformInfoXf); 
		model.addAttribute("list", list);
		return "modules/rmyhform/tbRmyhKhformInfoXfList";
	}

	@RequiresPermissions("rmyhform:tbRmyhKhformInfoXf:view")
	@RequestMapping(value = "form")
	public String form(TbRmyhKhformInfo tbRmyhKhformInfoXf, Model model) {
		if (tbRmyhKhformInfoXf.getParent()!=null && StringUtils.isNotBlank(tbRmyhKhformInfoXf.getParent().getId())){
			tbRmyhKhformInfoXf.setParent(tbRmyhKhformInfoXfService.get(tbRmyhKhformInfoXf.getParent().getId()));
			// 获取排序号，最末节点排序号+30
			if (StringUtils.isBlank(tbRmyhKhformInfoXf.getId())){
				TbRmyhKhformInfo tbRmyhKhformInfoXfChild = new TbRmyhKhformInfo();
				tbRmyhKhformInfoXfChild.setParent(new TbRmyhKhformInfo(tbRmyhKhformInfoXf.getParent().getId()));
				List<TbRmyhKhformInfo> list = tbRmyhKhformInfoXfService.findList(tbRmyhKhformInfoXf); 
				if (list.size() > 0){
					tbRmyhKhformInfoXf.setSort(list.get(list.size()-1).getSort());
					if (tbRmyhKhformInfoXf.getSort() != null){
						tbRmyhKhformInfoXf.setSort(tbRmyhKhformInfoXf.getSort() + 30);
					}
				}
			}
		}
		if (tbRmyhKhformInfoXf.getSort() == null){
			tbRmyhKhformInfoXf.setSort(30);
		}
		model.addAttribute("tbRmyhKhformInfoXf", tbRmyhKhformInfoXf);
		return "modules/rmyhform/tbRmyhKhformInfoXfForm";
	}

	@RequiresPermissions("rmyhform:tbRmyhKhformInfoXf:edit")
	@RequestMapping(value = "save")
	public String save(TbRmyhKhformInfo tbRmyhKhformInfoXf, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, tbRmyhKhformInfoXf)){
			return form(tbRmyhKhformInfoXf, model);
		}
		tbRmyhKhformInfoXfService.save(tbRmyhKhformInfoXf);
		addMessage(redirectAttributes, "保存下发表成功");
		return "redirect:"+Global.getAdminPath()+"/rmyhform/tbRmyhKhformInfoXf/?repage";
	}
	
	@RequiresPermissions("rmyhform:tbRmyhKhformInfoXf:edit")
	@RequestMapping(value = "delete")
	public String delete(TbRmyhKhformInfo tbRmyhKhformInfoXf, RedirectAttributes redirectAttributes) {
		tbRmyhKhformInfoXfService.delete(tbRmyhKhformInfoXf);
		addMessage(redirectAttributes, "删除下发表成功");
		return "redirect:"+Global.getAdminPath()+"/rmyhform/tbRmyhKhformInfoXf/?repage";
	}

	@RequiresPermissions("user")
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(@RequestParam(required=false) String extId, HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		List<TbRmyhKhformInfo> list = tbRmyhKhformInfoXfService.findList(new TbRmyhKhformInfo());
		for (int i=0; i<list.size(); i++){
			TbRmyhKhformInfo e = list.get(i);
			if (StringUtils.isBlank(extId) || (extId!=null && !extId.equals(e.getId()) && e.getParentIds().indexOf(","+extId+",")==-1)){
				Map<String, Object> map = Maps.newHashMap();
				map.put("id", e.getId());
				map.put("pId", e.getParentId());
				map.put("name", e.getName());
				mapList.add(map);
			}
		}
		return mapList;
	}
	
}