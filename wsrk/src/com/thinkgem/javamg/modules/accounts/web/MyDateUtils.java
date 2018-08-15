/**
 * 
 */
package com.thinkgem.javamg.modules.accounts.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * <p>Title:MyDateUtils</p>
 * <p>Description:  </p>
 * <p>Company:  </p>
 * @author 王宏涛
 * @date  2017-9-2
 */
public class MyDateUtils {
	
    private final static SimpleDateFormat shortSdf = new SimpleDateFormat("yyyy-MM-dd");  
    private final static SimpleDateFormat longSdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");;  
    
	public static String getCurrentQuarter(){
		Calendar calendar=Calendar.getInstance();
		//获得当前时间的月份，月份从0开始所以结果要加1
		int month=calendar.get(Calendar.MONTH)+1;
		String quarter="";    
        if(month>=1&&month<=3){     
            quarter="1";     
        }     
        if(month>=4&&month<=6){     
            quarter="2";       
        }     
        if(month>=7&&month<=9){     
            quarter = "3";     
        }     
        if(month>=10&&month<=12){     
            quarter = "4";     
        }
        return quarter;
	}
	
	public static String getMothByQuarter(String quarter){
		
		String moth = null ;
		if(quarter.equals("1")){
			moth = "2";
		}else if(quarter.equals("2")){
			moth = "5";
		}else if(quarter.equals("3")){
			moth = "8";
		}else if(quarter.equals("4")){
			moth = "11";
		}
		return moth;
	}
	
	
	public static String getCurrentYear(){
		Calendar calendar=Calendar.getInstance();
		//获得当前时间的月份，月份从0开始所以结果要加1
		int year = calendar.get(Calendar.YEAR);
		return String.valueOf(year);
	}
	
	 /**
	  * 得到给定时间的季度开始时间
	  * String dateStr="2012-5-27";
	  * @Description: TODO
	  * @return   Calendar中月份month得取值是从0开始,到11 
	  * @return Date  
	  * @author 王宏涛
	  * @date 2017-9-2
	  */
    public static Date getCurrentQuarterStartTime(String dateStr) {  
    	
    	SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
    	Date date = new Date();
		try {
			date = sdf.parse(dateStr);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
    	Calendar c = Calendar.getInstance();
    	c.setTime(date);
        int currentMonth = c.get(Calendar.MONTH) + 1;  
        Date now = null;  
        try {  
            if (currentMonth >= 1 && currentMonth <= 3)  
                c.set(Calendar.MONTH, 0);  
            else if (currentMonth >= 4 && currentMonth <= 6)  
                c.set(Calendar.MONTH, 3);  
            else if (currentMonth >= 7 && currentMonth <= 9)  
                c.set(Calendar.MONTH, 6);  
            else if (currentMonth >= 10 && currentMonth <= 12)  
                c.set(Calendar.MONTH, 9);  
            c.set(Calendar.DATE, 1);  
            now = longSdf.parse(shortSdf.format(c.getTime()) + " 00:00:00");  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        return now;  
    }  
  
    /** 
     * 当前季度的结束时间 
     * 
     * @return 
     */  
    public static Date getCurrentQuarterEndTime(String dateStr) {  
    	SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
    	Date date = new Date();
		try {
			date = sdf.parse(dateStr);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
    	Calendar c = Calendar.getInstance();
    	c.setTime(date);
        int currentMonth = c.get(Calendar.MONTH) + 1;  
        Date now = null;   
        try {  
            if (currentMonth >= 1 && currentMonth <= 3) {  
                c.set(Calendar.MONTH, 2);  
                c.set(Calendar.DATE, 31);  
            } else if (currentMonth >= 4 && currentMonth <= 6) {  
                c.set(Calendar.MONTH, 5);  
                c.set(Calendar.DATE, 30);  
            } else if (currentMonth >= 7 && currentMonth <= 9) {  
                c.set(Calendar.MONTH, 8);  
                c.set(Calendar.DATE, 30);  
            } else if (currentMonth >= 10 && currentMonth <= 12) {  
                c.set(Calendar.MONTH, 11);  
                c.set(Calendar.DATE, 31);  
            }  
            now = longSdf.parse(shortSdf.format(c.getTime()) + " 23:59:59");  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        return now;  
    }  
}
