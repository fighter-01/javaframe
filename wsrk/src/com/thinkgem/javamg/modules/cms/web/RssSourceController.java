/**
 * 
 */
package com.thinkgem.javamg.modules.cms.web;


import java.net.URL;

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
import com.thinkgem.javamg.modules.cms.entity.RSSSource;
import com.thinkgem.javamg.modules.cms.service.RssSourceService;
import com.thinkgem.javamg.modules.sys.utils.UserUtils;

/**
 * 推送Controller
 * 
 * @version 2013-3-23
 */
@Controller
@RequestMapping(value = "${adminPath}/cms/rssSource")
public class RssSourceController extends BaseController {

	@Autowired
	private RssSourceService rssSourceService;
	
	@ModelAttribute
	public RSSSource get(@RequestParam(required=false) String id) {
		if (org.apache.commons.lang3.StringUtils.isNotBlank(id)){
			return rssSourceService.get(id);
		}else{
			return new RSSSource();
		}
	}
	
	@RequiresPermissions("cms:rss:view")
	@RequestMapping(value = {"list", ""})
	public String list(RSSSource rssSource, HttpServletRequest request, HttpServletResponse response, Model model) {
//		for (int i=0; i<10000000; i++){
//			Article a = new Article();
//			a.setCategory(new Category(article.getCategory().getId()));
//			a.setTitle("测试测试测试测试测试测试测试测试"+a.getCategory().getId());
//			a.setArticleData(new ArticleData());
//			a.getArticleData().setContent(a.getTitle());
//			articleService.save(a);
//		}
        Page<RSSSource> page = rssSourceService.findPage(new Page<RSSSource>(request, response), rssSource, true); 
        model.addAttribute("page", page);
		return "modules/cms/rssSourceList";
	}

	@RequiresPermissions("cms:rss:view")
	@RequestMapping(value = "form")
	public String form(RSSSource rssSource, Model model) {
		model.addAttribute("rssSource", rssSource);
		return "modules/cms/rssSourceForm";
	}

	@RequiresPermissions("cms:rss:edit")
	@RequestMapping(value = "save")
	public String save(RSSSource rssSource, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, rssSource)){
			return form(rssSource, model);
		}
		rssSourceService.save(rssSource);
		addMessage(redirectAttributes, "保存RSS源:'" + StringUtils.abbr(rssSource.getRssName(),50) + "'成功");
		return "redirect:" + adminPath + "/cms/rssSource/?repage";
	}
	
	@RequiresPermissions("cms:rss:edit")
	@RequestMapping(value = "delete")
	public String delete(RSSSource rssSource, String categoryId, @RequestParam(required=false) Boolean isRe, RedirectAttributes redirectAttributes) {
		// 如果没有审核权限，则不允许删除或发布。
		if (!UserUtils.getSubject().isPermitted("cms:rssSource:audit")){
			addMessage(redirectAttributes, "你没有删除或发布权限");
		}
		rssSourceService.delete(rssSource, isRe);
		addMessage(redirectAttributes, (isRe!=null&&isRe?"发布":"删除")+"RSS源成功");
		return "redirect:" + adminPath + "/cms/rssSource/?repage&category.id="+(categoryId!=null?categoryId:"");
	}
	
}
