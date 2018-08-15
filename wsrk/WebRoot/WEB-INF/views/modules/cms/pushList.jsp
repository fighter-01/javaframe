<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用户管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#btnExport").click(function(){
				top.$.jBox.confirm("确认要导出用户数据吗？","系统提示",function(v,h,f){
					if(v=="ok"){
						$("#searchForm").attr("action","${ctx}/cms/push/export");
						$("#searchForm").submit();
					}
				},{buttonsFocus:1});
				top.$('.jbox-body .jbox-icon').css('top','55px');
			});
			$("#btnImport").click(function(){
				$.jBox($("#importBox").html(), {title:"导入数据", buttons:{"关闭":true}, 
					bottomText:"导入文件不能超过5M，仅允许导入“xls”或“xlsx”格式文件！"});
			});
		});
		function page(n,s){
			if(n) $("#pageNo").val(n);
			if(s) $("#pageSize").val(s);
			$("#searchForm").attr("action","${ctx}/cms/push/list");
			$("#searchForm").submit();
	    	return false;
	    }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/cms/push/list">推送列表</a></li>
		<shiro:hasPermission name="cms:push:edit"><li><a href="${ctx}/cms/push/form">推送添加</a></li></shiro:hasPermission>
	</ul>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead><tr><th class="sort-column login_name">内容</th><th class="sort-column name">目标平台</th><th>设备标签</th><th>推送别名</th><th>推送设备号</th><th>推送组名</th><th>创建时间</th><th>推送状态</th><%--<th>角色</th> --%><shiro:hasPermission name="cms:push:edit"><th>操作</th></shiro:hasPermission></tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="push">
			<tr>
				<td><a href="${ctx}/cms/push/form?id=${push.id}">${push.content}</a></td>
				<td>${push.platform}</td>
				<td>${push.aliases}</td>
				<td>${push.tagValues}</td>
				<td>${push.registrationIds}</td>
				<td>${push.segments}</td>
				<td>${push.create_date}</td>
				<td>${push.status}</td>
				<%--
				<td>${push.roleNames}</td> --%>
				<shiro:hasPermission name="cms:push:edit"><td>
    				<a href="${ctx}/cms/push/form?id=${push.id}">修改</a>
					<a href="${ctx}/cms/push/delete?id=${push.id}" onclick="return confirmx('确认要删除该条记录吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>