<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>RSS源列表</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		function page(n,s){
			if(n) $("#pageNo").val(n);
			if(s) $("#pageSize").val(s);
			$("#searchForm").attr("action","${ctx}/cms/rssSource/list");
			$("#searchForm").submit();
	    	return false;
	    }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/cms/rssSource/list">RSS源列表</a></li>
		<shiro:hasPermission name="cms:rss:edit"><li><a href="${ctx}/cms/rssSource/form">添加源</a></li></shiro:hasPermission>
	</ul>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead><tr><th class="sort-column name">源名称</th><th>源网址</th><th>对应解析方法</th><th>时间间隔</th><%--<th>角色</th> --%><shiro:hasPermission name="cms:rss:edit"><th>操作</th></shiro:hasPermission></tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="rssSource">
			<tr>
				<td><a href="${ctx}/cms/rssSource/form?id=${rssSource.id}">${rssSource.rssName}</a></td>
				<td>${rssSource.rssUrl}</td>
				<td>${rssSource.rssParser}</td>
				<td>${rssSource.refTime}</td>
				<%--
				<td>${rssSource.roleNames}</td> --%>
				<shiro:hasPermission name="cms:rss:edit"><td>
    				<a href="${ctx}/cms/rssSource/form?id=${rssSource.id}">修改</a>
					<a href="${ctx}/cms/rssSource/delete?id=${rssSource.id}" onclick="return confirmx('确认要删除该条记录吗？', this.href)">删除</a>
					<a href="${ctx}/cms/rssSpider/getNews?id=${rssSource.id}&rssUrl=${rssSource.rssUrl}">爬取新闻</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>