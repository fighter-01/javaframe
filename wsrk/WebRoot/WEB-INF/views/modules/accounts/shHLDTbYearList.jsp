<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>部门落实党风廉政建设责任制年度量化考评表管理</title>
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
		<li class="active"><a href="${ctx}/accounts/tbYear/list?flag=3">年度量化考评表列表</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="tbYear" action="${ctx}/accounts/tbYear/list?flag=3" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>归属支行：</label>
				<sys:treeselect id="company" name="company.id" value="${tbYear.company.id}" labelName="company.name" labelValue="${tbYear.company.name}"
					title="部门" url="/sys/office/treeData?type=1" cssClass="input-small" allowClear="true" />
			</li>
			<li><label>归属部门：</label>
				<sys:treeselect id="office" name="office.id" value="${tbYear.office.id}" labelName="office.name" labelValue="${tbYear.office.name}"
					title="部门" url="/sys/office/treeData?type=2" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
			</li>
			<li><label>审核状态：</label>
				<form:select path="status" class="input-medium">
					<form:option value="" label="请选择..."/>
					<form:options items="${fns:getDictList('tz_year')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<%-- <li><label>部门负责人签字日期：</label>
				<input name="beginDeptSignTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${tbYear.beginDeptSignTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endDeptSignTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${tbYear.endDeptSignTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li> --%>
			<%-- <li><label>分管行领导签字时间：</label>
				<input name="beginHldSignTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${tbYear.beginHldSignTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endHldSignTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${tbYear.endHldSignTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li> --%>
			
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
				<th>部门负责人签字日期</th>
				<th>分管行领导签字时间</th>
				<th>审核状态</th>
				<th>更新时间</th>
				<shiro:hasPermission name="accounts:tbYear:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="tbYear">
			<tr>
				<td>
					${tbYear.company.name}
				</td>
				<td>
					${tbYear.office.name}
				</td>
				<td>
					<fmt:formatDate value="${tbYear.deptSignTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${tbYear.hldSignTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
				<c:choose>
					     <c:when test="${tbYear.status == '3'}">
					    	<span style="color: red;">待审核</span>
					    </c:when>
					    <c:otherwise>
					   	 ${fns:getDictLabel(tbYear.status, 'tz_year', '')}
					    </c:otherwise>
					</c:choose>
				</td>
				<td>
				
					<fmt:formatDate value="${tbYear.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="accounts:tbYear:edit"><td>
				
				<c:choose>
					    <c:when test="${tbYear.status == '3'}">
					    	<a href="${ctx}/accounts/tbYear/shview?id=${tbYear.id}" >审核</a>
					    </c:when>
					    <c:otherwise>
					       <a href="${ctx}/accounts/tbYear/view?id=${tbYear.id}" target="_blank">查看</a>
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