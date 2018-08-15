<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>参加机关党风廉政建设活动情况管理</title>
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
		<li class="active"><a href="${ctx}/accounts/tbOfficeDflz/list">参加机关党风廉政建设活动情况列表</a></li>
		<shiro:hasPermission name="accounts:tbOfficeDflz:edit"><li><a href="${ctx}/accounts/tbOfficeDflz/form">参加机关党风廉政建设活动情况添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="tbOfficeDflz" action="${ctx}/accounts/tbOfficeDflz/list" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>活动名称：</label>
				<form:input path="activityName" htmlEscape="false" maxlength="2000" class="input-medium"/>
			</li>
			<li><label>主办单位：</label>
				<form:input path="organizer" htmlEscape="false" maxlength="2000" class="input-medium"/>
			</li>
			<li><label>活动时间：</label>
				<input name="activityTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${tbOfficeDflz.activityTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>录入时间：</label>
				<input name="beginLrDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${tbOfficeDflz.beginLrDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endLrDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${tbOfficeDflz.endLrDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>归属支行：</label><sys:treeselect id="company" name="company.id" value="${tbOfficeDflz.company.id}" labelName="company.name" labelValue="${tbOfficeDflz.company.name}" 
				title="公司" url="/sys/office/treeData?type=1" cssClass="input-small" allowClear="true"/>
			</li>
			<li><label>归属部门：</label>
				<sys:treeselect id="office" name="office.id" value="${tbOfficeDflz.office.id}" labelName="office.name" labelValue="${tbOfficeDflz.office.name}" 
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
				<th>主办单位</th>
				<th>活动时间</th>
				<th>部门参加人数</th>
				<!-- <th>未参加人员</th> -->
				<th>提交者姓名</th>
				<th>录入时间</th>
				<!-- <th>更新时间</th> -->
				
				<th>归属支行</th>
				<th>归属部门</th>
				<shiro:hasPermission name="accounts:tbOfficeDflz:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="tbOfficeDflz">
			<tr>
				<td><a href="${ctx}/accounts/tbOfficeDflz/form?id=${tbOfficeDflz.id}">
					${tbOfficeDflz.activityName}
				</a></td>
				<td>
					${tbOfficeDflz.organizer}
				</td>
				<td>
					<fmt:formatDate value="${tbOfficeDflz.activityTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${tbOfficeDflz.personNum}
				</td>
			<%-- 	<td>
					${tbOfficeDflz.noCome}
				</td> --%>
				<td>
					${tbOfficeDflz.createName}
				</td>
				<td>
					<fmt:formatDate value="${tbOfficeDflz.lrDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<%-- <td>
					<fmt:formatDate value="${tbOfficeDflz.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td> --%>
				
				
				<td>
					${tbOfficeDflz.company.name}
				</td>
				<td>
					${tbOfficeDflz.office.name}
				</td>
				<shiro:hasPermission name="accounts:tbOfficeDflz:edit"><td>
    				<a href="${ctx}/accounts/tbOfficeDflz/form?id=${tbOfficeDflz.id}">修改</a>
					<a href="${ctx}/accounts/tbOfficeDflz/delete?id=${tbOfficeDflz.id}" onclick="return confirmx('确认要删除该参加机关党风廉政建设活动情况吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>