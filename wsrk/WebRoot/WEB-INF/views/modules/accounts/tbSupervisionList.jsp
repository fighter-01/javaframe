<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>接受监督情况管理</title>
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
		<li class="active"><a href="${ctx}/accounts/tbSupervision/list">接受监督情况列表</a></li>
		<shiro:hasPermission name="accounts:tbSupervision:edit"><li><a href="${ctx}/accounts/tbSupervision/form">接受监督情况添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="tbSupervision" action="${ctx}/accounts/tbSupervision/list" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>被反映人：</label>
				<form:input path="reflectmanName" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>反映人单位：</label>
				<form:input path="reflectmanUnit" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>反映形式：</label>
				<form:input path="reflectWay" htmlEscape="false" maxlength="500" class="input-medium"/>
			</li>
			<li><label>录入时间：</label>
				<input name="beginLrDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${tbSupervision.beginLrDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endLrDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${tbSupervision.endLrDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>归属支行：</label>
				<sys:treeselect id="company" name="company.id" value="${tbSupervision.company.id}" labelName="company.name" labelValue="${tbSupervision.company.name}"
					title="部门" url="/sys/office/treeData?type=1" cssClass="input-small" allowClear="true" />
			</li>
			<li><label>归属部门：</label>
				<sys:treeselect id="office" name="office.id" value="${tbSupervision.office.id}" labelName="office.name" labelValue="${tbSupervision.office.name}"
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
				<th>被反映人</th>
				<th>反映人单位</th>
				<th>反映时间</th>
				<th>反映形式</th>
				<th>提交者姓名</th>
				<th>录入时间</th>
				<th>更新时间</th>
				<th>归属支行</th>
				<th>归属部门</th>
				<shiro:hasPermission name="accounts:tbSupervision:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="tbSupervision">
			<tr>
				<td><a href="${ctx}/accounts/tbSupervision/form?id=${tbSupervision.id}">
					${tbSupervision.reflectmanName}
				</a></td>
				<td>
					${tbSupervision.reflectmanUnit}
				</td>
				<td>
					<fmt:formatDate value="${tbSupervision.reflectTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${tbSupervision.reflectWay}
				</td>
				<td>
					${tbSupervision.createName}
				</td>
				<td>
					<fmt:formatDate value="${tbSupervision.lrDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${tbSupervision.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${tbSupervision.company.name}
				</td>
				<td>
					${tbSupervision.office.name}
				</td>
				<shiro:hasPermission name="accounts:tbSupervision:edit"><td>
    				<a href="${ctx}/accounts/tbSupervision/form?id=${tbSupervision.id}">修改</a>
					<a href="${ctx}/accounts/tbSupervision/delete?id=${tbSupervision.id}" onclick="return confirmx('确认要删除该接受监督情况吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>