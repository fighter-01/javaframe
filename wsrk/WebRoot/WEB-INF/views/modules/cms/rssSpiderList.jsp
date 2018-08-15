<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>新闻列表</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		function page(n,s){
			if(n) $("#pageNo").val(n);
			if(s) $("#pageSize").val(s);
			$("#searchForm").attr("action","${ctx}/cms/rssSpider/list");
			$("#searchForm").submit();
	    	return false;
	    }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/cms/rssSpider/list">新闻列表</a></li>
		<shiro:hasPermission name="cms:rss:edit"><li><a href="${ctx}/cms/rssSpider/form">新闻添加</a></li></shiro:hasPermission>
	</ul>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead><tr><th class="sort-column login_name">RSS源</th><th class="sort-column name">标题</th><th>内容</th><th>链接</th><th>图片链接</th><th>发布时间</th><%--<th>角色</th> --%><shiro:hasPermission name="cms:rss:edit"><th>操作</th></shiro:hasPermission></tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="rssSpider">
			<tr>
				<td><a href="${ctx}/cms/rssSpider/form?id=${rssSpider.id}">${rssSpider.rss}</a></td>
				<td>${rssSpider.title}</td>
				<td>${rssSpider.rssAbstract}</td>
				<td>${rssSpider.url}</td>
				<td>${rssSpider.photo}</td>
				<td>${rssSpider.publiserTime}</td>
				<%--
				<td>${rssSpider.roleNames}</td> --%>
				<shiro:hasPermission name="cms:rss:edit"><td>
    				<a href="${ctx}/cms/rssSpider/form?id=${rssSpider.id}">修改</a>
					<a href="${ctx}/cms/rssSpider/delete?id=${rssSpider.id}" onclick="return confirmx('确认要删除该条记录吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>