<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>廉政教育谈话情况管理</title>
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
<h2 id="title" class="text-center" style="margin-top:40px;">六、廉政教育谈话情况</h2>
	</br>
			<input class="Noprint" id="btnSubmit" onclick='doPrint()' style="float:right;margin-right:80px;margin-bottom: 10px" class="btn btn-primary" type="submit" value="&nbsp;打&nbsp;&nbsp;印&nbsp;"/>
	</br>
	</br>
	<table id="contentTable" class="table table-bordered " style="font-family:SimSun;font-size:15px;width:80%;margin: auto;border: 1px solid #333; margin-bottom: 30px " >
			
			<tr style="width: 80%;margin: auto;border: 1px solid #333; " >
				<td style="text-align: center;font-weight:bold ;">主 谈 人</td>
				<td style="text-align: center;">${tbEducation.anchorman}</td>
				<td width="25%" style="text-align: center;font-weight:bold ;">谈话对象</td>
				<td width="25%" style="text-align: center;">${tbEducation.talkObject}</td>
			</tr>
			<tr>
				<td width="25%" style="text-align: center;font-weight:bold ;">谈话时间</td>
				<td width="25%" style="text-align: center;">
					<fmt:formatDate value="${tbEducation.talkTime}" pattern="yyyy-MM-dd"/>
				</td>
				<td  style="text-align: center;font-weight:bold ;">谈话地点</td>
				<td  style="text-align: center;">${tbEducation.talkPlace} </td>
			</tr>
			<tr>
					<td  style="text-align: center;font-weight:bold ;">谈话原因</td>
					<td  colspan="3" style="text-align: center;">${tbEducation.talkReason}</td>
			</tr>
			<tr>
					<td  style="text-align: center;font-weight:bold ;"><br>公<br><br>谈<br><br>话<br><br>记<br><br>录<br></td>
					<td  colspan="3" style="text-align: center;">${tbEducation.talkContent}</td>
			</tr>
			<tr>
					<td  style="text-align: center;font-weight:bold ;"><br>被<br><br>谈<br><br>人<br><br>承<br><br>诺<br></td>
					<td  colspan="3" style="text-align: center;">${tbEducation.talkPromise}</td>
			</tr>
	</table>

</body>
</html>