<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>参加机关党风廉政建设活动情况管理</title>
	<meta name="decorator" content="default"/>
	<object id="WebBrowser" classid=CLSID:8856F961-340A-11D0-A96B-00C04FD705A2 height="0" width="0"> 
</object> 
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
		});
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
		<h2 id="title" class="text-center" style="margin-top:40px;">三、参加机关党风廉政建设活动情况</h2>
	</br>
			<input class="Noprint" id="btnSubmit" onclick='doPrint()' style="float:right;margin-right:80px;margin-bottom: 10px" class="btn btn-primary" type="submit" value="&nbsp;打&nbsp;&nbsp;印&nbsp;"/>
	</br>
	</br>
	<table id="contentTable" class="table table-bordered " style="font-family:SimSun;font-size:15px;width:80%;margin: auto;border: 1px solid #333; margin-bottom: 30px " >
			
			<tr style="width: 80%;margin: auto;border: 1px solid #333; " >
				<td style="text-align: center;font-weight:bold ;">活动名称</td>
				<td style="text-align: center;" colspan="3">${tbOfficeDflz.activityName}</td>
				
			</tr>
			<tr>
				<td width="25%" style="text-align: center;font-weight:bold ;">主办单位</td>
				<td width="25%" style="text-align: center;" colspan="3">${tbOfficeDflz.organizer}</td>
			</tr>
			<tr>
					<td  style="text-align: center;font-weight:bold ;">时间</td>
					<td  style="text-align: center;">
						<fmt:formatDate value="${tbOfficeDflz.activityTime}" pattern="yyyy-MM-dd"/> 
					</td>
					<td  width="25%" style="text-align: center;font-weight:bold ;">部门参加人数</td>
					<td width="25%" style="text-align: center;">${tbOfficeDflz.personNum}名</td>
			</tr>
			<tr>
					<td  style="text-align: center;font-weight:bold ;">未参加人员</td>
					<td  colspan="3" style="text-align: center;">${tbOfficeDflz.noCome}名</td>
			</tr>
			<tr>
					<td  style="text-align: center;font-weight:bold ;">未参加原因</td>
					<td  colspan="3" style="text-align: center;">${tbOfficeDflz.reason}</td>
			</tr>
			<tr>
					<td  style="text-align: center;font-weight:bold ;"><br>活<br><br>动<br><br>内<br><br>容<br><br></td>
					<td  colspan="3" style="text-align: center;">${tbOfficeDflz.activityContent}</td>
			</tr>
			<tr>
					<td  style="text-align: center;font-weight:bold ;"><br>收<br><br>获<br><br>与<br><br>体<br><br>会<br><br></td>
					<td  colspan="3" style="text-align: center;">${tbOfficeDflz.obtain}</td>
			</tr>
	</table>
</body>
</html>