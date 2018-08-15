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
import com.thinkgem.javamg.modules.cms.entity.RSSSource;
import com.thinkgem.javamg.modules.cms.entity.RSSSpider;
import com.thinkgem.javamg.modules.cms.service.PushService;
import com.thinkgem.javamg.modules.cms.service.RssSpiderService;
import com.thinkgem.javamg.modules.sys.utils.UserUtils;

/**
 * 推送Controller
 * 
 * @version 2013-3-23
 */
@Controller
@RequestMapping(value = "${adminPath}/cms/rssSpider")
public class RssSpiderController extends BaseController {

	@Autowired
	private RssSpiderService rssSpiderService;
	
	@ModelAttribute
	public RSSSpider get(@RequestParam(required=false) String id) {
		if (org.apache.commons.lang3.StringUtils.isNotBlank(id)){
			return rssSpiderService.get(id);
		}else{
			return new RSSSpider();
		}
	}
	
	@RequiresPermissions("cms:rss:view")
	@RequestMapping(value = {"list", ""})
	public String list(RSSSpider rssSpider, HttpServletRequest request, HttpServletResponse response, Model model) {
//		for (int i=0; i<10000000; i++){
//			Article a = new Article();
//			a.setCategory(new Category(article.getCategory().getId()));
//			a.setTitle("测试测试测试测试测试测试测试测试"+a.getCategory().getId());
//			a.setArticleData(new ArticleData());
//			a.getArticleData().setContent(a.getTitle());
//			articleService.save(a);
//		}
        Page<RSSSpider> page = rssSpiderService.findPage(new Page<RSSSpider>(request, response), rssSpider, true); 
        model.addAttribute("page", page);
		return "modules/cms/rssSpiderList";
	}

	@RequiresPermissions("cms:rss:view")
	@RequestMapping(value = "form")
	public String form(RSSSpider rssSpider, Model model) {
		model.addAttribute("rssSpider", rssSpider);
		return "modules/cms/rssSpiderForm";
	}

	@RequiresPermissions("cms:rss:edit")
	@RequestMapping(value = "save")
	public String save(RSSSpider rssSpider, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, rssSpider)){
			return form(rssSpider, model);
		}
		rssSpiderService.save(rssSpider);
		addMessage(redirectAttributes, "保存新闻'" + StringUtils.abbr(rssSpider.getTitle(),50) + "'成功");
		return "redirect:" + adminPath + "/cms/rssSpider/?repage";
	}
	
	@RequiresPermissions("cms:rss:edit")
	@RequestMapping(value = "delete")
	public String delete(RSSSpider rssSpider, String categoryId, @RequestParam(required=false) Boolean isRe, RedirectAttributes redirectAttributes) {
		// 如果没有审核权限，则不允许删除或发布。
		if (!UserUtils.getSubject().isPermitted("cms:rss:audit")){
			addMessage(redirectAttributes, "你没有删除或发布权限");
		}
		rssSpiderService.delete(rssSpider, isRe);
		addMessage(redirectAttributes, (isRe!=null&&isRe?"发布":"删除")+"文章成功");
		return "redirect:" + adminPath + "/cms/rssSpider/?repage&category.id="+(categoryId!=null?categoryId:"");
	}
	
	@RequiresPermissions("cms:rss:edit")
	@RequestMapping(value = "getNews")
	public String getNews(RSSSource rssSource, Model model, RedirectAttributes redirectAttributes,@RequestParam(required=false) Boolean isRe) {
		
		rssSpiderService.getNews(rssSource, isRe);
		addMessage(redirectAttributes, "爬取新闻成功");
		return "redirect:" + adminPath + "/cms/rssSource/?repage";
	}
}
