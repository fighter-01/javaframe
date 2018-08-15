<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>考核文件列表</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		
	
	$(function() {
	         
	         	$("ul li:eq(${flag-5})").attr("class","active");
		});
		
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
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

	<ul class="nav nav-tabs">
		<li> <a  href="${ctx}/rmyhform/tbRmyhFile/scoreList?officeId=${officeId}&flag=5">未审核列表</a></li>
		<li> <a  href="${ctx}/rmyhform/tbRmyhFile/scoreList?officeId=${officeId}&flag=6">审核完成列表</a></li>
	</ul>
	<br/>
	<br/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>考核表名1</th>
				<th>提交单位</th>
				<th>考核开始时间</th>
				<th>考核截止时间</th>
				<th>总分</th>
				<c:if test="${flag == 6}">
					<th>审核状态</th>
				</c:if>
					<th>得分</th>
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
					${tbRmyhFile.office.name}
					
				</td>
				<td>
					<fmt:formatDate value="${tbRmyhFile.tbRmyhKhformInfo.khStartTime}" pattern="yyyy-MM-dd"/>
					
				</td>
				<td>
					<fmt:formatDate value="${tbRmyhFile.tbRmyhKhformInfo.khEndTime}" pattern="yyyy-MM-dd"/>
					
				</td>
				<td>
					${tbRmyhFile.tbRmyhKhformInfo.allScore}
				</td>
				
				<c:if test="${flag == 6}">
							<c:if test="${tbRmyhFile.status == 4}">
								<td>审核中</td>
							</c:if>
							<c:if test="${tbRmyhFile.status == 5}">
								<td>审核通过</td>
							</c:if>
							<c:if test="${tbRmyhFile.status == 7}">
								<td>
									<span style="color: red;">审核未通过</span><span>&nbsp;&nbsp;<a href="#" style="color: red;" onclick='remarkView("${tbRmyhFile.remarks}")'>查看原因</a></span>
								</td>
							</c:if>
						
				</c:if>
				<td><fmt:parseNumber value="${tbRmyhFile.allScore}" pattern="0" /></td>
				<shiro:hasPermission name="rmyhform:tbRmyhFile:edit"><td>
					<c:if test="${flag == 5}">
						<a href="${ctx}/rmyhform/khformview/view?fromflag=25&id=${tbRmyhFile.tbRmyhKhformInfo.id}&fileId=${tbRmyhFile.id}&officeId=${tbRmyhFile.office.id}&flagId=${tbRmyhFile.flagId}">审核</a>
					</c:if>
					<c:if test="${flag == 6}">
    					<a href="${ctx}/rmyhform/khformview/view?fromflag=26&id=${tbRmyhFile.tbRmyhKhformInfo.id}&fileId=${tbRmyhFile.id}&officeId=${tbRmyhFile.office.id}&flagId=${tbRmyhFile.flagId}">查看</a>
						
					</c:if>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>