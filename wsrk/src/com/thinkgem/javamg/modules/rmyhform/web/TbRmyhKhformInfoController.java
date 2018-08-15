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
import com.thinkgem.javamg.common.web.BaseController;
import com.thinkgem.javamg.common.utils.StringUtils;
import com.thinkgem.javamg.modules.rmyhform.entity.TbRmyhKhformInfo;
import com.thinkgem.javamg.modules.rmyhform.service.TbRmyhKhformInfoService;

/**
 * 表单维护Controller
 * @author wht
 * @version 2016-09-20
 */
@Controller
@RequestMapping(value = "${adminPath}/rmyhform/tbRmyhKhformInfo")
public class TbRmyhKhformInfoController extends BaseController {

	@Autowired
	private TbRmyhKhformInfoService tbRmyhKhformInfoService;
	
	
	@ModelAttribute
	public TbRmyhKhformInfo get(@RequestParam(required=false) String id) {
		TbRmyhKhformInfo entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tbRmyhKhformInfoService.get(id);
		}
		if (entity == null){
			entity = new TbRmyhKhformInfo();
		}
		return entity;
	}
	
	@RequiresPermissions("rmyhform:tbRmyhKhformInfo:view")
	@RequestMapping(value = {"list", ""})
	public String list(TbRmyhKhformInfo tbRmyhKhformInfo, HttpServletRequest request, HttpServletResponse response, Model model) {
		List<TbRmyhKhformInfo> list = tbRmyhKhformInfoService.findList(tbRmyhKhformInfo); 
		model.addAttribute("list", list);
		return "modules/rmyhform/tbRmyhKhformInfoList";
	}

	@RequiresPermissions("rmyhform:tbRmyhKhformInfo:view")
	@RequestMapping(value = "form")
	public String form(TbRmyhKhformInfo tbRmyhKhformInfo, Model model,@RequestParam(required=false) String columnType,@RequestParam(required=true) String flag) {
		if (tbRmyhKhformInfo.getParent()!=null && StringUtils.isNotBlank(tbRmyhKhformInfo.getParent().getId())){
			tbRmyhKhformInfo.setParent(tbRmyhKhformInfoService.get(tbRmyhKhformInfo.getParent().getId()));
			// 获取排序号，最末节点排序号+30
			if (StringUtils.isBlank(tbRmyhKhformInfo.getId())){
				TbRmyhKhformInfo tbRmyhKhformInfoChild = new TbRmyhKhformInfo();
				tbRmyhKhformInfoChild.setParent(new TbRmyhKhformInfo(tbRmyhKhformInfo.getParent().getId()));
				List<TbRmyhKhformInfo> list = tbRmyhKhformInfoService.findList(tbRmyhKhformInfo); 
				if (list.size() > 0){
					tbRmyhKhformInfo.setSort(list.get(list.size()-1).getSort());
					if (tbRmyhKhformInfo.getSort() != null){
						tbRmyhKhformInfo.setSort(tbRmyhKhformInfo.getSort() + 30);
					}
				}
			}
		}
		if (tbRmyhKhformInfo.getSort() == null){
			tbRmyhKhformInfo.setSort(30);
		}
		 if(flag.equals("1")){
			int  i =   Integer.parseInt(columnType) +1;	
			String columnType1 = Integer.toString(i);
			model.addAttribute("columnType", columnType1);
			tbRmyhKhformInfo.setType(columnType1);
		} else if(flag.equals("2")){
			
			model.addAttribute("columnType", 0);
			tbRmyhKhformInfo.setType("0");
			
		} else{
			model.addAttribute("columnType", columnType);
		}
	
		model.addAttribute("flag", flag);
		model.addAttribute("tbRmyhKhformInfo", tbRmyhKhformInfo);
		return "modules/rmyhform/tbRmyhKhformInfoForm";
	}

	@RequiresPermissions("rmyhform:tbRmyhKhformInfo:edit")
	@RequestMapping(value = "save")
	public String save(TbRmyhKhformInfo tbRmyhKhformInfo, Model model, RedirectAttributes redirectAttributes) {
		/*if (!beanValidator(model, tbRmyhKhformInfo)){
			return form(tbRmyhKhformInfo, model,tbRmyhKhformInfo.getType(),"0");
		}*/
		tbRmyhKhformInfoService.save(tbRmyhKhformInfo);
		addMessage(redirectAttributes, "保存表单成功");
		return "redirect:"+Global.getAdminPath()+"/rmyhform/tbRmyhKhformInfo/?repage";
	}
	
	@RequiresPermissions("rmyhform:tbRmyhKhformInfo:edit")
	@RequestMapping(value = "delete")
	public String delete(TbRmyhKhformInfo tbRmyhKhformInfo, RedirectAttributes redirectAttributes) {
		tbRmyhKhformInfoService.delete(tbRmyhKhformInfo);
		addMessage(redirectAttributes, "删除表单成功");
		return "redirect:"+Global.getAdminPath()+"/rmyhform/tbRmyhKhformInfo/?repage";
	}

	@RequiresPermissions("user")
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(@RequestParam(required=false) String extId, HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		List<TbRmyhKhformInfo> list = tbRmyhKhformInfoService.findList(new TbRmyhKhformInfo());
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

	public TbRmyhKhformInfoService getTbRmyhKhformInfoService() {
		return tbRmyhKhformInfoService;
	}

	public void setTbRmyhKhformInfoService(
			TbRmyhKhformInfoService tbRmyhKhformInfoService) {
		this.tbRmyhKhformInfoService = tbRmyhKhformInfoService;
	}


	
}