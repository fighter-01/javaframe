/**
 * 
 */
package com.thinkgem.javamg.modules.cms.web;


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

import com.thinkgem.javamg.common.persistence.Page;
import com.thinkgem.javamg.common.utils.StringUtils;
import com.thinkgem.javamg.common.web.BaseController;
import com.thinkgem.javamg.modules.cms.entity.Push;
import com.thinkgem.javamg.modules.cms.service.PushService;
import com.thinkgem.javamg.modules.sys.utils.UserUtils;

/**
 * 推送Controller
 * 
 * @version 2013-3-23
 */
@Controller
@RequestMapping(value = "${adminPath}/cms/push")
public class PushController extends BaseController {

	@Autowired
	private PushService pushService;
	
	@ModelAttribute
	public Push get(@RequestParam(required=false) String id) {
		if (org.apache.commons.lang3.StringUtils.isNotBlank(id)){
			return pushService.get(id);
		}else{
			return new Push();
		}
	}
	
	@RequiresPermissions("cms:push:view")
	@RequestMapping(value = {"list", ""})
	public String list(Push push, HttpServletRequest request, HttpServletResponse response, Model model) {
//		for (int i=0; i<10000000; i++){
//			Article a = new Article();
//			a.setCategory(new Category(article.getCategory().getId()));
//			a.setTitle("测试测试测试测试测试测试测试测试"+a.getCategory().getId());
//			a.setArticleData(new ArticleData());
//			a.getArticleData().setContent(a.getTitle());
//			articleService.save(a);
//		}
        Page<Push> page = pushService.findPage(new Page<Push>(request, response), push, true); 
        model.addAttribute("page", page);
		return "modules/cms/pushList";
	}

	@RequiresPermissions("cms:push:view")
	@RequestMapping(value = "form")
	public String form(Push push, Model model) {
		return "modules/cms/pushForm";
	}

	@RequiresPermissions("cms:push:edit")
	@RequestMapping(value = "save")
	public String save(Push push, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, push)){
			return form(push, model);
		}
		pushService.save(push);
		addMessage(redirectAttributes, "保存推送'" + StringUtils.abbr(push.getContent(),50) + "'成功");
		return "redirect:" + adminPath + "/cms/push/?repage";
	}
	
	@RequiresPermissions("cms:push:edit")
	@RequestMapping(value = "delete")
	public String delete(Push push, String categoryId, @RequestParam(required=false) Boolean isRe, RedirectAttributes redirectAttributes) {
		// 如果没有审核权限，则不允许删除或发布。
		if (!UserUtils.getSubject().isPermitted("cms:push:audit")){
			addMessage(redirectAttributes, "你没有删除或发布权限");
		}
		pushService.delete(push, isRe);
		addMessage(redirectAttributes, (isRe!=null&&isRe?"发布":"删除")+"文章成功");
		return "redirect:" + adminPath + "/cms/push/?repage&category.id="+(categoryId!=null?categoryId:"");
	}
}
