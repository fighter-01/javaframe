<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>考核文件列表</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		
	$(function() {
			
			
	         
	         	$("ul li:eq(${file_status-1})").attr("class","active");
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
	<style type="text/css">
		.table th, .table td { 
			text-align: center;
			vertical-align: middle!important;
			}
	</style>
		
</head>
<body>
<!-- file_status 1为未审核    2：审核通过 3：审核未通过-->
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/rmyhform/tbRmyhFile/shlist?file_status=1">未审核</a></li>
		<li><a href="${ctx}/rmyhform/tbRmyhFile/shlist?file_status=2">审核完成</a></li>
		<li><a href="${ctx}/rmyhform/tbRmyhFile/shlist?file_status=3">评分结果</a></li>
		<%-- <li><a href="${ctx}/rmyhform/tbRmyhFile/shlist?file_status=3">审核未通过</a>
		<li><a href="${ctx}/rmyhform/tbRmyhFile/shlist?file_status=4">考核结果</a> --%>
	</ul>
	<br/>
	<br/>
	<%-- <form:form id="searchForm" modelAttribute="tbRmyhFile" action="${ctx}/rmyhform/tbRmyhFile/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>考核表名：</label>
				<form:input path="tbRmyhKhformInfo.name" htmlEscape="false" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
		
	</form:form> --%>
	
	
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>考核表名</th>
				<th>考核开始时间</th>
				<th>考核截止时间</th>
				<th>归属部门</th>
				<th>总分</th>
				<c:if test="${file_status == 3}">
					<th>得分</th>
				</c:if>
				<c:if test="${file_status == 2}">
    					<th>审核状态</th>	
    			</c:if>
				
				<shiro:hasPermission name="rmyhform:tbRmyhFile:edit"><th width="20%">操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="tbRmyhFile">
			<tr>
				<td>
					${tbRmyhFile.tbRmyhKhformInfo.name}
					
				</td>
				<td>
					<fmt:formatDate value="${tbRmyhFile.tbRmyhKhformInfo.khStartTime}" pattern="yyyy-MM-dd"/>
					
				</td>
				<td>
					<fmt:formatDate value="${tbRmyhFile.tbRmyhKhformInfo.khEndTime}" pattern="yyyy-MM-dd"/>
					
				</td>
				<tb><td>${tbRmyhFile.office.name}</td> </tb>
				<td>
					${tbRmyhFile.tbRmyhKhformInfo.allScore}
				</td>
				<c:if test="${file_status == 3}">
					<td><fmt:parseNumber value="${tbRmyhFile.allScore}" pattern="0" /></td>
				</c:if>
						<c:choose>
							<c:when test="${tbRmyhFile.status == 1}">
    							<td>未审核</td>
    						</c:when>
    						<c:when test="${tbRmyhFile.status == 5}">
    							<td>评分完成</td>
    						</c:when>
    						<c:when test="${tbRmyhFile.fileUlr == 2}">
    							<td>审核中</td>
    						</c:when>
    						<c:when test="${tbRmyhFile.fileUlr == 11}">
    							<td>审核通过</td>
    						</c:when>
    						<c:when test="${tbRmyhFile.fileUlr == 12}">
    							<td><span style="color: red;">审核未通过</span><span>&nbsp;&nbsp;<a href="#" style="color: red;" onclick='remarkView("${tbRmyhFile.remarks}")'>查看原因</a></span></td>
    						</c:when>
    					</c:choose>	
						
				
				<shiro:hasPermission name="rmyhform:tbRmyhFile:edit"><td>
    				
    					<c:choose>
    						<c:when  test="${tbRmyhFile.status == 5}">	
    								<a href="${ctx}/rmyhform/khformview/view?fromflag=9.2&id=${tbRmyhFile.tbRmyhKhformInfo.id}&fileId=${tbRmyhFile.id}&flagId=${tbRmyhFile.flagId}&officename=${tbRmyhFile.office.name}">考核结果查看</a>
    					    </c:when>	
    						<c:when test="${tbRmyhFile.fileUlr == 1}">
    							<a href="${ctx}/rmyhform/khformview/view?fromflag=6&id=${tbRmyhFile.tbRmyhKhformInfo.id}&fileId=${tbRmyhFile.id}&flagId=${tbRmyhFile.flagId}">审核</a>
    						</c:when>
    						<c:when test="${tbRmyhFile.fileUlr == 2}">
    						
    								<a href="${ctx}/rmyhform/khformview/view?fromflag=7&id=${tbRmyhFile.tbRmyhKhformInfo.id}&fileId=${tbRmyhFile.id}&flagId=${tbRmyhFile.flagId}&officename=${tbRmyhFile.office.name}">考核资料查看</a>
    						</c:when>	
    						<c:when test="${tbRmyhFile.fileUlr == 11}">
    						
    								<a href="${ctx}/rmyhform/khformview/view?fromflag=7&id=${tbRmyhFile.tbRmyhKhformInfo.id}&fileId=${tbRmyhFile.id}&flagId=${tbRmyhFile.flagId}">考核资料查看</a>
    						</c:when>	
    					
    						<c:when test="${tbRmyhFile.fileUlr == 12}">
    							<a style="color: red;" href="${ctx}/rmyhform/khformview/view?fromflag=6&id=${tbRmyhFile.tbRmyhKhformInfo.id}&fileId=${tbRmyhFile.id}&flagId=${tbRmyhFile.flagId}">重新审核</a>
    						</c:when>	
    					</c:choose>
    				
					<%-- <a href="${ctx}/rmyhform/tbRmyhFile/delete?id=${tbRmyhFile.id}" onclick="return confirmx('确认要删除该考核文件吗？', this.href)">删除</a> --%>
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
				<button type="button" class="btn btn-default"  data-dismiss="modal">
					确定
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</body>
</html>