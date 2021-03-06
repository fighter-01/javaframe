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
		
		function  remarkView(remarks){
			$('#reason').html(remarks);
			$('#myModal1').modal('show');
			
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/accounts/tbYear/list?flag=1">部门落实党风廉政建设责任制年度量化考评表列表</a></li>
		<shiro:hasPermission name="accounts:tbYear:edit"><li><a href="${ctx}/accounts/tbYear/form">部门落实党风廉政建设责任制年度量化考评表添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="tbYear" action="${ctx}/accounts/tbYear/list?flag=1" method="post" class="breadcrumb form-search">
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
					    <c:when test="${tbYear.status == '5'}">
					    	<span style="color: red;">审核未通过</span>
					    	&nbsp;&nbsp;<a href="#" style="color: red;" onclick='remarkView("${tbYear.remarks}")'>查看原因</a>
					    </c:when>
					    <c:when test="${tbYear.status == '6'}">
					    部门领导审核中
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
				<!-- 未提交审核或者提交被退回后可以进行的操作 -->
					<c:if test="${tbYear.status == '1' || tbYear.status == '5' }">
						<a href="${ctx}/accounts/tbYear/form?id=${tbYear.id}" ><span style="color: red;">提交审核</span></a>
						<a href="${ctx}/accounts/tbYear/form?id=${tbYear.id}">修改</a>
						<a href="${ctx}/accounts/tbYear/delete?id=${tbYear.id}" onclick="return confirmx('确认要删除该部门落实党风廉政建设责任制情况半年自查表吗？', this.href)">删除</a>
					</c:if>
					<!-- 提交后或者审核完后可以进行的操作 -->
					<c:if test="${tbYear.status == '2' || tbYear.status == '3' || tbYear.status == '4' || tbYear.status == '6' }">
						<a href="${ctx}/accounts/tbYear/view?id=${tbYear.id}" target="_blank" >查看</a>
					</c:if>
						</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
	
		<!-- 模态窗口 -->		
<div class="modal fade" id="myModal1" style="width:500px;display: none;" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
				</button>
				<h4 class="modal-title" id="myModalLabel">
					退回原因
				</h4>
			</div>
			<div id="reason" class="modal-body" >
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">
					确定
				</button>
				
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</body>
</html>