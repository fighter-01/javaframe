<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>接受监督情况管理</title>
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
<h2 id="title" class="text-center" style="margin-top:40px;">七、接受监督情况</h2>
	</br>
			<input class="Noprint" id="btnSubmit" onclick='doPrint()' style="float:right;margin-right:80px;margin-bottom: 10px" class="btn btn-primary" type="submit" value="&nbsp;打&nbsp;&nbsp;印&nbsp;"/>
	</br>
	</br>
	<table id="contentTable" class="table table-bordered " style="font-family:SimSun;font-size:15px;width:80%;margin: auto;border: 1px solid #333; margin-bottom: 30px " >
			
			<tr style="width: 80%;margin: auto;border: 1px solid #333; " >
				<td style="text-align: center;font-weight:bold ;">被反映人</td>
				<td style="text-align: center;">${tbSupervision.reflectmanName}</td>
				<td width="25%" style="text-align: center;font-weight:bold ;">反映人(单位)</td>
				<td width="25%" style="text-align: center;">${tbSupervision.reflectmanUnit}</td>
			</tr>
			<tr>
				<td width="25%" style="text-align: center;font-weight:bold ;">反映时间</td>
				<td width="25%" style="text-align: center;">
					<fmt:formatDate value="${tbSupervision.reflectTime}" pattern="yyyy-MM-dd"/>
				</td>
				<td  style="text-align: center;font-weight:bold ;">反映形式</td>
				<td  style="text-align: center;">${tbSupervision.reflectWay} </td>
			</tr>
			<tr>
					<td  style="text-align: center;font-weight:bold ;"><br>反<br><br>映<br><br>意<br><br>见<br><br>或<br><br>建<br><br>议<br></td>
					<td  colspan="3" style="text-align: center;">${tbSupervision.reflectContent}</td>
			</tr>
			<tr>
					<td  style="text-align: center;font-weight:bold ;"><br>整<br><br>改<br><br>落<br><br>实<br><br>情<br><br>况<br></td>
					<td  colspan="3" style="text-align: center;">${tbSupervision.abarbeitung}</td>
			</tr>
	</table>
</body>
</html>