<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>党风廉政建设工作计划及措施管理</title>
	<meta name="decorator" content="default"/>
	<object id="WebBrowser" classid=CLSID:8856F961-340A-11D0-A96B-00C04FD705A2 height="0" width="0"> 
</object> 
	<script type="text/javascript">
	function doPrint(){
   	 
		 document.all.WebBrowser.ExecWB(7,1);
	     }
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
</head>
<body>
		<h2 id="title" class="text-center" style="margin-top:40px;">二、党风廉政建设工作计划及措施</h2>
	</br>
			<input class="Noprint" id="btnSubmit" onclick='doPrint()' style="float:right;margin-right:80px;margin-bottom: 10px" class="btn btn-primary" type="submit" value="&nbsp;打&nbsp;&nbsp;印&nbsp;"/>
	</br>
	</br>
		<sys:message content="${message}"/>	
		
		<div style="text-decoration:underline;margin-left: 50px;margin-right: 50px">
		 <span style="line-height:40px;font-family:宋体;font-size: 22px" >&nbsp&nbsp${tbPlan.content}</span>
	
		</div>	
		

</body>
</html>