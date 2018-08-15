<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>台账评分管理</title>
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
		<li><a href="${ctx}/accounts/tbAccountsScore/list">台账评分列表</a></li>
		<li class="active"><a href="${ctx}/accounts/tbAccountsScore/form?id=${tbAccountsScore.id}">台账评分<shiro:hasPermission name="accounts:tbAccountsScore:edit">${not empty tbAccountsScore.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="accounts:tbAccountsScore:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="tbAccountsScore" action="${ctx}/accounts/tbAccountsScore/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">年：</label>
			<div class="controls">
				<input name="year" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
					value="<fmt:formatDate value="${tbAccountsScore.year}" pattern="yyyy"/>"
					onclick="WdatePicker({dateFmt:'yyyy',isShowClear:false});"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">季度：</label>
			<div class="controls">
				<form:select path="jidu" class="input-xlarge required">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('jidu')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">评分：</label>
			<div class="controls">
				<form:input path="score" htmlEscape="false" maxlength="4" class="input-xlarge required digits"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">评语：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="2555" class="input-xxlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">归属部门：</label>
			<div class="controls">
				<sys:treeselect id="office" name="office.id" value="${tbAccountsScore.office.id}" labelName="office.name" labelValue="${tbAccountsScore.office.name}"
					title="部门" url="/sys/office/treeData?type=2" cssClass="required" allowClear="true" notAllowSelectParent="false"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="accounts:tbAccountsScore:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>