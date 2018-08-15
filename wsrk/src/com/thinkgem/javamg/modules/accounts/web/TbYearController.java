/**
 * 
 */
package com.thinkgem.javamg.modules.accounts.web;

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

import com.thinkgem.javamg.common.config.Global;
import com.thinkgem.javamg.common.persistence.Page;
import com.thinkgem.javamg.common.utils.StringUtils;
import com.thinkgem.javamg.common.web.BaseController;
import com.thinkgem.javamg.modules.accounts.entity.TbHalfyear;
import com.thinkgem.javamg.modules.accounts.entity.TbHalfyearTable;
import com.thinkgem.javamg.modules.accounts.entity.TbYear;
import com.thinkgem.javamg.modules.accounts.service.TbHalfyearTableService;
import com.thinkgem.javamg.modules.accounts.service.TbYearService;
import com.thinkgem.javamg.modules.sys.entity.User;
import com.thinkgem.javamg.modules.sys.utils.UserUtils;

/**
 * 部门落实党风廉政建设责任制年度量化考评表Controller
 * @author wht
 * @version 2017-06-10
 */
@Controller
@RequestMapping(value = "${adminPath}/accounts/tbYear")
public class TbYearController extends BaseController {

	@Autowired
	private TbYearService tbYearService;
	@Autowired
	private  TbHalfyearTableService tbHalfyearTableService;
	@ModelAttribute
	public TbYear get(@RequestParam(required=false) String id) {
		TbYear entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tbYearService.get(id);
		}
		if (entity == null){
			entity = new TbYear();
		}
		return entity;
	}
	
	@RequiresPermissions("accounts:tbYear:view")
	@RequestMapping(value = {"list", ""})
	public String list(TbYear tbYear, HttpServletRequest request, HttpServletResponse response, Model model,
			@RequestParam(value="flag", required=true) String flag) {
	
		if(flag.equals("2")){
			tbYear.setStatus2("2");
			tbYear.setStatus1("3");
			tbYear.setStatus3("4");
			tbYear.setStatus4("6");
		}else if(flag.equals("3")){
			tbYear.setStatus5("3"); 
			tbYear.setStatus6("4");
		}
		Page<TbYear> page = tbYearService.findPage(new Page<TbYear>(request, response), tbYear); 
		model.addAttribute("page", page);
		//flag=1表示普通角色，flag=2表示审核角色
				if(flag.equals("1")){
					return "modules/accounts/tbYearList";
				}else if(flag.equals("2")){
					return "modules/accounts/shTbYearList";
				}else if(flag.equals("3")){
					return "modules/accounts/shHLDTbYearList";
				}else{
					return "";
				}
	}

	@RequiresPermissions("accounts:tbYear:view")
	@RequestMapping(value = "form")
	public String form(TbYear tbYear, Model model) {
		if (tbYear.getCompany()==null || tbYear.getCompany().getId()==null){
			tbYear.setCompany(UserUtils.getUser().getCompany());
		}
		if (tbYear.getOffice()==null || tbYear.getOffice().getId()==null){
			tbYear.setOffice(UserUtils.getUser().getOffice());
		}
		TbHalfyearTable tbHalfyearTable =  tbHalfyearTableService.get("1");
		tbYear.setTbHalfyearTable(tbHalfyearTable);
		model.addAttribute("tbYear", tbYear);
		return "modules/accounts/tbYearForm";
	}

	@RequiresPermissions("accounts:tbYear:view")
	@RequestMapping(value = "view")
	public String view(TbYear tbYear, Model model) {
		TbHalfyearTable tbHalfyearTable =  tbHalfyearTableService.get("1");
		tbYear.setTbHalfyearTable(tbHalfyearTable);
		model.addAttribute("tbYear", tbYear);
		return "modules/accounts/tbYearView";
	}
	
	@RequiresPermissions("accounts:tbYear:view")
	@RequestMapping(value = "shview")
	public String shView(TbYear tbYear, Model model) {
		TbHalfyearTable tbHalfyearTable =  tbHalfyearTableService.get("1");
		tbYear.setTbHalfyearTable(tbHalfyearTable);
		model.addAttribute("tbYear", tbYear);
		return "modules/accounts/shtbYearView";
	}
	
	
	@RequiresPermissions("accounts:tbYear:edit")
	@RequestMapping(value = "save")
	public String save(TbYear tbYear, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, tbYear)){
			return form(tbYear, model);
		}
		User user = UserUtils.getUser();
		tbYear.setCreateName(user.getName());
		tbYearService.save(tbYear);
		addMessage(redirectAttributes, "保存部门落实党风廉政建设责任制年度量化考评表成功");
		return "redirect:"+Global.getAdminPath()+"/accounts/tbYear/list?flag=1";
	}
	
	
	@ResponseBody
	@RequiresPermissions("accounts:tbYear:edit")
	@RequestMapping(value = "updateStatus")
	public String updateStatus(String id,String status ,String remarks) {
		
		tbYearService.updateStatus(id, status,remarks);
		return "1";
	}

	@RequiresPermissions("accounts:tbYear:edit")
	@RequestMapping(value = "delete")
	public String delete(TbYear tbYear, RedirectAttributes redirectAttributes) {
		tbYearService.delete(tbYear);
		addMessage(redirectAttributes, "删除部门落实党风廉政建设责任制年度量化考评表成功");
		return "redirect:"+Global.getAdminPath()+"/accounts/tbYear/?repage";
	}

}