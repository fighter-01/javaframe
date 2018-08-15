<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>个人有关金融事项报告表管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/accounts/tbBank/">个人有关金融事项报告表列表</a></li>
		<shiro:hasPermission name="accounts:tbBank:edit"><li><a href="${ctx}/accounts/tbBank/form">个人有关金融事项报告表添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="tbBank" action="${ctx}/accounts/tbBank/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>name：</label>
				<form:input path="name" htmlEscape="false" maxlength="1000" class="input-medium"/>
			</li>
			<li><label>职称：</label>
				<form:input path="zc" htmlEscape="false" maxlength="3" class="input-medium"/>
			</li>
			<li><label>报告日期：</label>
				<input name="beginBgrq" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${tbBank.beginBgrq}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endBgrq" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${tbBank.endBgrq}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
		<li><label>归属支行：</label>
				<sys:treeselect id="company" name="company.id" value="${tbBank.company.id}" labelName="company.name" labelValue="${tbYear.company.name}"
					title="部门" url="/sys/office/treeData?type=1" cssClass="input-small" allowClear="true" />
			</li>
			<li><label>归属部门：</label>
				<sys:treeselect id="office" name="office.id" value="${tbBank.office.id}" labelName="office.name" labelValue="${tbYear.office.name}"
					title="部门" url="/sys/office/treeData?type=2" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
			</li>			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>name</th>
				<th>职称</th>
				<th>报告日期</th>
				<th>归属支行</th>
				<th>归属部门</th>
				<shiro:hasPermission name="accounts:tbBank:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="tbBank">
			<tr>
				<td><a href="${ctx}/accounts/tbBank/form?id=${tbBank.id}">
					${tbBank.name}
				</a></td>
				<td>
					${tbBank.zc}
				</td>
				<td>
					<fmt:formatDate value="${tbBank.bgrq}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${tbBank.office.name}
				</td>
				<td>
					${tbBank.office.name}
				</td>
				<shiro:hasPermission name="accounts:tbBank:edit"><td>
    				<a href="${ctx}/accounts/tbBank/form?id=${tbBank.id}">修改</a>
					<a href="${ctx}/accounts/tbBank/delete?id=${tbBank.id}" onclick="return confirmx('确认要删除该个人有关金融事项报告表吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>