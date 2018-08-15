<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>参加机关党风廉政建设活动情况管理</title>
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
		<li><a href="${ctx}/accounts/tbOfficeDflz/list">参加机关党风廉政建设活动情况列表</a></li>
		<li class="active"><a href="${ctx}/accounts/tbOfficeDflz/form?id=${tbOfficeDflz.id}">参加机关党风廉政建设活动情况<shiro:hasPermission name="accounts:tbOfficeDflz:edit">${not empty tbOfficeDflz.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="accounts:tbOfficeDflz:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="tbOfficeDflz" action="${ctx}/accounts/tbOfficeDflz/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">活动名称：</label>
			<div class="controls">
				<form:input path="activityName" htmlEscape="false" maxlength="2000" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">主办单位：</label>
			<div class="controls">
				<form:input path="organizer" htmlEscape="false" maxlength="2000" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">时间：</label>
			<div class="controls">
				<input name="activityTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
					value="<fmt:formatDate value="${tbOfficeDflz.activityTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">部门参加人数：</label>
			<div class="controls">
				<form:input path="personNum" htmlEscape="false" maxlength="10" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">未参加人员：</label>
			<div class="controls">
				<form:input path="noCome" htmlEscape="false" maxlength="2000" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">未参加原因：</label>
			<div class="controls">
				<form:input path="reason" htmlEscape="false" maxlength="2000" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">活动内容：</label>
			<div class="controls">
				<form:input path="activityContent" htmlEscape="false" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">收获与体会：</label>
			<div class="controls">
				<form:input path="obtain" htmlEscape="false" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">录入时间：</label>
			<div class="controls">
				<input name="lrDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required "
					value="<fmt:formatDate value="${tbOfficeDflz.lrDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
					<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">归属支行:</label>
			<div class="controls">
                <sys:treeselect id="company" name="company.id" value="${tbOfficeDflz.company.id}" labelName="company.name" labelValue="${tbOfficeDflz.company.name}"
					title="支行" url="/sys/office/treeData?type=1" cssClass="required"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">归属部门:</label>
			<div class="controls">
                <sys:treeselect id="office" name="office.id" value="${tbOfficeDflz.office.id}" labelName="office.name" labelValue="${tbOfficeDflz.office.name}"
					title="部门" url="/sys/office/treeData?type=2" cssClass="required" notAllowSelectParent="true"/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="accounts:tbOfficeDflz:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>