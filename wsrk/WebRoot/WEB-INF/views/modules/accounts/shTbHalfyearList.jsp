<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>部门落实党风廉政建设责任制情况半年自查表管理</title>
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
		<li class="active"><a href="${ctx}/accounts/tbHalfyear/list?flag=2">半年自查表列表</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="tbHalfyear" action="${ctx}/accounts/tbHalfyear/list?flag=2" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>签字日期：</label>
				<input name="beginSignTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${tbHalfyear.beginSignTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endSignTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${tbHalfyear.endSignTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>审核状态：</label>
				 <form:select path="status" class="input-medium">
					<form:option value="" label="请选择..."/>
					<form:option value="2" label="未审核"/>
					<form:option value="3" label="审核完成"/>
				</form:select> 
			</li>
			<li><label>提交者姓名：</label>
				<form:input path="createName" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>归属支行：</label>
				<sys:treeselect id="company" name="company.id" value="${tbHalfyear.company.id}" labelName="company.name" labelValue="${tbHalfyear.company.name}"
					title="部门" url="/sys/office/treeData?type=1" cssClass="input-small" allowClear="true"/>
			</li>
			<li><label>归属部门：</label>
				<sys:treeselect id="office" name="office.id" value="${tbHalfyear.office.id}" labelName="office.name" labelValue="${tbHalfyear.office.name}"
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
				
				<th>归属支行</th>
				<th>归属部门</th>
				<th>提交者姓名</th>
				<th>更新时间</th>
				<th>审核状态</th>
				<th>签字日期</th>
				<shiro:hasPermission name="accounts:tbHalfyear:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="tbHalfyear">
			<tr>
				<%-- <td><a href="${ctx}/accounts/tbHalfyear/form?id=${tbHalfyear.id}">
					<fmt:formatDate value="${tbHalfyear.signTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</a></td> --%>
				<td>
					${tbHalfyear.company.name}
				</td>
				<td>
					${tbHalfyear.office.name}
				</td>
				<td>
					${tbHalfyear.createName}
				</td>
				<td>
					<fmt:formatDate value="${tbHalfyear.updateDate}" pattern="yyyy-MM-dd HH:mm"/>
				</td>
				
				<td >
					<c:choose>
					    <c:when test="${tbHalfyear.status == '2'}">
					    	<span style="color: red;">待审核 </span>
					    </c:when>
					    <c:otherwise>
					         审核完成
					    </c:otherwise>
					</c:choose>
					
				</td>
				<td>
					<c:choose>
					    <c:when test="${tbHalfyear.signTime == null || tbHalfyear.signTime == ''}">
					    	<span style="color: red;">未签字 </span>
					    </c:when>
					    <c:otherwise>
					         <fmt:formatDate value="${tbHalfyear.signTime}" pattern="yyyy-MM-dd HH:mm"/>
					    </c:otherwise>
					</c:choose>
					
				</td>
				<shiro:hasPermission name="accounts:tbHalfyear:edit"><td>
				
					<c:choose>
					    <c:when test="${tbHalfyear.status == '2'}">
					    	<a href="${ctx}/accounts/tbHalfyear/shview?id=${tbHalfyear.id}" >审核</a>
					    </c:when>
					    <c:otherwise>
					       <a href="${ctx}/accounts/tbHalfyear/view?id=${tbHalfyear.id}" target="_blank">查看</a>
					    </c:otherwise>
					</c:choose>
				
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>