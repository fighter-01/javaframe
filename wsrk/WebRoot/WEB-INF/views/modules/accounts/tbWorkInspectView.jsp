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
	 function doPrint(){
    	 
		 document.all.WebBrowser.ExecWB(7,1) ;
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
	
		<div ><p style="font-family:SimSun;font-size:30px;text-align: center;margin-top: 49px;"><strong>十、行领导对分管部门党风廉政建设工作检查记录</strong></p></div>
			<input class="Noprint" id="btnSubmit" onclick='doPrint()' style="float:right;margin-right:80px;margin-bottom: 10px" class="btn btn-primary" type="submit" value="&nbsp;打&nbsp;&nbsp;印&nbsp;"/>		
	</br>
	</br>
<table class="table table-bordered " style="font-family:SimSun;font-size:16px;width:80%;margin: auto;border: 1px solid #333; margin-bottom: 30px " >

  
  <tbody id="tl">
		    <tr>
		      <td  width="25%" style="text-align: center;font-weight:bold ;" colspan="2">分管领导</td>
		      <td width="25%"><span>&nbsp${tbWorkInspect.fgld} </span></td>
			   <td width="25%" style="text-align: center;font-weight:bold ;" >检查时间</td>
		      <td  width="25%"> <span><fmt:formatDate value="${tbWorkInspect.inspectTime}" pattern="yyyy年MM月dd日"/> </span></td>
		    </tr>
	   
	     <tr>
	      	<td  style="text-align: center;font-weight:bold ;"  width="5%" >对部门党风廉政建设工作的总体评价</td>
	      	<td colspan="4">
					<span>&nbsp${tbWorkInspect.evaluate} </span>
		</td>
	      	
	    </tr>
	     <tr>
	      	<td style="text-align: center;font-weight:bold ;">部门党风廉政建设存在的问题及要求</td>
	      	<td colspan="4">
	      	<span>&nbsp${tbWorkInspect.problem} </span>
				
	      	</td>
	      	
	    </tr>
	    
	     <tr>
	   		  <td colspan="2" style="text-align: center;font-weight:bold ;">分管领导签字</td>
	   		  <td >&nbsp${tbWorkInspect.hldSign}</td>
	      	 <td style="text-align: center;font-weight:bold ;">部门负责人签名</td>
	      	 <td >&nbsp${tbWorkInspect.deptSign}</td>
	    </tr>
	     
  </tbody>
</table>  
	<!-- 模态窗口 -->		
<div class="modal fade" id="myModal" style="width:500px;display: none;" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
				</button>
				<h4 class="modal-title" id="myModalLabel">
					退回原因
				</h4>
			</div>
			<div class="modal-body" >
				<textarea id="remarks" name="remarks" maxlength="5000"  style="width:450px"  class="input-xlarge" rows="5"></textarea>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">
					关闭
				</button>
				<button type="button" class="btn btn-primary" onclick='submitReson("${tbYear.id}")'>
					提交
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</body>
</html>