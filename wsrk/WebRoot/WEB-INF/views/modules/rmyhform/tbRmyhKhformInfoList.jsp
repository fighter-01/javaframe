<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>表单管理</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<script type="text/javascript">
		$(document).ready(function() {
			var tpl = $("#treeTableTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
			var data = ${fns:toJson(list)}, ids = [], rootIds = [];
			for (var i=0; i<data.length; i++){
				ids.push(data[i].id);
			}
			ids = ',' + ids.join(',') + ',';
			for (var i=0; i<data.length; i++){
				if (ids.indexOf(','+data[i].parentId+',') == -1){
					if ((','+rootIds.join(',')+',').indexOf(','+data[i].parentId+',') == -1){
						rootIds.push(data[i].parentId);
					}
				}
			}
			for (var i=0; i<rootIds.length; i++){
				addRow("#treeTableList", tpl, data, rootIds[i], true);
			}
			//展开的层级
			$("#treeTable").treeTable({expandLevel : 1	});
		});

		
		function addRow(list, tpl, data, pid, root){
			for (var i=0; i<data.length; i++){
				var row = data[i];
				if ((${fns:jsGetVal('row.parentId')}) == pid){
					$(list).append(Mustache.render(tpl, {
						dict: {
							type: getDictLabel(${fns:toJson(fns:getDictList('formtype'))}, row.type),
						blank123:0}, pid: (root?0:pid), row: row,iftype:function(){  
					        if(row.type=="4" || row.type=="5"){  
					            return false;  
					        }  
					        return true;  
					    }
					}));
					addRow(list, tpl, data, row.id);
				}
			}
		}
		
		

	</script>

	</style>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/rmyhform/tbRmyhKhformInfo/">表单列表</a></li>
		<shiro:hasPermission name="rmyhform:tbRmyhKhformInfo:edit"><li><a href="${ctx}/rmyhform/tbRmyhKhformInfo/form?columnType=0&flag=2">表单添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="tbRmyhKhformInfo" action="${ctx}/rmyhform/tbRmyhKhformInfo/" method="post" class="breadcrumb form-search">
		<ul class="ul-form">
			<li><label>列名：</label>
				<form:input path="name" htmlEscape="false" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="treeTable" class="table table-striped table-bordered table-condensed" style="table-layout:fixed">
		<thead>
			<tr>
				<th width="450px">列名</th>
				<th >表单列类型</th>
				<th >考核开始时间</th>
				<th >考核截止时间</th>
				<th >分值</th>
				<shiro:hasPermission name="rmyhform:tbRmyhKhformInfo:edit"><th width="170px" >操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody id="treeTableList"></tbody>
	</table>
	<script type="text/template" id="treeTableTpl">

		<tr id="{{row.id}}" pId="{{pid}}">
			<td title="{{row.name}}"  style="overflow:hidden;text-overflow:ellipsis;word-break:keep-all" nowrap>
				<a href="${ctx}/rmyhform/tbRmyhKhformInfo/form?id={{row.id}}&columnType={{row.type}}&flag=0">
					{{row.name}}	
				</a>
			</td>
			
			<td>
						{{dict.type}}
			</td>
			<td>
				{{row.khStartTime}}
			</td>
			<td>
				{{row.khEndTime}}
			</td>
			<td>
				{{row.allScore}}
			</td> 
			
			<shiro:hasPermission name="rmyhform:tbRmyhKhformInfo:edit"><td>
   				<a href="${ctx}/rmyhform/tbRmyhKhformInfo/form?id={{row.id}}&columnType={{row.type}}&flag=0">修改</a>
				<a href="${ctx}/rmyhform/tbRmyhKhformInfo/delete?id={{row.id}}" onclick="return confirmx('确认要删除该表单及所有子表单吗？', this.href)">删除</a>
				
				{{#iftype}}
				
					<a href="${ctx}/rmyhform/tbRmyhKhformInfo/form?parent.id={{row.id}}&columnType={{row.type}}&flag=1">添加下级表单</a> 
				{{/iftype}}
				
				</td></shiro:hasPermission>
		</tr>
	</script>
</body>
</html>