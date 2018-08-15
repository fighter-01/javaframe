<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用户管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#no").focus();
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
		<li><a href="${ctx}/cms/push/list">推送列表</a></li>
		<li class="active"><a href="${ctx}/cms/push/form?id=${push.id}">推送<shiro:hasPermission name="cms:push:edit">${not empty push.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="cms:push:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="push" action="${ctx}/cms/push/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<div class="control-group">
			<label class="control-label">内容:</label>
			<div class="controls">
				<form:input path="content" htmlEscape="false" maxlength="50" class="required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">目标平台:</label>
			<div class="controls">
			<form:select path="platform" class="required">
				<form:option value="all">全部</form:option>
				<form:option value="android">android</form:option>
				<form:option value="ios">ios</form:option>
			</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">推送类型:</label>
			<div class="controls">
			<form:select path="platform" class="required">
				<form:option value="alert">通知</form:option>
				<form:option value="message">自定义消息</form:option>
			</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">设备标签</label>
			<div class="controls">
				<form:input path="aliases" htmlEscape="false" maxlength="50" class="required"/>
				<span class="help-inline"><font color="red">可以为空，多个标签之间用,隔开</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">推送别名</label>
			<div class="controls">
				<form:input path="tagValues" htmlEscape="false" maxlength="50" class="required"/>
				<span class="help-inline"><font color="red">可以为空，多个标签之间用,隔开</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">推送设备号</label>
			<div class="controls">
				<form:input path="registrationIds" htmlEscape="false" maxlength="50" class="required"/>
				<span class="help-inline"><font color="red">可以为空，多个标签之间用,隔开</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">推送组名</label>
			<div class="controls">
				<form:input path="segments" htmlEscape="false" maxlength="50" class="required"/>
				<span class="help-inline"><font color="red">可以为空，多个标签之间用,隔开</font> </span>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="cms:push:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>