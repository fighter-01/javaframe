/**
 * 
 */
package com.thinkgem.javamg.modules.rmyhform.web;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.activiti.engine.impl.util.json.JSONObject;
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
import com.thinkgem.javamg.modules.rmyhform.entity.TbRmyhFile;
import com.thinkgem.javamg.modules.rmyhform.entity.TbRmyhKf;
import com.thinkgem.javamg.modules.rmyhform.service.TbRmyhFileService;
import com.thinkgem.javamg.modules.rmyhform.service.TbRmyhKfService;

/**
 * 扣分及扣分原因Controller
 * @author wht
 * @version 2016-10-15
 */
@Controller
@RequestMapping(value = "${adminPath}/rmyhform/tbRmyhKf")
public class TbRmyhKfController extends BaseController {

	@Autowired
	private TbRmyhKfService tbRmyhKfService;
	@Autowired
	private TbRmyhFileService tbRmyhFileService;
	
	@ModelAttribute
	public TbRmyhKf get(@RequestParam(required=false) String id) {
		TbRmyhKf entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tbRmyhKfService.get(id);
		}
		if (entity == null){
			entity = new TbRmyhKf();
		}
		return entity;
	}
	
	@RequiresPermissions("rmyhform:tbRmyhKf:view")
	@RequestMapping(value = {"list", ""})
	public String list(TbRmyhKf tbRmyhKf, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TbRmyhKf> page = tbRmyhKfService.findPage(new Page<TbRmyhKf>(request, response), tbRmyhKf); 
		model.addAttribute("page", page);
		return "modules/rmyhform/tbRmyhKfList";
	}

	@RequiresPermissions("rmyhform:tbRmyhKf:view")
	@RequestMapping(value = "form")
	public String form(TbRmyhKf tbRmyhKf, Model model) {
		model.addAttribute("tbRmyhKf", tbRmyhKf);
		return "modules/rmyhform/tbRmyhKfForm";
	}

	
	//保存评分及扣分原因方法
	@RequiresPermissions("rmyhform:tbRmyhKf:edit")
	@RequestMapping(value = "save")
	public String savePf(TbRmyhKf tbRmyhKf, Model model, RedirectAttributes redirectAttributes,
			@RequestParam(required=true) String formId,@RequestParam(required=true) String kfRs,@RequestParam(required=true) String  jfbzIdJson,
			@RequestParam(required=false) String fromflag,@RequestParam(required=true) String  kf,
			@RequestParam(required=true) String  officeId,@RequestParam(required=true) String  fileId,
			@RequestParam(required=true) String  flagId) {
		if (!beanValidator(model, tbRmyhKf)){
			return form(tbRmyhKf, model);
		}
		
		 HashMap<String, String> kfMap = new HashMap<String, String>();  
		 HashMap<String, String> kfRsMap = new HashMap<String, String>();  
		 HashMap<String, String> jfbzIdMap = new HashMap<String, String>();  
		 TbRmyhKf tbRmyhKfDele = new TbRmyhKf();
		 tbRmyhKfDele.setFlagId(flagId);
		 tbRmyhKfDele.setOfficeId(officeId);
		 tbRmyhKfDele.setRev1(formId);
		 tbRmyhKfService.delete(tbRmyhKfDele);  
		JSONObject kfJsonObj = new JSONObject(kf.replaceAll("&quot;","'"));
		Iterator<String> it = kfJsonObj.keys();
		while (it.hasNext()) {
			 String key = String.valueOf(it.next());  
	         String value = (String) kfJsonObj.get(key); 
	         if(key != null && !key.equals("")){
	        	  kfMap.put(key, value);  
	         }
	       
	           
		}
		JSONObject kfRsJsonObj = new JSONObject(kfRs.replaceAll("&quot;","'"));
		Iterator<String> itr = kfJsonObj.keys();
		while (itr.hasNext()) {
			 String key = String.valueOf(itr.next());  
	         String value = (String) kfRsJsonObj.get(key); 
	         if(key != null && !key.equals("")){
	        	  kfRsMap.put(key, value);
	         } 
	       
	           
		}
		
		JSONObject jfbzIdJsonObj = new JSONObject(jfbzIdJson.replaceAll("&quot;","'"));
		Iterator<String> itj = jfbzIdJsonObj.keys();
		while (itj.hasNext()) {
			 String key = String.valueOf(itj.next());  
	         String value = (String) jfbzIdJsonObj.get(key); 
	         if(key != null && !key.equals("")){
	        	 jfbzIdMap.put(key, value);
	         } 
	       
	           
		}
		float  kfallScore = 0;
		 for (String key : kfMap.keySet()) {
			 	
			
			 if(kfMap.get(key).equals("") && kfRsMap.get(key).equals("")){
				 continue;
			 }
			 TbRmyhKf tbRmyhKf1 = new TbRmyhKf();
			 tbRmyhKf1.setFlagId(flagId);
			 tbRmyhKf1.setRev1(formId);
			 tbRmyhKf1.setOfficeId(officeId);
			 tbRmyhKf1.setStandId(key);
			 tbRmyhKf1.setScore(kfMap.get(key));
			 tbRmyhKf1.setKfreason(kfRsMap.get(key));
			 tbRmyhKf1.setRemarks(jfbzIdMap.get(key));
			 tbRmyhKfService.save(tbRmyhKf1);
			 
			
			 kfallScore = kfallScore+ Float.parseFloat( kfMap.get(key));
		 }
		 	TbRmyhFile entity = tbRmyhFileService.get(fileId);
		 	
		 	 if(fromflag.equals("20")){
		 		entity.setStatus("4");
			 }else if(fromflag.equals("25")){
			 		entity.setStatus("5");
				 }else{
					 entity.setStatus("3");
			 }
			
			float all_score = Float.parseFloat(entity.getTbRmyhKhformInfo().getAllScore())-kfallScore;
			entity.setAllScore(String.valueOf(all_score));
		   tbRmyhFileService.save(entity);
		/*
		addMessage(redirectAttributes, "上报成功");*/
		 addMessage(redirectAttributes, "上报成功");
			return "redirect:"+Global.getAdminPath()+"/rmyhform/tbRmyhFile/list?repage";
	}
	@RequiresPermissions("rmyhform:tbRmyhKf:edit")
	@RequestMapping(value = "delete")
	public String delete(TbRmyhKf tbRmyhKf, RedirectAttributes redirectAttributes) {
		tbRmyhKfService.delete(tbRmyhKf);
		addMessage(redirectAttributes, "删除扣分原因成功");
		return "redirect:"+Global.getAdminPath()+"/rmyhform/tbRmyhKf/?repage";
	}

}