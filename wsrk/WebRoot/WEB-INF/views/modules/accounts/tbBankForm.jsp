<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>个人有关金融事项报告表管理</title>
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
		<li><a href="${ctx}/accounts/tbBank/">个人有关金融事项报告表列表</a></li>
		<li class="active"><a href="${ctx}/accounts/tbBank/form?id=${tbBank.id}">个人有关金融事项报告表<shiro:hasPermission name="accounts:tbBank:edit">${not empty tbBank.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="accounts:tbBank:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="tbBank" action="${ctx}/accounts/tbBank/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">sex：</label>
			<div class="controls">
				<form:input path="sex" htmlEscape="false" maxlength="1" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">name：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="1000" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">民族：</label>
			<div class="controls">
				<form:input path="mz" htmlEscape="false" maxlength="1000" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">学历：</label>
			<div class="controls">
				<form:input path="whcd" htmlEscape="false" maxlength="1000" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">所在部门：</label>
			<div class="controls">
				<form:input path="department" htmlEscape="false" maxlength="200" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">职务：</label>
			<div class="controls">
				<form:input path="zw" htmlEscape="false" maxlength="1000" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">政治面貌：</label>
			<div class="controls">
				<form:input path="zzmm" htmlEscape="false" maxlength="1000" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">职称：</label>
			<div class="controls">
				<form:input path="zc" htmlEscape="false" maxlength="3" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">婚姻状况：</label>
			<div class="controls">
				<form:input path="hyzk" htmlEscape="false" maxlength="2" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">金融活动参与人：</label>
			<div class="controls">
				<form:input path="jrhdCyr" htmlEscape="false" maxlength="1" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">金融活动_活动名称：</label>
			<div class="controls">
				<form:input path="jrhdHdmc" htmlEscape="false" maxlength="1000" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">jrhd_sjje：</label>
			<div class="controls">
				<form:input path="jrhdSjje" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">事件具体情况：</label>
			<div class="controls">
				<form:input path="jrhdJtsj" htmlEscape="false" maxlength="2000" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">贷款逾期种类：</label>
			<div class="controls">
				<form:input path="dkyqYjzl" htmlEscape="false" maxlength="1" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">贷款逾期涉及金额：</label>
			<div class="controls">
				<form:input path="dkyqSjje" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">涉及金融机构名称：</label>
			<div class="controls">
				<form:input path="dkyqJrjgmc" htmlEscape="false" maxlength="200" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">贷款逾期时间：</label>
			<div class="controls">
				<input name="dkyqSj" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${tbBank.dkyqSj}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">被起诉时间：</label>
			<div class="controls">
				<input name="dkyqBqssj" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${tbBank.dkyqBqssj}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">事件具体情况：</label>
			<div class="controls">
				<form:input path="dkyqBqjtqk" htmlEscape="false" maxlength="2000" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">民间借款涉及金额：</label>
			<div class="controls">
				<form:input path="mjjkSjje" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">债权人姓名：</label>
			<div class="controls">
				<form:input path="mjjkXm" htmlEscape="false" maxlength="10" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">与债权人的关系：</label>
			<div class="controls">
				<form:input path="mjjkGx" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">逾期时间：</label>
			<div class="controls">
				<input name="mjjkSj" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${tbBank.mjjkSj}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">事件具体情况：</label>
			<div class="controls">
				<form:input path="mjjkJtqk" htmlEscape="false" maxlength="2000" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">担保金额：</label>
			<div class="controls">
				<form:input path="dbJe" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">被担保人姓名（单位名称）：</label>
			<div class="controls">
				<form:input path="dbXm" htmlEscape="false" maxlength="200" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">与被担保人（单位）的关系：</label>
			<div class="controls">
				<form:input path="dbGx" htmlEscape="false" maxlength="200" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">事件具体情况：</label>
			<div class="controls">
				<form:input path="dbSjjtqk" htmlEscape="false" maxlength="2000" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">涉及金额：</label>
			<div class="controls">
				<form:input path="creditJe" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">涉及金融机构名称：</label>
			<div class="controls">
				<form:input path="creditDeptname" htmlEscape="false" maxlength="200" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">逾期时间：</label>
			<div class="controls">
				<input name="creditDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${tbBank.creditDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">借卡人姓名：</label>
			<div class="controls">
				<form:input path="creditName" htmlEscape="false" maxlength="200" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">与被借卡人（单位）的关系：</label>
			<div class="controls">
				<form:input path="creditGx" htmlEscape="false" maxlength="200" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">事件具体情况：</label>
			<div class="controls">
				<form:input path="creditQk" htmlEscape="false" maxlength="2000" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">涉及金额：</label>
			<div class="controls">
				<form:input path="gmSjje" htmlEscape="false" maxlength="200" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">购买金融产品（投资项目）名称：</label>
			<div class="controls">
				<form:input path="gmName" htmlEscape="false" maxlength="200" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">gm_xm：</label>
			<div class="controls">
				<form:input path="gmXm" htmlEscape="false" maxlength="200" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">与购买人的关系：</label>
			<div class="controls">
				<form:input path="gmGx" htmlEscape="false" maxlength="200" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">事件具体情况：</label>
			<div class="controls">
				<form:input path="gmQk" htmlEscape="false" maxlength="2000" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">其他个人金融风险情况：</label>
			<div class="controls">
				<form:input path="qtFx" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">报告日期：</label>
			<div class="controls">
				<input name="bgrq" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${tbBank.bgrq}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">有变化：</label>
			<div class="controls">
				<form:radiobuttons path="bh" items="${fns:getDictList('')}" itemLabel="label" itemValue="value" htmlEscape="false" class=""/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">归属支行：</label>
			<div class="controls" style="float:left;margin-left: 5px">
				<sys:treeselect id="company" name="company.id" value="${tbBank.company.id}" labelName="company.name" labelValue="${tbYear.company.name}"
					title="部门" url="/sys/office/treeData?type=1" cssClass="required" allowClear="true" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
			<div style="float:left;margin-right: 0px;">
			<label class="control-label">归属部门：</label>
			<div class="controls">
				<sys:treeselect id="office" name="office.id" value="${tbBank.office.id}" labelName="office.name" labelValue="${tbYear.office.name}"
					title="部门" url="/sys/office/treeData?type=2" cssClass="required" allowClear="true" notAllowSelectParent="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="accounts:tbBank:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>