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
import com.thinkgem.javamg.modules.cms.entity.Report;
import com.thinkgem.javamg.modules.cms.service.ReportService;
import com.thinkgem.javamg.modules.sys.utils.UserUtils;

/**
 * 推送Controller
 * 
 * @version 2013-3-23
 */
@Controller
@RequestMapping(value = "${adminPath}/cms/report")
public class ReportController extends BaseController {

	@Autowired
	private ReportService reportService;
	
	@ModelAttribute
	public Report get(@RequestParam(required=false) String id) {
		if (org.apache.commons.lang3.StringUtils.isNotBlank(id)){
			return reportService.get(id);
		}else{
			return new Report();
		}
	}
	
	@RequiresPermissions("cms:report:view")
	@RequestMapping(value = {"list", ""})
	public String list(Report report, HttpServletRequest request, HttpServletResponse response, Model model) {
//		for (int i=0; i<10000000; i++){
//			Article a = new Article();
//			a.setCategory(new Category(article.getCategory().getId()));
//			a.setTitle("测试测试测试测试测试测试测试测试"+a.getCategory().getId());
//			a.setArticleData(new ArticleData());
//			a.getArticleData().setContent(a.getTitle());
//			articleService.save(a);
//		}
        Page<Report> page = reportService.findPage(new Page<Report>(request, response), report, true); 
        model.addAttribute("page", page);
		return "modules/cms/reportList";
	}

	@RequiresPermissions("cms:report:view")
	@RequestMapping(value = "form")
	public String form(Report report, Model model) {
		model.addAttribute("rssSource", report);
		return "modules/cms/rssSourceForm";
	}
	
	/**
	 * 保存举报信息接口
	 * @param report
	 * @param model
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "saveReport", method = RequestMethod.POST)
	@ResponseBody
	public String saveReport(@RequestBody Report report,HttpServletResponse response) {
		Map<String, Object> rtnMap = new LinkedHashMap<String, Object>();
		if(report!=null){
			reportService.save(report);
			rtnMap.put("reportError", 0);
		}else{
			rtnMap.put("reportError", 1);
		}
		return renderString(response, rtnMap);
	}
	
	@RequiresPermissions("cms:rss:edit")
	@RequestMapping(value = "delete")
	public String delete(Report report, String categoryId, @RequestParam(required=false) Boolean isRe, RedirectAttributes redirectAttributes) {
		// 如果没有审核权限，则不允许删除或发布。
		if (!UserUtils.getSubject().isPermitted("cms:rssSource:audit")){
			addMessage(redirectAttributes, "你没有删除或发布权限");
		}
		reportService.delete(report, isRe);
		addMessage(redirectAttributes, (isRe!=null&&isRe?"发布":"删除")+"RSS源成功");
		return "redirect:" + adminPath + "/cms/rssSource/?repage&category.id="+(categoryId!=null?categoryId:"");
	}
	
}
