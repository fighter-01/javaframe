/**
 * 
 */
package com.thinkgem.javamg.modules.cms.web;



import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.javamg.common.persistence.Page;
import com.thinkgem.javamg.common.web.BaseController;
import com.thinkgem.javamg.modules.cms.entity.CommentMessage;
import com.thinkgem.javamg.modules.cms.entity.Report;
import com.thinkgem.javamg.modules.cms.service.CommentMessageService;
import com.thinkgem.javamg.modules.cms.service.ReportService;
import com.thinkgem.javamg.modules.sys.utils.UserUtils;

/**
 * 推送Controller
 * 
 * @version 2013-3-23
 */
@Controller
@RequestMapping(value = "${adminPath}/cms/commentMessage")
public class CommentMessageController extends BaseController {

	@Autowired
	private CommentMessageService commentMessageService;
	
	@ModelAttribute
	public CommentMessage get(@RequestParam(required=false) String id) {
		if (org.apache.commons.lang3.StringUtils.isNotBlank(id)){
			return commentMessageService.get(id);
		}else{
			return new CommentMessage();
		}
	}
	
	@RequiresPermissions("cms:report:view")
	@RequestMapping(value = {"list", ""})
	public String list(CommentMessage commentMessage, HttpServletRequest request, HttpServletResponse response, Model model) {
//		for (int i=0; i<10000000; i++){
//			Article a = new Article();
//			a.setCategory(new Category(article.getCategory().getId()));
//			a.setTitle("测试测试测试测试测试测试测试测试"+a.getCategory().getId());
//			a.setArticleData(new ArticleData());
//			a.getArticleData().setContent(a.getTitle());
//			articleService.save(a);
//		}
        Page<CommentMessage> page = commentMessageService.findPage(new Page<CommentMessage>(request, response), commentMessage, true); 
        model.addAttribute("page", page);
		return "modules/cms/reportList";
	}

	@RequiresPermissions("cms:report:view")
	@RequestMapping(value = "form")
	public String form(CommentMessage commentMessage, Model model) {
		model.addAttribute("rssSource", commentMessage);
		return "modules/cms/rssSourceForm";
	}
	
	/**
	 * 保存举报信息接口
	 * @param report
	 * @param model
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "saveComment", method = RequestMethod.POST)
	@ResponseBody
	public String saveReport(@RequestBody CommentMessage commentMessage,HttpServletResponse response) {
		Map<String, Object> rtnMap = new LinkedHashMap<String, Object>();
		if(commentMessage!=null){
			commentMessageService.save(commentMessage);
			rtnMap.put("reportError", 0);
		}else{
			rtnMap.put("reportError", 1);
		}
		return renderString(response, rtnMap);
	}
	
	@RequiresPermissions("cms:rss:edit")
	@RequestMapping(value = "delete")
	public String delete(CommentMessage commentMessage, String categoryId, @RequestParam(required=false) Boolean isRe, RedirectAttributes redirectAttributes) {
		// 如果没有审核权限，则不允许删除或发布。
		if (!UserUtils.getSubject().isPermitted("cms:rssSource:audit")){
			addMessage(redirectAttributes, "你没有删除或发布权限");
		}
		commentMessageService.delete(commentMessage, isRe);
		addMessage(redirectAttributes, (isRe!=null&&isRe?"发布":"删除")+"RSS源成功");
		return "redirect:" + adminPath + "/cms/rssSource/?repage&category.id="+(categoryId!=null?categoryId:"");
	}
	
}
