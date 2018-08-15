<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>廉政教育谈话情况管理</title>
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
		<li class="active"><a href="${ctx}/accounts/tbEducation/list">廉政教育谈话情况列表</a></li>
		<shiro:hasPermission name="accounts:tbEducation:edit"><li><a href="${ctx}/accounts/tbEducation/form">廉政教育谈话情况添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="tbEducation" action="${ctx}/accounts/tbEducation/list" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>主谈人：</label>
				<form:input path="anchorman" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>谈话对象：</label>
				<form:input path="talkObject" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>谈话时间：</label>
				<input name="beginTalkTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${tbEducation.beginTalkTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endTalkTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${tbEducation.endTalkTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>谈话地点：</label>
				<form:input path="talkPlace" htmlEscape="false" maxlength="500" class="input-medium"/>
			</li>
			<li><label>录入时间：</label>
				<input name="beginLrDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${tbEducation.beginLrDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endLrDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${tbEducation.endLrDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>归属支行：</label>
				<sys:treeselect id="company" name="company.id" value="${tbEducation.company.id}" labelName="company.name" labelValue="${tbEducation.company.name}"
					title="部门" url="/sys/office/treeData?type=1" cssClass="input-small" allowClear="true" />
			</li>
			<li><label>归属部门：</label>
				<sys:treeselect id="office" name="office.id" value="${tbEducation.office.id}" labelName="office.name" labelValue="${tbEducation.office.name}"
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
				<th>主谈人</th>
				<th>谈话对象</th>
				<th>谈话时间</th>
				<th>谈话地点</th>
				<th>谈话原因</th>
				<th>提交者姓名</th>
				<th>录入时间</th>
				<th>更新时间</th>
				<th>归属支行</th>
				<th>归属部门</th>
				<shiro:hasPermission name="accounts:tbEducation:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="tbEducation">
			<tr>
				<td><a href="${ctx}/accounts/tbEducation/form?id=${tbEducation.id}">
					${tbEducation.anchorman}
				</a></td>
				<td>
					${tbEducation.talkObject}
				</td>
				<td>
					<fmt:formatDate value="${tbEducation.talkTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${tbEducation.talkPlace}
				</td>
				<td>
					${tbEducation.talkReason}
				</td>
				<td>
					${tbEducation.createName}
				</td>
				<td>
					<fmt:formatDate value="${tbEducation.lrDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${tbEducation.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${tbEducation.company.name}
				</td>
				<td>
					${tbEducation.office.name}
				</td>
				<shiro:hasPermission name="accounts:tbEducation:edit"><td>
    				<a href="${ctx}/accounts/tbEducation/form?id=${tbEducation.id}">修改</a>
					<a href="${ctx}/accounts/tbEducation/delete?id=${tbEducation.id}" onclick="return confirmx('确认要删除该廉政教育谈话情况吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>