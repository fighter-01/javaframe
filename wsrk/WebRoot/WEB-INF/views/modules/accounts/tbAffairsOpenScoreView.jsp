<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>行(政)务公开情况管理</title>
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
	<h2 id="title" class="text-center" style="margin-top:40px;">五、行(政)务公开情况</h2>
	</br>
			<input class="Noprint" id="btnSubmit" onclick='doPrint()' style="float:right;margin-right:80px;margin-bottom: 10px" class="btn btn-primary" type="submit" value="&nbsp;打&nbsp;&nbsp;印&nbsp;"/>
	</br>
	</br>
	<table id="contentTable" class="table table-bordered " style="font-family:SimSun;font-size:15px;width:80%;margin: auto;border: 1px solid #333; margin-bottom: 30px " >
			
			<tr style="width: 80%;margin: auto;border: 1px solid #333; " >
				<td style="text-align: center;font-weight:bold ;">公开事项</td>
				<td style="text-align: center;" colspan="3">${tbAffairsOpen.openAffairs}</td>
				
			</tr>
			<tr>
				<td width="25%" style="text-align: center;font-weight:bold ;">公开时间</td>
				<td width="25%" style="text-align: center;">
					<fmt:formatDate value="${tbAffairsOpen.openTime}" pattern="yyyy-MM-dd"/>
				</td>
				<td  style="text-align: center;font-weight:bold ;">公开形式</td>
				<td  style="text-align: center;">${tbAffairsOpen.openWay} </td>
			</tr>
			<tr>
					<td  style="text-align: center;font-weight:bold ;">公开范围</td>
					<td  colspan="3" style="text-align: center;">${tbAffairsOpen.openRange}</td>
			</tr>
			<tr>
					<td  style="text-align: center;font-weight:bold ;"><br>公<br><br>开<br><br>的<br><br>主<br><br>要<br><br>内<br><br>容<br></td>
					<td  colspan="3" style="text-align: center;">${tbAffairsOpen.openContent}</td>
			</tr>
			<tr>
					<td  style="text-align: center;font-weight:bold ;"><br>群众<br><br>意见<br><br>或<br><br>成效<br></td>
					<td  colspan="3" style="text-align: center;">${tbAffairsOpen.obtain}</td>
			</tr>
	</table>

		
</body>
</html>