<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>添加源</title>
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
		<li><a href="${ctx}/cms/rssSource/list">RSS源列表</a></li>
		<li class="active"><a href="${ctx}/cms/rssSource/form?id=${rssSource.id}">RSS源<shiro:hasPermission name="cms:rss:edit">${not empty rssSource.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="cms:rssSource:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="rssSource" action="${ctx}/cms/rssSource/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<div class="control-group">
			<label class="control-label">源名称:</label>
			<div class="controls">
				<form:input path="rssName" htmlEscape="false" maxlength="50" class="required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">源网址</label>
			<div class="controls">
				<form:input path="rssUrl" htmlEscape="false" maxlength="50" class="required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">解析方法</label>
			<div class="controls">
				<form:input path="rssParser" htmlEscape="false" maxlength="50" class="input-xlarge "/>
				<span class="help-inline"><font color="red">默认为空</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">时间间隔</label>
			<div class="controls">
				<form:input path="refTime" htmlEscape="false" maxlength="50" class="required"/>
				<span class="help-inline"><font color="red">间隔多久取一次</font> </span>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="cms:rss:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>