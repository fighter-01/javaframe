<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>行(政)务公开情况管理</title>
	<meta name="decorator" content="default"/>
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
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/accounts/tbAffairsOpen/list">行(政)务公开情况列表</a></li>
		<li class="active"><a href="${ctx}/accounts/tbAffairsOpen/form?id=${tbAffairsOpen.id}">行(政)务公开情况<shiro:hasPermission name="accounts:tbAffairsOpen:edit">${not empty tbAffairsOpen.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="accounts:tbAffairsOpen:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="tbAffairsOpen" action="${ctx}/accounts/tbAffairsOpen/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">公开事项：</label>
			<div class="controls">
				<form:input path="openAffairs" htmlEscape="false" maxlength="1000" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">公开时间：</label>
			<div class="controls">
				<input name="openTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
					value="<fmt:formatDate value="${tbAffairsOpen.openTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">公开形式：</label>
			<div class="controls">
				<form:input path="openWay" htmlEscape="false" maxlength="1000" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">公开范围：</label>
			<div class="controls">
				<form:input path="openRange" htmlEscape="false" maxlength="1000" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">公开的主要内容：</label>
			<div class="controls">
				<form:textarea path="openContent" htmlEscape="false" rows="4" class="input-xxlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">群众意见或成效：</label>
			<div class="controls">
				<form:textarea path="obtain" htmlEscape="false" rows="4" class="input-xxlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">录入时间：</label>
			<div class="controls">
				<input name="lrDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${tbAffairsOpen.lrDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">归属支行：</label>
			<div class="controls">
				<sys:treeselect id="company" name="company.id" value="${tbAffairsOpen.company.id}" labelName="company.name" labelValue="${tbAffairsOpen.company.name}"
					title="部门" url="/sys/office/treeData?type=1" cssClass="required" allowClear="true" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">归属部门：</label>
			<div class="controls">
				<sys:treeselect id="office" name="office.id" value="${tbAffairsOpen.office.id}" labelName="office.name" labelValue="${tbAffairsOpen.office.name}"
					title="部门" url="/sys/office/treeData?type=2" cssClass="required" allowClear="true" notAllowSelectParent="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="accounts:tbAffairsOpen:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>