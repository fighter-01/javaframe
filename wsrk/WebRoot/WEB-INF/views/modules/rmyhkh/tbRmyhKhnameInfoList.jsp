<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>考核表名管理</title>
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
		<li class="active"><a href="${ctx}/rmyhkh/tbRmyhKhnameInfo/">考核表名列表</a></li>
		<shiro:hasPermission name="rmyhkh:tbRmyhKhnameInfo:edit"><li><a href="${ctx}/rmyhkh/tbRmyhKhnameInfo/form">考核表名添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="tbRmyhKhnameInfo" action="${ctx}/rmyhkh/tbRmyhKhnameInfo/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>考核表单名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>考核开始时间：</label>
				<input name="khStartTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${tbRmyhKhnameInfo.khStartTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>考核截止日期：</label>
				<input name="khEndTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${tbRmyhKhnameInfo.khEndTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>考核表单名称</th>
				<th>考核开始时间</th>
				<th>考核截止日期</th>
				<th>创建人</th>
				<shiro:hasPermission name="rmyhkh:tbRmyhKhnameInfo:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="tbRmyhKhnameInfo">
			<tr>
				<td><a href="${ctx}/rmyhkh/tbRmyhKhnameInfo/form?id=${tbRmyhKhnameInfo.id}">
					${tbRmyhKhnameInfo.name}
				</a></td>
				<td>
					<fmt:formatDate value="${tbRmyhKhnameInfo.khStartTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${tbRmyhKhnameInfo.khEndTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${tbRmyhKhnameInfo.createBy.id}
				</td>
				<shiro:hasPermission name="rmyhkh:tbRmyhKhnameInfo:edit"><td>
    				<a href="${ctx}/rmyhkh/tbRmyhKhnameInfo/form?id=${tbRmyhKhnameInfo.id}">修改</a>
					<a href="${ctx}/rmyhkh/tbRmyhKhnameInfo/delete?id=${tbRmyhKhnameInfo.id}" onclick="return confirmx('确认要删除该考核表名吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>