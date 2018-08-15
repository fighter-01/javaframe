<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>部门人员基本情况表管理</title>
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
		<li class="active"><a href="${ctx}/accounts/tbEmployee/list">部门人员基本情况</a></li>
		<shiro:hasPermission name="accounts:tbEmployee:edit"><li><a href="${ctx}/accounts/tbEmployee/form">部门人员添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="tbEmployee" action="${ctx}/accounts/tbEmployee/list" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			
			<li><label>姓名：</label>
				<form:input path="name" htmlEscape="false" maxlength="1000" class="input-medium"/>
			</li>
			<li><label>归属支行：</label><sys:treeselect id="company" name="company.id" value="${tbEmployee.company.id}" labelName="company.name" labelValue="${tbEmployee.company.name}" 
				title="支行" url="/sys/office/treeData?type=1" cssClass="input-small" allowClear="true"/>
			</li>
			<li><label>归属部门：</label>
				<sys:treeselect id="office" name="office.id" value="${tbEmployee.office.id}" labelName="office.name" labelValue="${tbEmployee.office.name}" 
				title="部门" url="/sys/office/treeData?type=2" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
			</li>
			<li><label>性别：</label>
				<form:select path="sex" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('sex')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>职务：</label>
				<form:select path="zw" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('zw')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>政治面貌：</label>
				<form:select path="zzmm" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('zzmm')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>文化程度：</label>
				<form:select path="whcd" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('whcd')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>调入时间：</label>
				<input name="drsj" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${tbEmployee.drsj}" pattern="yyyy-MM-dd HH:mm:ss"/>"
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
				<th>姓名</th>
				<th>性别</th>
				<th>归属支行</th>
				<th>归属部门</th>
				<th>年龄</th>
				<th>职务</th>
				<th>政治面貌</th>
				<th>文化程度</th>
				<th>调入时间</th>
				<th>更新时间</th>
				<th>提交者姓名</th>
			<!-- 	<th>备注信息</th> -->
				<shiro:hasPermission name="accounts:tbEmployee:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="tbEmployee">
			<tr>
				<td><a href="${ctx}/accounts/tbEmployee/form?id=${tbEmployee.id}">
				${tbEmployee.name}
				</a></td>
				<td>
					${fns:getDictLabel(tbEmployee.sex, 'sex', '')}
					
				</td>
				<td>${tbEmployee.company.name}</td>
				<td>${tbEmployee.office.name}</td>
				<td>
					${tbEmployee.age}
				</td>
				<td>
					${fns:getDictLabel(tbEmployee.zw, 'zw', '')}
				</td>
				<td>
					${fns:getDictLabel(tbEmployee.zzmm, 'zzmm', '')}
				</td>
				<td>
					${fns:getDictLabel(tbEmployee.whcd, 'whcd', '')}
				</td>
				<td>
					<fmt:formatDate value="${tbEmployee.drsj}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${tbEmployee.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${tbEmployee.creatName}
				</td>
				<%-- <td>
					${tbEmployee.remarks}
				</td> --%>
				<shiro:hasPermission name="accounts:tbEmployee:edit"><td>
    				<a href="${ctx}/accounts/tbEmployee/form?id=${tbEmployee.id}">修改</a>
					<a href="${ctx}/accounts/tbEmployee/delete?id=${tbEmployee.id}" onclick="return confirmx('确认要删除该部门人员基本情况表吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>