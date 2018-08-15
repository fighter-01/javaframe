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
@RequestMapping(value = "${adminPath}/mobile/interactionMessage")
public class InteractionMessageController extends BaseController {

	@Autowired
	private ReportService reportService;
	
	@Autowired
	private CommentMessageService commentMessageService;
	
	/**
	 * 保存举报信息接口
	 * @param report
	 * @param model
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "saveReport", method = RequestMethod.POST)
	@ResponseBody
	public String saveReport(Report report,HttpServletResponse response) {
		Map<String, Object> rtnMap = new LinkedHashMap<String, Object>();
		if(report.getId()!=null){
			reportService.save(report);
			rtnMap.put("code", 0);
			rtnMap.put("message", "举报成功");
		}else{
			rtnMap.put("code", 1);
			rtnMap.put("message", "被举报消息id为空");
		}
		return renderString(response, rtnMap);
	}
	
	/**
	 * 保存评论信息接口
	 * @param report
	 * @param model
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "saveComment", method = RequestMethod.POST)
	@ResponseBody
	public String saveComment(CommentMessage commentMessage,HttpServletResponse response) {
		Map<String, Object> rtnMap = new LinkedHashMap<String, Object>();
		if(commentMessage.getId()!=null){
			commentMessageService.save(commentMessage);
			rtnMap.put("code", 0);
			rtnMap.put("message", "评论成功");
		}else{
			rtnMap.put("code", 1);
			rtnMap.put("message", "消息id为空");
			
		}
		return renderString(response, rtnMap);
	}
	
}
