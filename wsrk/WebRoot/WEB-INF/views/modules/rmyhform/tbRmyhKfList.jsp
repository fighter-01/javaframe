<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>扣分原因管理</title>
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
		<li class="active"><a href="${ctx}/rmyhform/tbRmyhKf/">扣分原因列表</a></li>
		<shiro:hasPermission name="rmyhform:tbRmyhKf:edit"><li><a href="${ctx}/rmyhform/tbRmyhKf/form">扣分原因添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="tbRmyhKf" action="${ctx}/rmyhform/tbRmyhKf/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>编号：</label>
				<form:input path="id" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>stand_id：</label>
				<form:input path="standId" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			
			<li><label>score：</label>
				<form:input path="score" htmlEscape="false" class="input-medium"/>
			</li>
			<li><label>扣分事由：</label>
				<form:input path="kfreason" htmlEscape="false" class="input-medium"/>
			</li>
			<li><label>rev1：</label>
				<form:input path="rev1" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr >
				<th>编号</th>
				<th>stand_id</th>
				
				<th>score</th>
				<th>扣分事由</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission  name="rmyhform:tbRmyhKf:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="tbRmyhKf">
			<tr>
				<td><a href="${ctx}/rmyhform/tbRmyhKf/form?id=${tbRmyhKf.id}">
					${tbRmyhKf.id}
				</a></td>
				<td>
					${tbRmyhKf.standId}
				</td>
				
				<td>
					${tbRmyhKf.score}
				</td>
				<td>
					${tbRmyhKf.kfreason}
				</td>
				<td>
					<fmt:formatDate value="${tbRmyhKf.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${tbRmyhKf.remarks}
				</td>
				<shiro:hasPermission name="rmyhform:tbRmyhKf:edit"><td>
    				<a href="${ctx}/rmyhform/tbRmyhKf/form?id=${tbRmyhKf.id}">修改</a>
					<a href="${ctx}/rmyhform/tbRmyhKf/delete?id=${tbRmyhKf.id}" onclick="return confirmx('确认要删除该扣分原因吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>