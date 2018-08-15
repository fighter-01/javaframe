<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>考核文件列表</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		
	
	$(function() {
	         
	         	$("ul li:eq(${flag-3})").attr("class","active");
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

	<ul class="nav nav-tabs">
		<li> <a  href="${ctx}/rmyhform/tbRmyhFile/scoreList?officeId=${officeId}&flag=3">评分未审核列表</a></li>
		<li> <a  href="${ctx}/rmyhform/tbRmyhFile/scoreList?officeId=${officeId}&flag=4">评分审核完成列表</a></li>
	</ul>
	<br/>
	<br/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>考核表名</th>
				<th>提交单位</th>
				<th>考核开始时间</th>
				<th>考核截止时间</th>
				<th>总分</th>
				<c:if test="${flag == 4}">
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
				
				<c:if test="${flag == 4}">
							<c:if test="${tbRmyhFile.status == 4 }">
								<td>审核中</td>
							</c:if>
							<c:if test="${tbRmyhFile.status == 5}">
								<td>审核通过</td>
							</c:if>
							<c:if test="${tbRmyhFile.status == 6}">
								<td>
										<span style="color: red;">退回</span><span>&nbsp;&nbsp;<a href="#" style="color: red;" onclick='remarkView("${tbRmyhFile.remarks}")'>查看原因</a></span>
								</td>
							</c:if>
							<c:if test="${tbRmyhFile.status == 7}">
								<td>
									<span style="color: red;">审核未通过</span><span>&nbsp;&nbsp;<a href="#" style="color: red;" onclick='remarkView("${tbRmyhFile.remarks}")'>查看原因</a></span>
								</td>
							</c:if>
						
				</c:if>
				<td><fmt:parseNumber value="${tbRmyhFile.allScore}" pattern="0" /></td>
				<shiro:hasPermission name="rmyhform:tbRmyhFile:edit"><td>
					<c:if test="${flag == 3}">
						<a href="${ctx}/rmyhform/khformview/view?fromflag=20&id=${tbRmyhFile.tbRmyhKhformInfo.id}&fileId=${tbRmyhFile.id}&officeId=${tbRmyhFile.office.id}&flagId=${tbRmyhFile.flagId}">审核</a>
					</c:if>
					<c:if test="${flag == 4}">
						<c:if test="${tbRmyhFile.status != 7}">
	    					<a href="${ctx}/rmyhform/khformview/view?fromflag=21&id=${tbRmyhFile.tbRmyhKhformInfo.id}&fileId=${tbRmyhFile.id}&officeId=${tbRmyhFile.office.id}&flagId=${tbRmyhFile.flagId}">查看</a>
						</c:if>	
						<c:if test="${tbRmyhFile.status == 7}">
						<a style="color: red;" href="${ctx}/rmyhform/khformview/view?fromflag=20&id=${tbRmyhFile.tbRmyhKhformInfo.id}&fileId=${tbRmyhFile.id}&officeId=${tbRmyhFile.office.id}&flagId=${tbRmyhFile.flagId}">重新审核</a>
							</c:if>
						</c:if>
						<c:if test="${fns:getUser().id == '1'}">
							<a  href="${ctx}/rmyhform/tbRmyhFile/delete?&id=${tbRmyhFile.id}&officeId=${tbRmyhFile.office.id}&&flagId=${tbRmyhFile.flagId}">删除</a>
						</c:if>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
	<div class="modal fade" id="myModal1" style="width:500px;display:none;" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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