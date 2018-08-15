package com.thinkgem.javamg.modules.rmyhform.web;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ColumnListHandler;

import com.thinkgem.javamg.modules.rmyhform.entity.TbRmyhKhformInfo;



/**
 * 数据库中树结构数据,转换为Java对象树结构( 多叉树结构 )
 * @author liupengyuan
 *
 */
public class ListToTree {
	
	/**
	 * No.0:
	 * @param args
	 * @throws Exception
	 */
	public static void main(String[] args) throws Exception {
		long startTime=System.currentTimeMillis();   //获取开始时间
		
		Map<String, List<TbRmyhKhformInfo>> arrMap = queryListToMap();	//No.1.1  (推荐使用 运行时间较短)

		//	No.2:让节点与子节点之间彼此关联,并返回全有的根.(没有父节点的都为根)
		List<TbRmyhKhformInfo> rootTbRmyhKhformInfoList = MapForTbRmyhKhformInfo(arrMap);

		//	从map里把根找到.返回List . 可能有多个根
		List<TbRmyhKhformInfo> list = arrMap.get("root");
		System.out.println(list.size());
		
		
		//获取结束时间
		long endTime=System.currentTimeMillis();
		System.out.println("程序运行时间： "+(endTime-startTime)+"ms");
	}
	
	
	
	
	/**	
	 * No.1.1: 
	 * 通过两条sql查询完成.数据库压力较小些(推荐使用这个方法,运行的时间比 queryGroupToMap 短一半).
	 * 用父ID分组,用Map封装. key为父ID, value是所有父ID为KEY的节点数组.
	 * 每个数组里都是一组子节点,他们的根是同一个. 换句话说它们的父ID相同, 而Map的Key就是他们是父ID.
	 * @return
	 * @throws SQLException
	 */
	@SuppressWarnings({ "unchecked", "deprecation", "rawtypes"})
	public static Map<String,List<TbRmyhKhformInfo>> queryListToMap() throws SQLException{
		
		/*
		 * 该表为中国地区组织,到 区县级
		 * 比如,中国下分:北京市,河北省,山东省...
		 * 山东下分:济南市,青岛市,烟台市...
		 * 
		 */
		
		// QueryRunner 这个是数据库工具,只要在网上找下载就可以 commons-dbutils-1.5.jar
		QueryRunner qr = new QueryRunner();
		Connection connection = getJdbcConnection("jdbc:mysql://127.0.0.1:3306/javamg?useUnicode=true&characterEncoding=utf-8", "root", "root", "com.mysql.jdbc.Driver");
		
		//用父Id分组查询,找到所有的父ID然后循环这个List查询
		String sqlGroup = "select parent_id from  tb_rmyh_khform_info t group by t.parent_id";
		List<String> sqlGroupList = (List<String>)qr.query(connection, sqlGroup, new String[]{}, new ColumnListHandler("parent_id"));

		//查询出所有的节点
		Map<String,List<TbRmyhKhformInfo>> arrMap = new HashMap<String,List<TbRmyhKhformInfo>>(sqlGroupList.size());
		String sql = "select id , name , parent_id from  tb_rmyh_khform_info t ";
		List<TbRmyhKhformInfo> listTbRmyhKhformInfo = (List<TbRmyhKhformInfo>) qr.query(connection, sql, new String[]{} , new BeanListHandler(TbRmyhKhformInfo.class));
		DbUtils.close(connection);
		
		
		/*
		 * 通过 父ID 和 所有的节点 比对
		 */
		for(int k=0;k<sqlGroupList.size();k++){
			String pid = sqlGroupList.get(k);
			
			List<TbRmyhKhformInfo> tempTbRmyhKhformInfoList = new ArrayList<TbRmyhKhformInfo>();
			for(int i=0; i < listTbRmyhKhformInfo.size();i++){
				TbRmyhKhformInfo TbRmyhKhformInfo = listTbRmyhKhformInfo.get(i);
				
				/*
				 * 将同一父ID的TbRmyhKhformInfo添加到同一个List中,最后将List放入Map..   arrMap.put(pid, tempTbRmyhKhformInfoList);
				 * 这点虽然不复杂,但这是整个思索的中心,
				 */
				if(pid.equals(TbRmyhKhformInfo.getParentId())){
					tempTbRmyhKhformInfoList.add(TbRmyhKhformInfo);
				}
			}
			
			// 最后将List放入Map..  key就是这组List<TbRmyhKhformInfo>父ID, value就是这组List
			arrMap.put(pid, tempTbRmyhKhformInfoList);
		}
		
		return arrMap;
	}
	
	
	/**
	 * No.2:
	 * 让节点与子节点之间彼此关联,并返回树的根
	 * 数据库格式并没有换,只是建立了关联
	 * @param arrMap
	 */
	public static List<TbRmyhKhformInfo> MapForTbRmyhKhformInfo(Map<String, List<TbRmyhKhformInfo>> arrMap){
		
		//所以pid的集合
		Set<String> pidSet = arrMap.keySet();
		
		//遍历所有的父ID,然后与所以的节点比对,父id与id相同的    //找出对应的TbRmyhKhformInfo节点,然后将该节点的
		for (Iterator<String> it = pidSet.iterator(); it.hasNext();) {
			
    		String pid = (String) it.next();
    		
    		/*
    		 * 按分组的方式与pid比对.
    		 * 如果找到,那么将该pid分组的List,做为子节点 赋值给该找到的节点的 setChildrenList(list),同时也将找到节点赋值List内所有子节点的parentObj
    		 * 
    		 */
        	for (Iterator<String> it2 = pidSet.iterator(); it2.hasNext();) {
        		
        		String key = (String) it2.next();
        		//不查找自己的分组
        		if(pid.equals(key)){
        		//	break;
        		}
        		
        		List<TbRmyhKhformInfo> list = arrMap.get(key);
        		
        		//	No.3:找出对应的TbRmyhKhformInfo父节点对象
        		TbRmyhKhformInfo parentTbRmyhKhformInfo = indexOfList(list , pid);
        		
        		
        		if(parentTbRmyhKhformInfo!=null){
        			//通过pid在Map里找出节点的子节点.
        			if("430000".equals(pid)){
        				System.out.println(pid);
        			}
        			List<TbRmyhKhformInfo> childrenHereList = arrMap.get(pid);
        			
        			//TODO	这里是我自己定义的变成成,都不一样.所以需要自定义
        			// 把子节点List赋值给TbRmyhKhformInfo节点的Children
        			parentTbRmyhKhformInfo.setChildrenList(childrenHereList);
            		
        			//TODO	这里是我自己定义的变是,都不一样.所以需要自定义
        			// 与上面相反,这是 把父节点对象赋值给TbRmyhKhformInfo节点的parentObj
            		for(int i=0; i<childrenHereList.size(); i++){
            			TbRmyhKhformInfo childrenHereTbRmyhKhformInfo = childrenHereList.get(i);
            			childrenHereTbRmyhKhformInfo.setParent(parentTbRmyhKhformInfo);
            		}
            	}
        	}
        }
		
		
		
    	// 找到 childrenHereTbRmyhKhformInfo.getParentObj(); 为null的就是根  return rootTbRmyhKhformInfoList
		List<TbRmyhKhformInfo> rootTbRmyhKhformInfoList = new ArrayList<TbRmyhKhformInfo>();
    	for (Iterator<String> it2 = pidSet.iterator(); it2.hasNext();) {
    		String key = (String) it2.next();
    		List<TbRmyhKhformInfo> list = arrMap.get(key);
    		for(int i=0; i<list.size(); i++){
    			TbRmyhKhformInfo TbRmyhKhformInfo = list.get(i);
    			if(null == TbRmyhKhformInfo.getParent()){
    				rootTbRmyhKhformInfoList.add(TbRmyhKhformInfo);
    			}
    		}
    	}
		return rootTbRmyhKhformInfoList;
		
	}
	
	
	
	/**
	 * No.3:
	 * 找出 list 中元素的id与pid相同的节点 的并返回.对应关系为: id与父id相同
	 * @param list
	 * @param pid
	 * @return
	 */
	public static TbRmyhKhformInfo  indexOfList(List<TbRmyhKhformInfo> list , String pid){
		for(int i=0 ;i<list.size();i++){
			TbRmyhKhformInfo TbRmyhKhformInfo = list.get(i);
			/*
			 * pid:是 父ID
			 * area_id:是 ID
			 */
			//TODO	这里是我自己定义的变成成,都不一样.所以需要自定义
			if(pid.equals(TbRmyhKhformInfo.getId())){
				return TbRmyhKhformInfo;
			}
		}
		return null;
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
