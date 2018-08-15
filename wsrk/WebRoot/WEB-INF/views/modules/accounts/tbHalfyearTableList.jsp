<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>半年自查表管理</title>
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
		<li class="active"><a href="${ctx}/accounts/tbHalfyearTable/">半年自查表列表</a></li>
		<shiro:hasPermission name="accounts:tbHalfyearTable:edit"><li><a href="${ctx}/accounts/tbHalfyearTable/form">半年自查表添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="tbHalfyearTable" action="${ctx}/accounts/tbHalfyearTable/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>台账类型：</label>
				<form:input path="type" htmlEscape="false" maxlength="3" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>台账类型</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="accounts:tbHalfyearTable:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="tbHalfyearTable">
			<tr>
				<td><a href="${ctx}/accounts/tbHalfyearTable/form?id=${tbHalfyearTable.id}">
					${tbHalfyearTable.type}
				</a></td>
				<td>
					<fmt:formatDate value="${tbHalfyearTable.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${tbHalfyearTable.remarks}
				</td>
				<shiro:hasPermission name="accounts:tbHalfyearTable:edit"><td>
    				<a href="${ctx}/accounts/tbHalfyearTable/form?id=${tbHalfyearTable.id}">修改</a>
					<a href="${ctx}/accounts/tbHalfyearTable/delete?id=${tbHalfyearTable.id}" onclick="return confirmx('确认要删除该半年自查表吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>