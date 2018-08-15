/**
 * 
 */
package com.thinkgem.javamg.modules.accounts.web;

import java.text.SimpleDateFormat;
import java.util.List;

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
import com.thinkgem.javamg.modules.accounts.entity.AllAccountsModel;
import com.thinkgem.javamg.modules.accounts.entity.TbAccountsScore;
import com.thinkgem.javamg.modules.accounts.service.TbAccountsScoreService;
import com.thinkgem.javamg.modules.sys.entity.Office;

/**
 * 台账评分Controller
 * @author wht
 * @version 2017-09-01
 */
@Controller
@RequestMapping(value = "${adminPath}/accounts/tbAccountsScore")
public class TbAccountsScoreController extends BaseController {

	@Autowired
	private TbAccountsScoreService tbAccountsScoreService;
	
	@ModelAttribute
	public TbAccountsScore get(@RequestParam(required=false) String id) {
		TbAccountsScore entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = tbAccountsScoreService.get(id);
		}
		if (entity == null){
			entity = new TbAccountsScore();
		}
		return entity;
	}
	
	@RequiresPermissions("accounts:tbAccountsScore:view")
	@RequestMapping(value = {"list", ""})
	public String list(TbAccountsScore tbAccountsScore, HttpServletRequest request, HttpServletResponse response, Model model) {
		if(tbAccountsScore.getOffice() == null  || tbAccountsScore.getOffice().getId() == null || tbAccountsScore.getOffice().getId().equals("")){
			model.addAttribute("tbAccountsScore", tbAccountsScore);
			return "modules/accounts/tbAccountsScoreList";
		}
		Page<TbAccountsScore> page = tbAccountsScoreService.findPage(new Page<TbAccountsScore>(request, response), tbAccountsScore); 
		model.addAttribute("page", page);
		return "modules/accounts/tbAccountsScoreList";
	}

	@RequiresPermissions("accounts:tbAccountsScore:view")
	@RequestMapping(value = "form")
	public String form(TbAccountsScore tbAccountsScore, Model model) {
		model.addAttribute("tbAccountsScore", tbAccountsScore);
		return "modules/accounts/tbAccountsScoreForm";
	}

	@RequiresPermissions("accounts:tbAccountsScore:edit")
	@RequestMapping(value = "save")
	public String save(TbAccountsScore tbAccountsScore, Model model, RedirectAttributes redirectAttributes) {
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy"); 
		TbAccountsScore tbAccount = new TbAccountsScore();
		tbAccount.setOffice(tbAccountsScore.getOffice());
		tbAccount.setJidu(tbAccountsScore.getJidu());
		tbAccount.setYear(sdf.format(tbAccountsScore.getYear()));
		List<TbAccountsScore> list = tbAccountsScoreService.findList(tbAccount);
		if((tbAccountsScore.getId() == null || tbAccountsScore.getId().equals("")) && list !=null && list.size()>0){
			addMessage(redirectAttributes, "添加失败！该季度已经评分完成！！");
			return "redirect:"+Global.getAdminPath()+"/accounts/tbAccountsScore/list?repage";
		}
		tbAccount.setScore(tbAccountsScore.getScore());
		tbAccount.setRemarks(tbAccountsScore.getRemarks());
		if(tbAccountsScore.getId() != null ){
			tbAccount.setId(tbAccountsScore.getId());
		}
		
		
		tbAccountsScoreService.save(tbAccount);
		addMessage(redirectAttributes, "保存台账评分成功");
		return "redirect:"+Global.getAdminPath()+"/accounts/tbAccountsScore/list?repage";
	}
	
	
	@RequiresPermissions("accounts:tbAccountsScore:edit")
	@ResponseBody
	@RequestMapping(value = "layersave")
	public String layersave(TbAccountsScore tbAccountsScore,Model model, RedirectAttributes redirectAttributes,
			@RequestParam(required=true) String officeId, @RequestParam(required=true) String year, 
			@RequestParam(required=true) String jidu,@RequestParam(required=true) String score,
			@RequestParam(required=false) String remarks ) {
		Office office = new Office();
		office.setId(officeId);
		tbAccountsScore.setOffice(office);
		tbAccountsScore.setJidu(jidu);
		tbAccountsScore.setYear(year);
		List<TbAccountsScore> list = tbAccountsScoreService.findList(tbAccountsScore);
		if(list !=null && list.size()>0){
			return "0";
		}
		tbAccountsScore.setScore(score);
		tbAccountsScore.setRemarks(remarks);
	
	
		tbAccountsScoreService.save(tbAccountsScore);
		addMessage(redirectAttributes, "保存台账评分成功");
		return "1";
		}
	
	@RequiresPermissions("accounts:tbAccountsScore:edit")
	@RequestMapping(value = "layer")
	public String layer(TbAccountsScore tbAccountsScore, Model model) {
		
		model.addAttribute("tbAccountsScore", tbAccountsScore);
		return "modules/accounts/layerScoreForm";
	}
	
	@RequiresPermissions("accounts:tbAccountsScore:edit")
	@RequestMapping(value = "delete")
	public String delete(TbAccountsScore tbAccountsScore, RedirectAttributes redirectAttributes) {
		tbAccountsScoreService.delete(tbAccountsScore);
		addMessage(redirectAttributes, "删除台账评分成功");
		return "redirect:"+Global.getAdminPath()+"/accounts/tbAccountsScore/list?repage";
	}

	
	@RequiresPermissions("accounts:tbAccountsScore:view")
	@RequestMapping(value = {"index"})
	public String index() {
		return "modules/accounts/scorIndex";
	}
	
	@RequiresPermissions("accounts:tbAccountsScore:view")
	@RequestMapping(value = {"sumindex"})
	public String sumIndex() {
		return "modules/accounts/scorSumIndex";
	}
	
	@RequiresPermissions("accounts:tbAccountsScore:view")
	@RequestMapping(value = {"socre", ""})
	public String socre(TbAccountsScore tbAccountsScore, Model model,@RequestParam(required=false) String officeId) {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy"); 
		if(tbAccountsScore.getYear() == null){
			tbAccountsScore.setYear(MyDateUtils.getCurrentYear());
		}
		if(tbAccountsScore.getJidu() == null){
			tbAccountsScore.setJidu(MyDateUtils.getCurrentQuarter());
		}
		if(officeId == null || officeId.equals("")){
			return "modules/accounts/scoreList";
		}
		tbAccountsScore.setOfficeId(officeId);
		//tbAccountsScore.setYear();
		AllAccountsModel allAccountsModel = new AllAccountsModel();
		allAccountsModel.setOfficeId(officeId);
		String year = sdf.format(tbAccountsScore.getYear());
		String moth = MyDateUtils.getMothByQuarter(tbAccountsScore.getJidu());
		allAccountsModel.setBeginLrDate(MyDateUtils.getCurrentQuarterStartTime(year+"-"+moth+"-00"));
		allAccountsModel.setEndLrDate(MyDateUtils.getCurrentQuarterEndTime(year+"-"+moth+"-00"));
		List<AllAccountsModel> list= tbAccountsScoreService.findAllAccountsList(allAccountsModel);
		
		model.addAttribute("list",list );
		return "modules/accounts/scoreList";
	}	
}