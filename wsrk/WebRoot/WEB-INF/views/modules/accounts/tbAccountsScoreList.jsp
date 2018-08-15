<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>台账评分管理</title>
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
		<li class="active"><a href="#">台账评分列表</a></li>
		<shiro:hasPermission name="accounts:tbAccountsScore:edit"><li><a href="${ctx}/accounts/tbAccountsScore/form">台账评分添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="tbAccountsScore" action="${ctx}/accounts/tbAccountsScore/list" method="post" class="breadcrumb form-search">
		<ul class="ul-form">
		<input id="officeId" name="office.id"  value="${tbAccountsScore.office.id}" type="hidden"/>
			<li><label>年：</label>
				<input id="year" name="year" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${tbAccountsScore.year}" pattern="yyyy"/>"
					onclick="WdatePicker({dateFmt:'yyyy',isShowClear:true});"/>
			</li>
			<li><label>季度：</label>
				<form:select path="jidu" class="input-medium">
					<form:option value="" label="请选择.."/>
					<form:options items="${fns:getDictList('jidu')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<%-- <li><label>归属支行：</label>
				<sys:treeselect id="company" name="company.id" value="${tbAccountsScore.company.id}" labelName="company.name" labelValue="${tbAccountsScore.company.name}"
					title="部门" url="/sys/office/treeData?type=2" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
			</li> --%>
			<%-- <li><label>归属部门：</label>
				<sys:treeselect id="office" name="office.id" value="${tbAccountsScore.office.id}" labelName="office.name" labelValue="${tbAccountsScore.office.name}"
					title="部门" url="/sys/office/treeData?type=2" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
			</li> --%>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>归属部门或支行</th>
				<th>年</th>
				<th>季度</th>
				<th>得分</th>
				<th>评语</th>
				<th>评分时间</th>
				
			
				<shiro:hasPermission name="accounts:tbAccountsScore:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="tbAccountsScore">
			<tr>
				<td>
					${tbAccountsScore.office.name}
				</td>
				<td>
					<fmt:formatDate value="${tbAccountsScore.year}" pattern="yyyy年"/>
				</td>
				<td>
					${fns:getDictLabel(tbAccountsScore.jidu, 'jidu', '')}
				</td>
				<td>
					${tbAccountsScore.score}
				</td>
				<td>
					${tbAccountsScore.remarks}
				</td>
				<td>
					<fmt:formatDate value="${tbAccountsScore.updateDate}" pattern="yyyy-MM-dd"/>
				</td>
				
				
				<shiro:hasPermission name="accounts:tbAccountsScore:edit"><td>
    				<a href="${ctx}/accounts/tbAccountsScore/form?id=${tbAccountsScore.id}">修改</a>
					<a href="${ctx}/accounts/tbAccountsScore/delete?id=${tbAccountsScore.id}" onclick="return confirmx('确认要删除该台账评分吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>