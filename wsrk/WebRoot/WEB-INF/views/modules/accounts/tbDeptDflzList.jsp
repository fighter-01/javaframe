<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>部门组织的党风廉政建设活动管理</title>
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
		<li class="active"><a href="${ctx}/accounts/tbDeptDflz/list">部门组织的党风廉政建设活动列表</a></li>
		<shiro:hasPermission name="accounts:tbDeptDflz:edit"><li><a href="${ctx}/accounts/tbDeptDflz/form">部门组织的党风廉政建设活动添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="tbDeptDflz" action="${ctx}/accounts/tbDeptDflz/list" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>活动名称：</label>
				<form:input path="activityName" htmlEscape="false" maxlength="2000" class="input-medium"/>
			</li>
			<li><label>活动时间：</label>
				<input name="activityTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${tbDeptDflz.activityTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>活动地点：</label>
				<form:input path="activityPlace" htmlEscape="false" maxlength="1000" class="input-medium"/>
			</li>
			<li><label>录入时间：</label>
				<input name="beginLrDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${tbDeptDflz.beginLrDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endLrDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${tbDeptDflz.endLrDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>归属支行：</label>
				<sys:treeselect id="company" name="company.id" value="${tbDeptDflz.company.id}" labelName="company.name" labelValue="${tbDeptDflz.company.name}"
					title="部门" url="/sys/office/treeData?type=1" cssClass="input-small" allowClear="true" />
			</li>
			<li><label>归属部门：</label>
				<sys:treeselect id="office" name="office.id" value="${tbDeptDflz.office.id}" labelName="office.name" labelValue="${tbDeptDflz.office.name}"
					title="部门" url="/sys/office/treeData?type=2" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>活动名称</th>
				<th>活动时间</th>
				<th>活动地点</th>
				<th>主 持 人</th>
				<th>参加人数</th>
				<th>录入时间</th>
				<th>归属支行</th>
				<th>归属部门</th>
				<shiro:hasPermission name="accounts:tbDeptDflz:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="tbDeptDflz">
			<tr>
				<td><a href="${ctx}/accounts/tbDeptDflz/form?id=${tbDeptDflz.id}">
					${tbDeptDflz.activityName}
				</a></td>
				<td>
					<fmt:formatDate value="${tbDeptDflz.activityTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${tbDeptDflz.activityPlace}
				</td>
				<td>
					${tbDeptDflz.anchorman}
				</td>
				<td>
					${tbDeptDflz.personNum}
				</td>
				<td>
					<fmt:formatDate value="${tbDeptDflz.lrDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${tbDeptDflz.company.name}
				</td>
				<td>
					${tbDeptDflz.office.name}
				</td>
				<shiro:hasPermission name="accounts:tbDeptDflz:edit"><td>
    				<a href="${ctx}/accounts/tbDeptDflz/form?id=${tbDeptDflz.id}">修改</a>
					<a href="${ctx}/accounts/tbDeptDflz/delete?id=${tbDeptDflz.id}" onclick="return confirmx('确认要删除该部门组织的党风廉政建设活动吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>