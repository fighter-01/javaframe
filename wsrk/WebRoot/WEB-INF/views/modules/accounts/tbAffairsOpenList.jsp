<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>行(政)务公开情况管理</title>
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
		<li class="active"><a href="${ctx}/accounts/tbAffairsOpen/list">行(政)务公开情况列表</a></li>
		<shiro:hasPermission name="accounts:tbAffairsOpen:edit"><li><a href="${ctx}/accounts/tbAffairsOpen/form">行(政)务公开情况添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="tbAffairsOpen" action="${ctx}/accounts/tbAffairsOpen/list" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>公开事项：</label>
				<form:input path="openAffairs" htmlEscape="false" maxlength="1000" class="input-medium"/>
			</li>
			<li><label>公开时间：</label>
				<input name="openTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${tbAffairsOpen.openTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>公开形式：</label>
				<form:input path="openWay" htmlEscape="false" maxlength="1000" class="input-medium"/>
			</li>
			<li><label>录入时间：</label>
				<input name="beginLrDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${tbAffairsOpen.beginLrDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endLrDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${tbAffairsOpen.endLrDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>归属支行：</label>
				<sys:treeselect id="company" name="company.id" value="${tbAffairsOpen.company.id}" labelName="company.name" labelValue="${tbAffairsOpen.company.name}"
					title="部门" url="/sys/office/treeData?type=1" cssClass="input-small" allowClear="true" />
			</li>
			<li><label>归属部门：</label>
				<sys:treeselect id="office" name="office.id" value="${tbAffairsOpen.office.id}" labelName="office.name" labelValue="${tbAffairsOpen.office.name}"
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
				<th>公开事项</th>
				<th>公开时间</th>
				<th>公开形式</th>
				<th>公开范围</th>
				<th>提交者姓名</th>
				<th>录入时间</th>
				<th>归属支行</th>
				<th>归属部门</th>
				<shiro:hasPermission name="accounts:tbAffairsOpen:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="tbAffairsOpen">
			<tr>
				<td><a href="${ctx}/accounts/tbAffairsOpen/form?id=${tbAffairsOpen.id}">
					${tbAffairsOpen.openAffairs}
				</a></td>
				<td>
					<fmt:formatDate value="${tbAffairsOpen.openTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${tbAffairsOpen.openWay}
				</td>
				<td>
					${tbAffairsOpen.openRange}
				</td>
				<td>
					${tbAffairsOpen.createName}
				</td>
				<td>
					<fmt:formatDate value="${tbAffairsOpen.lrDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${tbAffairsOpen.company.name}
				</td>
				<td>
					${tbAffairsOpen.office.name}
				</td>
				<shiro:hasPermission name="accounts:tbAffairsOpen:edit"><td>
    				<a href="${ctx}/accounts/tbAffairsOpen/form?id=${tbAffairsOpen.id}">修改</a>
					<a href="${ctx}/accounts/tbAffairsOpen/delete?id=${tbAffairsOpen.id}" onclick="return confirmx('确认要删除该行(政)务公开情况吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>