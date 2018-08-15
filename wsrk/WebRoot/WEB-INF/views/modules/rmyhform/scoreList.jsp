<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>考核文件列表</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		
	
	$(function() {
			
	     
	        /*  var WshShell = new ActiveXObject("WScript.Shell");
	     	var AuthUrl = "http://baidu.com";
	     	var oRun = WshShell.Run("chrome "+AuthUrl,0,true); */


	         	$("ul li:eq(${flag-1})").attr("class","active");
	         	
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
		<li> <a  href="${ctx}/rmyhform/tbRmyhFile/scoreList?officeId=${officeId}&flag=1">未考核列表</a>
		<li> <a  href="${ctx}/rmyhform/tbRmyhFile/scoreList?officeId=${officeId}&flag=2">考核完成列表</a>
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
				<c:if test="${flag == 2}">
					<th>得分</th>
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
				
				<c:if test="${flag == 2}">
					<td><fmt:parseNumber value="${tbRmyhFile.allScore}" pattern="0" /></td>
							<c:if test="${tbRmyhFile.status == 3 || tbRmyhFile.status == 4 || tbRmyhFile.status == 7}">
								<td>审核中</td>
							</c:if>
							<c:if test="${tbRmyhFile.status == 5}">
								<td><span style="color: red;">审核通过</span></td>
							</c:if>
							<c:if test="${tbRmyhFile.status == 6}">
								<td>
									<span style="color: red;">审核未通过</span><span>&nbsp;&nbsp;<a href="#" style="color: red;" onclick='remarkView("${tbRmyhFile.remarks}")'>查看原因</a></span>
								</td>
							</c:if>
						
				</c:if>
				<shiro:hasPermission name="rmyhform:tbRmyhFile:edit"><td>
					<c:if test="${flag == 1}">
    					<a href="${ctx}/rmyhform/khformview/view?fromflag=10&id=${tbRmyhFile.tbRmyhKhformInfo.id}&fileId=${tbRmyhFile.id}&officeId=${tbRmyhFile.office.id}&flagId=${tbRmyhFile.flagId}">评分</a>
    					
					</c:if>
					<c:if test="${flag == 2}">
					<c:if test="${tbRmyhFile.status != 6}">
    					<a href="${ctx}/rmyhform/khformview/view?fromflag=9.3&id=${tbRmyhFile.tbRmyhKhformInfo.id}&fileId=${tbRmyhFile.id}&officeId=${tbRmyhFile.office.id}&flagId=${tbRmyhFile.flagId}">查看</a>
					</c:if>
						<c:if test="${tbRmyhFile.status == 6}">
							<a style="color: red;" href="${ctx}/rmyhform/khformview/view?fromflag=11&id=${tbRmyhFile.tbRmyhKhformInfo.id}&fileId=${tbRmyhFile.id}&officeId=${tbRmyhFile.office.id}&flagId=${tbRmyhFile.flagId}">重新打分</a>
						</c:if>
					</c:if>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
		<!-- 模态窗口 -->		
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