<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>党风廉政建设工作计划及措施管理</title>
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
		<li class="active"><a href="${ctx}/accounts/tbPlan/list">党风廉政建设工作计划及措施列表</a></li>
		<shiro:hasPermission name="accounts:tbPlan:edit"><li><a href="${ctx}/accounts/tbPlan/form">党风廉政建设工作计划及措施添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="tbPlan" action="${ctx}/accounts/tbPlan/list" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>归属支行：</label><sys:treeselect id="company" name="company.id" value="${tbPlan.company.id}" labelName="company.name" labelValue="${tbPlan.company.name}" 
				title="支行" url="/sys/office/treeData?type=1" cssClass="input-small" allowClear="true"/>
			</li>
			<li><label>归属部门：</label>
				<sys:treeselect id="office" name="office.id" value="${tbPlan.office.id}" labelName="office.name" labelValue="${tbPlan.office.name}" 
				title="部门" url="/sys/office/treeData?type=2" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
			</li>
			<li><label>录入时间：</label>
				<input name="beginLrDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${tbPlan.beginLrDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endLrDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${tbPlan.endLrDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			
			<%-- <li><label>提交者姓名：</label>
				<form:input path="createName" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li> --%>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>内容</th>
				<th>录入时间</th>
				<!-- <th>备注信息</th> -->
				<th>归属支行</th>
				<th>归属部门</th>
				<th>提交者姓名</th>
				<shiro:hasPermission name="accounts:tbPlan:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="tbPlan">
			<tr>
				<td><a href="${ctx}/accounts/tbPlan/form?id=${tbPlan.id}">
			      ${fns:abbr(tbPlan.content,40)}
					</a>
				</td>
				<td>
				<fmt:formatDate value="${tbPlan.lrDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<%-- <td>
					${tbPlan.remarks}
				</td> --%>
				<td>${tbPlan.company.name}</td>
				<td>${tbPlan.office.name}</td>
				<td>
					${tbPlan.createName}
				</td>
				<shiro:hasPermission name="accounts:tbPlan:edit"><td>
    				<a href="${ctx}/accounts/tbPlan/form?id=${tbPlan.id}">修改</a>
					<a href="${ctx}/accounts/tbPlan/delete?id=${tbPlan.id}" onclick="return confirmx('确认要删除该党风廉政建设工作计划及措施吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>