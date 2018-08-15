<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>部门落实党风廉政建设责任制情况半年自查表管理</title>
	<meta name="decorator" content="default"/>
	<object id="WebBrowser" classid=CLSID:8856F961-340A-11D0-A96B-00C04FD705A2 height="0" width="0"> 
</object> 
	<script src="${ctxStatic}/confirm/js/confirm.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
			
			var allScore = ${tbHalfyear.a}+${tbHalfyear.b}+${tbHalfyear.c}+${tbHalfyear.d}+${tbHalfyear.e};
			$("#allScore").text(allScore);
			
			
			
		});
		
		//得到input值，并将空值转化为0
		function getInputValue(tag){
			
			 var inputval = $('#'+tag).val();
			 if(inputval == null || inputval =='' ){
				 inputval = 0;
				}else{
					inputval =  parseFloat(inputval); 
				}
			return inputval;
		}
		
		//计算得分总值
		function getEndScore(){
			var a = getInputValue("a");
			var b = getInputValue("b");
			var c = getInputValue("c");
			var d = getInputValue("d");
			var e = getInputValue("e");
			return a+b+c+d+e;
		}
		
		 function doPrint(){
	    	 
			 document.all.WebBrowser.ExecWB(7,1);
		     }
		</script>
		
	<style media="print">
		     .Noprint
		     {
		         display: none;
		     }
		     .PageNext
		     {
		         page-break-after: always;
		     }
		  
	</style>
	<style type="text/css">
		table, td
		 {
			border: 1px solid #333; 
		 }
		
	</style>
</head>
<body>
	
		<div ><p style="font-family:SimSun;font-size:30px;text-align: center;margin-top: 49px;"><strong>八、部门落实党风廉政建设责任制情况半年自查表</strong></p></div>
			<input class="Noprint" id="btnSubmit" onclick='doPrint()' style="float:right;margin-right:80px;margin-bottom: 10px" class="btn btn-primary" type="submit" value="&nbsp;打&nbsp;&nbsp;印&nbsp;"/>
	</br>
	</br>
<table class="table table-bordered " style="font-family:SimSun;font-size:16px;width:80%;margin: auto;border: 1px solid #333; margin-bottom: 30px " >
    <tr>
      <td  width="5%" style="text-align: center;font-weight:bold ;">自</br>查</br>项</br>目</td>
      <td width="5%" colspan="2" style="text-align: center;font-weight:bold ;">分值</td>
      <td  width="15%" style="text-align: center;font-weight:bold ;">自查内容</td>
      <td width="15%" style="text-align: center;font-weight:bold ;">自查标准</td>
      <td width="3%" style="text-align: center;font-weight:bold ;"> 扣分</td>
      <td width="3%" style="text-align: center;font-weight:bold ;">得分</td>
    </tr>
	    <tr>
	      	<td rowspan="4" style="text-align: center;font-weight:bold ;">${tbHalfyear.tbHalfyearTable.a1}</td>
	      	<td rowspan="4" style="text-align: center;font-weight:bold ;">${tbHalfyear.tbHalfyearTable.a2}</td>
	      	<td width="2%" style="text-align: center;font-weight:bold ;">${tbHalfyear.tbHalfyearTable.a3}</td>
	      	<td  style="font-weight:bold ;font-size:13px;">${tbHalfyear.tbHalfyearTable.a4}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbHalfyear.tbHalfyearTable.a5}</td>
	      	<td>
				<span>&nbsp${tbHalfyear.a1} </span>
			</td>
	      	<td rowspan="4">
	      			<span>&nbsp${tbHalfyear.a} </span>
	      	</td>
	    </tr>
	     <tr>
	      	<td style="text-align: center;font-weight:bold ;">${tbHalfyear.tbHalfyearTable.a6}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbHalfyear.tbHalfyearTable.a7}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbHalfyear.tbHalfyearTable.a8}</td>
	      	<td>	<span>&nbsp${tbHalfyear.a2} </span> </td>
	    </tr>
	     <tr>
	      	<td style="text-align: center;font-weight:bold ;">${tbHalfyear.tbHalfyearTable.a9}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbHalfyear.tbHalfyearTable.a10}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbHalfyear.tbHalfyearTable.a11}</td>
	      	<td><span>&nbsp${tbHalfyear.a3}  </td>
	    </tr>
	    <tr>
		     <td style="text-align: center;font-weight:bold ;">${tbHalfyear.tbHalfyearTable.a12}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbHalfyear.tbHalfyearTable.a13}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbHalfyear.tbHalfyearTable.a14}</td>
	      	<td><span>&nbsp${tbHalfyear.a4} </td>
	    </tr>
	    
	     <tr>
	      	<td rowspan="5" style="text-align: center;font-weight:bold ;">${tbHalfyear.tbHalfyearTable.a15}</td>
	      	<td rowspan="5" style="text-align: center;font-weight:bold ;">${tbHalfyear.tbHalfyearTable.a16}</td>
	      	<td width="2%" style="text-align: center;font-weight:bold ;">${tbHalfyear.tbHalfyearTable.a17}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbHalfyear.tbHalfyearTable.a18}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbHalfyear.tbHalfyearTable.a19}</td>
	      	<td> <span>&nbsp${tbHalfyear.a5} </td>
	      	<td rowspan="5">
	      		<span>&nbsp${tbHalfyear.b}
	      	</td>
	    </tr>
	     <tr>
	      	<td width="2%" style="text-align: center;font-weight:bold ;">${tbHalfyear.tbHalfyearTable.a20}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbHalfyear.tbHalfyearTable.a21}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbHalfyear.tbHalfyearTable.a22}</td>
	      	<td><span>&nbsp${tbHalfyear.a6}  </td>
	    </tr>
	     <tr>
	      	<td width="2%" style="text-align: center;font-weight:bold ;">${tbHalfyear.tbHalfyearTable.a23}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbHalfyear.tbHalfyearTable.a24}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbHalfyear.tbHalfyearTable.a25}</td>
	      	<td> <span>&nbsp${tbHalfyear.a7} </td>
	    </tr>
	     <tr>
	      	<td width="2%" style="text-align: center;font-weight:bold ;">${tbHalfyear.tbHalfyearTable.a26}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbHalfyear.tbHalfyearTable.a27}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbHalfyear.tbHalfyearTable.a28}</td>
	      	<td> <span>&nbsp${tbHalfyear.a8} </td>
	    </tr>
	     <tr>
	      	<td width="2%" style="text-align: center;font-weight:bold ;">${tbHalfyear.tbHalfyearTable.a29}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbHalfyear.tbHalfyearTable.a30}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbHalfyear.tbHalfyearTable.a31}</td>
	      	<td> <span>&nbsp${tbHalfyear.a9} </td>
	    </tr>
	    
	       <tr>
	      	<td rowspan="2" style="text-align: center;font-weight:bold ;">${tbHalfyear.tbHalfyearTable.a32}</td>
	      	<td rowspan="2" style="text-align: center;font-weight:bold ;">${tbHalfyear.tbHalfyearTable.a33}</td>
	      	<td width="2%" style="text-align: center;font-weight:bold ;">${tbHalfyear.tbHalfyearTable.a34}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbHalfyear.tbHalfyearTable.a35}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbHalfyear.tbHalfyearTable.a36}</td>
	      	<td> <span>&nbsp${tbHalfyear.a10}</td>
	      	<td rowspan="2">
	      		<span>&nbsp${tbHalfyear.c}
	      	</td>
	    </tr>
	     <tr>
	      	<td width="2%" style="text-align: center;font-weight:bold ;">${tbHalfyear.tbHalfyearTable.a37}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbHalfyear.tbHalfyearTable.a38}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbHalfyear.tbHalfyearTable.a39}</td>
	      	<td><span>&nbsp${tbHalfyear.a11}  </td>
	    </tr>
	    
	      <tr>
	      	<td rowspan="3" style="text-align: center;font-weight:bold ;">${tbHalfyear.tbHalfyearTable.a40}</td>
	      	<td rowspan="3" style="text-align: center;font-weight:bold ;">${tbHalfyear.tbHalfyearTable.a41}</td>
	      	<td width="2%" style="text-align: center;font-weight:bold ;">${tbHalfyear.tbHalfyearTable.a42}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbHalfyear.tbHalfyearTable.a43}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbHalfyear.tbHalfyearTable.a44}</td>
	      	<td><span>&nbsp${tbHalfyear.a12} </td>
	      	<td rowspan="3">
	      		<span>&nbsp${tbHalfyear.d}
	      	</td>
	    </tr>
	     <tr>
	      	<td width="2%" style="text-align: center;font-weight:bold ;">${tbHalfyear.tbHalfyearTable.a45}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbHalfyear.tbHalfyearTable.a46}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbHalfyear.tbHalfyearTable.a47}</td>
	      	<td><span>&nbsp${tbHalfyear.a13}  </td>
	    </tr>
	     <tr>
	      	<td width="2%" style="text-align: center;font-weight:bold ;">${tbHalfyear.tbHalfyearTable.a48}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbHalfyear.tbHalfyearTable.a49}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbHalfyear.tbHalfyearTable.a50}</td>
	      	<td><span>&nbsp${tbHalfyear.a14} </td>
	    </tr>
	    
	     <tr>
	      	<td style="text-align: center;font-weight:bold ;">${tbHalfyear.tbHalfyearTable.a51}</td>
	      	<td style="text-align: center;font-weight:bold ;">${tbHalfyear.tbHalfyearTable.a52}</td>
	      	<td width="2%" style="text-align: center;font-weight:bold ;">${tbHalfyear.tbHalfyearTable.a53}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbHalfyear.tbHalfyearTable.a54}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbHalfyear.tbHalfyearTable.a55}</td>
	      	<td><span>&nbsp${tbHalfyear.a15} </td>
	      	<td >
	      		<span>&nbsp${tbHalfyear.e}
	      	</td>
	    </tr>
	    
	      <tr>
	      	<td colspan="7" style="font-weight:bold ;">部门落实党风廉政建设责任制自查得分：<span id="allScore"></span></td>
	    </tr>
	     <tr>
	      	<td colspan="7"style="font-weight:bold ;">部门负责人签字：<span style="font-weight:normal;">${tbHalfyear.sign}</span><span style="text-align: right;float:right;margin-right:140px"><fmt:formatDate value="${tbHalfyear.signTime}" pattern="yyyy年MM月dd日"/></span></td>
	    </tr>
</table> 
</body>
</html>