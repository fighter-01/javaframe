/**
 * 
 */
package com.thinkgem.javamg.modules.rmyhform.web;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ColumnListHandler;
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
import com.thinkgem.javamg.common.utils.FileUtils;
import com.thinkgem.javamg.common.utils.StringUtils;
import com.thinkgem.javamg.common.web.BaseController;
import com.thinkgem.javamg.common.web.Servlets;
import com.thinkgem.javamg.modules.rmyhform.entity.RowDataInfo;
import com.thinkgem.javamg.modules.rmyhform.entity.TbRmyhFile;
import com.thinkgem.javamg.modules.rmyhform.entity.TbRmyhKf;
import com.thinkgem.javamg.modules.rmyhform.entity.TbRmyhKhformInfo;
import com.thinkgem.javamg.modules.rmyhform.service.TbRmyhFileService;
import com.thinkgem.javamg.modules.rmyhform.service.TbRmyhKfService;
import com.thinkgem.javamg.modules.rmyhform.service.TbRmyhKhformInfoService;
import com.thinkgem.javamg.modules.rmyhform.service.TbRmyhKhformInfoXfService;
import com.thinkgem.javamg.modules.sys.dao.OfficeDao;
import com.thinkgem.javamg.modules.sys.entity.Office;
import com.thinkgem.javamg.modules.sys.entity.User;
import com.thinkgem.javamg.modules.sys.utils.UserUtils;

/**
 * 表单预览Controller
 * @author wht
 * @version 2016-09-20
 */
@Controller
@RequestMapping(value = "${adminPath}/rmyhform/khformview")
public class KhformViewController extends BaseController {

	@Autowired
	private TbRmyhKhformInfoService tbRmyhKhformInfoService;
	
	@Autowired
	private TbRmyhFileService tbRmyhFileService;
	@Autowired
	private TbRmyhKfService tbRmyhKfService;
	@Autowired
	private TbRmyhKhformInfoXfService tbRmyhKhformInfoXfService;
	@Autowired
	private OfficeDao officeDao;
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
	
	@RequiresPermissions("rmyhform:khformview:view")
	@RequestMapping(value = {"view", ""})
	public String list(TbRmyhKhformInfo tbRmyhKhformInfo, HttpServletRequest request, HttpServletResponse response,  Model model,
			@RequestParam(required=false) String id,
			@RequestParam(required=false) String fromflag,@RequestParam(required=false) String fileId ,@RequestParam(required=false) String officeId,@RequestParam(required=false) String flagId,@RequestParam(required=false) String officename) throws UnsupportedEncodingException {
		//fromflag 为表的状态  0为考核表未下发时的状态，1为下发未上报状态，2为上报为审核状态，3为审核为提交状态  4为评分完毕状态
			if(id != null &&  !fromflag.equals("0")){
				
				TbRmyhKhformInfo entity =  new TbRmyhKhformInfo();
				entity.setId(id);
				entity.setFlagId(flagId);
				 
				model.addAttribute("title",tbRmyhKhformInfoXfService.get(entity).getName());
				System.out.println(entity.getName());
			}
		if(fromflag.equals("0")){
		    TbRmyhKhformInfo tbkhFormName = new TbRmyhKhformInfo();
		    tbkhFormName.setType("0");
		    tbkhFormName.setXfFlag("0");
			List<TbRmyhKhformInfo> formNameList = tbRmyhKhformInfoService.findList(tbkhFormName); 
			model.addAttribute("formNameList", formNameList);
			if((formNameList == null || formNameList.size() < 1) ){
				return "modules/rmyhform/khFormNull";
			}
			//首次进入表单预览时，设置id为第一个表单的id
			if( id == null  ){
				id =formNameList.get(0).getId();
				model.addAttribute("title",formNameList.get(0).getName());
			}else{
				TbRmyhKhformInfo entity = tbRmyhKhformInfoService.get(id);
				model.addAttribute("title",entity.getName());
			}
			
		}
		model.addAttribute("fileId", fileId);
		model.addAttribute("fromflag", fromflag);
		model.addAttribute("flagId", flagId);
		
		if(officeId != null &&  !"".equals(officeId)){
			model.addAttribute("officeId", officeId);
		 }else{
			 officeId = UserUtils.getUser().getCompany().getId(); 
		 }
			Office khformOfficetemp = new Office();
			khformOfficetemp.setId(officeId);
		  Office khformOffice = officeDao.get(khformOfficetemp);
			List<RowDataInfo>  rowData = null;
			if(id != null){
				 rowData  = table(id,fromflag,officeId,flagId);
				 model.addAttribute("id",id);
			}
			//model.addAttribute("map", arrMap);
			// List<RowDataInfo>  rowData = table(id);
			 model.addAttribute("rowData", rowData);
			 model.addAttribute("officename", khformOffice.getName());
			 if(fromflag.equals("30")){
				
				 //打印页面
				 return "modules/rmyhform/printScoreView";
			 }else{
				 return "modules/rmyhform/khFormView";
			 }
			
		
			
	}

	
	/**
	 * 
	 * @Description: 考核评分
	 * @param user
	 * @param model
	 * @return   
	 * @return String  
	 * @author 王宏涛
	 * @date 2016-10-13
	 */
	@RequiresPermissions("rmyhform:khformview:view")
	@RequestMapping(value = {"index"})
	public String index(TbRmyhKhformInfo tbRmyhKhformInfo, Model model) {
		return "modules/rmyhform/scorIndex";
	}
	@RequiresPermissions("rmyhform:khformview:view")
	@RequestMapping(value = {"index1"})
	public String index1(TbRmyhKhformInfo tbRmyhKhformInfo, Model model) {
		return "modules/rmyhform/scorIndexSH1";
	}
	@RequiresPermissions("rmyhform:khformview:view")
	@RequestMapping(value = {"index2"})
	public String index2(TbRmyhKhformInfo tbRmyhKhformInfo, Model model) {
		return "modules/rmyhform/scorIndexSH2";
	}
	/**
	 * 
	 * @Description: 返回以父类为主键，子类list为value
	 * @param tbRmyhKhformInfo
	 * @param request
	 * @return   
	 * @return Map<String,List<TbRmyhKhformInfo>>  
	 * @author 王宏涛
	 * @date 2016-9-28
	 */
	
	public List<RowDataInfo> table( String id,String fromflag,String officeId,String flagId) {
			 
			
		 	TbRmyhKhformInfo  tbRmyhKhformInfoPa = new TbRmyhKhformInfo();
		 	tbRmyhKhformInfoPa.setParentIds(id);
		 	
		 	List<TbRmyhKhformInfo> list;
		 	List<String> sqlGroupList = null;
		 	if(fromflag.equals("0")){
		 		 list = tbRmyhKhformInfoService.findList(tbRmyhKhformInfoPa); 
//		 		jdbc.url=jdbc:mysql://127.0.0.1:3306/javamg?useUnicode=true&characterEncoding=utf-8
			 	//利用commons-dbutils-1.5.jar
				QueryRunner qr = new QueryRunner();
				Connection connection = getJdbcConnection(Global.getConfig("jdbc.url"), Global.getConfig("jdbc.username"), Global.getConfig("jdbc.password"), "com.mysql.jdbc.Driver");
				//用父Id分组查询,找到所有的父ID然后循环这个List查询
				String sqlGroup = "select parent_id from  tb_rmyh_khform_info t where t.parent_ids LIKE '%"+id +"%' group by t.parent_id ";
				
				try {
				  sqlGroupList = (List<String>)qr.query(connection, sqlGroup, new String[]{}, new ColumnListHandler("parent_id"));
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		 	}else{
		 			tbRmyhKhformInfoPa.setFlagId(flagId);
		 		 	list = tbRmyhKhformInfoXfService.findList(tbRmyhKhformInfoPa); 
//			 		jdbc.url=jdbc:mysql://127.0.0.1:3306/javamg?useUnicode=true&characterEncoding=utf-8
				 	//利用commons-dbutils-1.5.jar
					QueryRunner qr = new QueryRunner();
					Connection connection = getJdbcConnection(Global.getConfig("jdbc.url"), Global.getConfig("jdbc.username"), Global.getConfig("jdbc.password"), "com.mysql.jdbc.Driver");
					//用父Id分组查询,找到所有的父ID然后循环这个List查询
					String sqlGroup = "select parent_id from  tb_rmyh_khform_info_xf t where t.parent_ids LIKE '%"+id +"%' group by t.parent_id ";
					
					try {
					  sqlGroupList = (List<String>)qr.query(connection, sqlGroup, new String[]{}, new ColumnListHandler("parent_id"));
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
		 	}
			
		
		 		
		 	
			
			
			Map<String,List<TbRmyhKhformInfo>> arrMap = new HashMap<String,List<TbRmyhKhformInfo>>();
			
			for( String parentId:sqlGroupList){
				
				List<TbRmyhKhformInfo> tempTbRmyhKhformInfoList = new ArrayList<TbRmyhKhformInfo>();
				
				if(parentId.equals("0")){
					continue;
				}
				for(TbRmyhKhformInfo tempEntity:list){
					if(parentId.equals(tempEntity.getParentId())){
						
						tempTbRmyhKhformInfoList.add(tempEntity);
					}
					
				}
				
				arrMap.put(parentId, tempTbRmyhKhformInfoList);
			}
			
	
			
			 List<TbRmyhKhformInfo> itemList = arrMap.get(id);
			if(itemList == null){
				return null;
			}
			 Map<Integer,TbRmyhKhformInfo>  itemData   =  getItemData(itemList,arrMap);;
			 Map<Integer,TbRmyhKhformInfo>  contenData = getContentData(itemList, arrMap);
			 List standDataRelust = getStandData(itemList, arrMap);
			 Map<Integer,TbRmyhKhformInfo> standData = (Map<Integer, TbRmyhKhformInfo>) standDataRelust.get(1);
			 
			 
			 int size = (int) standDataRelust.get(0);
			 List<RowDataInfo> rowDataList = new ArrayList<RowDataInfo>();
			 for(int i =0 ; i < size ; i++ ){
				 
				 RowDataInfo rowData = new RowDataInfo();
				 if(itemData.get(i) != null){
					 rowData.setItemName(itemData.get(i).getName()+"("+itemData.get(i).getAllScore()+")");
					 rowData.setItemChildSize(itemData.get(i).getChildSize());
				 }
				 if(contenData.get(i) != null){
					 rowData.setContentName(contenData.get(i).getName()+"("+contenData.get(i).getAllScore()+")");
					 rowData.setContentChildSize(contenData.get(i).getChildSize());
				 }
				 if(standData.get(i) != null){
					 
					 rowData.setStandName(standData.get(i).getName());
					 rowData.setStandScore(standData.get(i).getAllScore());
					 rowData.setStandId(standData.get(i).getId());
					 List<TbRmyhKhformInfo> fileDatailList = new ArrayList<TbRmyhKhformInfo>();
					 List<TbRmyhKhformInfo> jfbzList = new ArrayList<TbRmyhKhformInfo>();
					  List<TbRmyhKhformInfo>  fileJfbzList =  arrMap.get(standData.get(i).getId());
					 if(fileJfbzList != null){
						 for(TbRmyhKhformInfo fileJfbzBean : fileJfbzList){
							 if(fileJfbzBean.getType().equals("4")){
								 fileDatailList.add(fileJfbzBean);
							 }
							 if(fileJfbzBean.getType().equals("5")){
									 jfbzList.add(fileJfbzBean);
							 }
							 
						 }
					 }
					 
					 rowData.setFileDatail(fileDatailList);
					 rowData.setJfbzList(jfbzList);
					 
					 //从本地磁盘获取附件信息
					 if(!fromflag.equals("0")){
						
						 String path=FileUtils.path(Global.getUserfilesBaseDir()+ Global.USERFILES_BASE_URL+officeId+"/"+flagId+"/"+standData.get(i).getId()+"/khfiles/");
						  File file=new File(path);
						 // |/rmyh/userfiles/f2db5887736e4f3fb71f277cba72c683/9ebcd/files/SolrCloud-5_5%E9%9B%86%E7%BE%A4%E5%A6%82%E4%BD%95%E9%83%A8%E7%BD%B2.docx|/rmyh/userfiles/f2db5887736e4f3fb71f277cba72c683/9ebcd/files/SolrCloud-5_5%E9%9B%86%E7%BE%A4%E5%A6%82%E4%BD%95%E9%83%A8%E7%BD%B2.docx
						  File[] tempList = file.listFiles();
						  String url="";
						  if(tempList != null){
							  Arrays.sort(tempList, new KhformViewController.CompratorByLastModified()); 
							  String baseUrl = "|"+"/"+FileUtils.path(Servlets.getRequest().getContextPath()+ Global.USERFILES_BASE_URL+officeId+"/"+flagId+"/"+standData.get(i).getId()+"/khfiles/");
							  for (int x = 0; x < tempList.length; x++) {
								   if (tempList[x].isFile()) {
									   url = url+baseUrl+tempList[x].getName();
								   }
								 
								  }
							  
							 
						  }
						 
						  rowData.setFile(url);
						
					 }
					 
					 if(fromflag.equals("9.1") ||fromflag.equals("9.2")||fromflag.equals("9.3")|| fromflag.equals("11") 
							 || fromflag.equals("20")|| fromflag.equals("21") || fromflag.equals("25") || fromflag.equals("26")||fromflag.equals("30")){
						 TbRmyhKf entity = new TbRmyhKf();
						 entity.setStandId(standData.get(i).getId());
						 entity.setOfficeId(officeId);
						 entity.setFlagId(flagId);
						 TbRmyhKf tbRmyhKf =tbRmyhKfService.get(entity);
						 if(tbRmyhKf != null){
							 rowData.setDf(tbRmyhKf.getScore()); 
							 rowData.setKfReason(tbRmyhKf.getKfreason());
							 rowData.setJfbzIds(tbRmyhKf.getRemarks());
						 }else{
							 rowData.setDf("0"); 
							 rowData.setKfReason("");
						 }
						
					 }
					 
					  
					
				 }
				
				 rowDataList.add(rowData);
				 
			 }
			return rowDataList;
	}

	 //根据文件修改时间进行比较的内部类
    static class CompratorByLastModified implements Comparator<File> {  
        
        public int compare(File f1, File f2) {  
            long diff = f1.lastModified() - f2.lastModified();  
            if (diff > 0) {  
                   return 1;  
            } else if (diff == 0) {  
                   return 0;  
            } else {  
                  return -1;  
            }  
        }  
    }  
	public Map<Integer,TbRmyhKhformInfo> getItemData(List<TbRmyhKhformInfo> list,Map<String,List<TbRmyhKhformInfo>> arrMap){
		
		Map<Integer,TbRmyhKhformInfo> itemMap = new HashedMap();
		 if(list == null){
			 return null;
		 }
		int standNum = 0;
		for(int i = 0; i < list.size(); i++){
			  
		 TbRmyhKhformInfo itemBean = list.get(i);
		 List<TbRmyhKhformInfo> contentList = arrMap.get(itemBean.getId());
		 int standbeanNum = 0;
		 if(contentList == null){
			 if(i == 0){
				 itemMap.put(0,  itemBean);
				 
			 }else{
				 
				 itemMap.put(standNum,  itemBean);
			 
			 }
			 standNum++;
			 continue;
		 }
		 for(TbRmyhKhformInfo contentBean : contentList){
			  if(arrMap.get(contentBean.getId()) != null){
			    standbeanNum = standbeanNum + arrMap.get(contentBean.getId()).size();
			  }else{standbeanNum = standbeanNum+1; }
		 }
		 itemBean.setChildSize(standbeanNum);
		 if(i == 0){
			 itemMap.put(0,  itemBean);
			 
		 }else{
			 
			 itemMap.put(standNum,  itemBean);
		 
		 }
		 
		 
		 for(TbRmyhKhformInfo contentBean : contentList){
			 if(arrMap.get(contentBean.getId()) != null){
			   standNum = standNum + arrMap.get(contentBean.getId()).size();
			 }else{standNum = standNum+1; }
		 }
		 
		}
		return itemMap;
	}
	
	public Map<Integer,TbRmyhKhformInfo> getContentData(List<TbRmyhKhformInfo> itemList,Map<String,List<TbRmyhKhformInfo>> arrMap){
		
		 
		Map<Integer,TbRmyhKhformInfo> itemMap = new HashedMap();
		if(itemMap == null){
			return null;
		}
		int contenNum = 0;
		 for(int j = 0 ; j < itemList.size(); j++){
			    String itemId = itemList.get(j).getId();
			    
			    List<TbRmyhKhformInfo> contenList = arrMap.get(itemId);
				
			    if(contenList == null){
			    	contenNum++;
					 continue;
				 }
				
				for(int i = 0; i < contenList.size(); i++){
					  
				 TbRmyhKhformInfo contentBean = contenList.get(i);
				 List<TbRmyhKhformInfo> sdandtList = arrMap.get(contentBean.getId());
				 int standbeanNum = 0;
				 if(sdandtList == null){
					 itemMap.put(contenNum,  contentBean);
					 contenNum++;
					 continue;
				 }
				
				 standbeanNum = sdandtList.size();
				 contentBean.setChildSize(standbeanNum);
				 if(contenNum == 0){
					 itemMap.put(contenNum,  contentBean);
					 
				 }else{
					 
					 itemMap.put(contenNum,  contentBean);
				 
				 }
				 
				 
				 if(sdandtList != null){
					 contenNum = contenNum +sdandtList.size();
				 }
				
			}
			    
		 }
		
				return itemMap;
		}
	
	
	
public List getStandData(List<TbRmyhKhformInfo> itemList,Map<String,List<TbRmyhKhformInfo>> arrMap){
		
	 List rusultList = new ArrayList<Map<Integer,TbRmyhKhformInfo>>();
		Map<Integer,TbRmyhKhformInfo> itemMap = new HashedMap();
		
		int standbeanNum = 0;
		 for(int j = 0 ; j < itemList.size(); j++){
			    String itemId = itemList.get(j).getId();
			    
			    List<TbRmyhKhformInfo> contenList = arrMap.get(itemId);
				
				 if(contenList == null){
					 standbeanNum++;
					 continue;
				 }
				
				for(int i = 0; i < contenList.size(); i++){
					
					String contentId = contenList.get(i).getId();
					List<TbRmyhKhformInfo> standList = arrMap.get(contentId);
					
					if(standList == null){
						 standbeanNum++;
						continue;
					}
					for(TbRmyhKhformInfo standBean : standList){
					     
						itemMap.put(standbeanNum, standBean);
						 
						standbeanNum++;
						
					}
				 
		 }
		 }
		 		rusultList.add(standbeanNum);
		 		rusultList.add(itemMap);
				return rusultList;
		}
	
		@RequiresPermissions("rmyhform:tbRmyhKhformInfo:edit")
		@ResponseBody
		@RequestMapping(value = "update")
		public String update(TbRmyhKhformInfo tbRmyhKhformInfo, Model model, @RequestParam(required=false) String officeIds, HttpServletResponse response) {
			
			//判断tbrmyhfile表中是否存在要下发的考核表名，如果存在返回值
			TbRmyhFile entity = new TbRmyhFile();
			
			entity.setFormName(tbRmyhKhformInfo.getName());
			List<TbRmyhFile> list = tbRmyhFileService.findList(entity);
			if(list != null && list.size() > 0){
				return list.get(0).getFormName();
			}
		
			/*tbRmyhKhformInfo.setXfFlag("1");
			tbRmyhKhformInfoService.save(tbRmyhKhformInfo);*/
			
			//获取下发表各行内容，保存到tb_rmyh_khform_info_xf表中,下面为保存表名数据项
			String pk = UUID.randomUUID().toString();
			
			
			
			//依据id查询，该表下的子节点，并保存
			TbRmyhKhformInfo  tbRmyhKhformInfoPa = new TbRmyhKhformInfo();
		 	tbRmyhKhformInfoPa.setParentIds(tbRmyhKhformInfo.getId());
		 	List<TbRmyhKhformInfo>  treeList = tbRmyhKhformInfoService.findList(tbRmyhKhformInfoPa);
		 	if(treeList ==null || treeList.size() < 1){
		 		return "1";
		 	}
		 	tbRmyhKhformInfo.setIsNewRecord(true);
			tbRmyhKhformInfo.setFlagId(pk);
			tbRmyhKhformInfoXfService.save(tbRmyhKhformInfo);
		 	for( TbRmyhKhformInfo entityTemp :treeList ){
		 		entityTemp.setIsNewRecord(true);
		 		entityTemp.setFlagId(pk);
		 		tbRmyhKhformInfoXfService.save(entityTemp);
				
			}
			 
			//tbRmyhKhformInfoXfService.save(tbRmyhKhformInfo);
			
			
			
			
			
			//向file表保存数据
			String[] officeArrId =  officeIds.split(",");
			User user = UserUtils.getUser();
			for(String officeId : officeArrId){
				TbRmyhFile tbRmyhFile = new TbRmyhFile();
				tbRmyhFile.setKhformId(tbRmyhKhformInfo.getId());
				tbRmyhFile.setAllScore(tbRmyhKhformInfo.getAllScore());
				tbRmyhFile.setFormName(tbRmyhKhformInfo.getName());
				tbRmyhFile.setFlagId(pk);
				Office office = new Office();
				office.setId(officeId);
				tbRmyhFile.setOffice(office);
				tbRmyhFile.setCreateBy(user);
				tbRmyhFile.setCreateDate(new Date());
				tbRmyhFile.setUserName(user.getName());
				tbRmyhFile.setStatus("1");
				tbRmyhFileService.save(tbRmyhFile);
				
			}
			return "2";
		}
		
		@RequiresPermissions("rmyhform:tbRmyhKhformInfo:edit")
		@RequestMapping(value = "deletefile")
		@ResponseBody 
		public Boolean deleteFile( Model model, @RequestParam(required=true) String url,RedirectAttributes redirectAttributes) {
			 
			String path = FileUtils.path(Global.getUserfilesBaseDir()+ url.replaceFirst("/rmyh",""));
			 Boolean flag = false;    
			File file = new File(path);  
			 if (file.exists()&&file.isFile()) {
				 file.delete();  
			     flag = true;
			 }
			return flag;
		}
	public TbRmyhKhformInfoService getTbRmyhKhformInfoService() {
		return tbRmyhKhformInfoService;
	}

	public void setTbRmyhKhformInfoService(
			TbRmyhKhformInfoService tbRmyhKhformInfoService) {
		this.tbRmyhKhformInfoService = tbRmyhKhformInfoService;
	}

	/**
	 * 数据库连接
	 * @param url
	 * @param username
	 * @param password
	 * @param driverClassName
	 * @return
	 */
	public static Connection getJdbcConnection(String url, String username, String password, String driverClassName){
		Connection connection = null;
		try {
			
			Properties props =new Properties();
			 
			props.put("user",username);
			props.put("password",password);
			props.put("remarksReporting","true");

			try {
				Class.forName(driverClassName).newInstance();
			} catch (InstantiationException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			connection=DriverManager.getConnection(url,props);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return connection;
		
	}
	
}