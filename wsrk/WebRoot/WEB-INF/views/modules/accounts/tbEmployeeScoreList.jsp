<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>部门人员基本情况表管理</title>
	<meta name="decorator" content="default"/>
	<object id="WebBrowser" classid=CLSID:8856F961-340A-11D0-A96B-00C04FD705A2 height="0" width="0"> 
</object> 
	
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
		
		 function doPrint(){
	    	 
			 document.all.WebBrowser.ExecWB(7,1) ;
		     }
	</script>
	
	 <style media="print">
        .Noprint
        {
            display: none;
        }
        .PageNext
        {
            page-break-after: always;
        }
 </style>
</head>
<body>
	
	<h2 id="title" class="text-center" style="margin-top:40px;">一、部门人员基本情况</h2>
	</br>
			<input class="Noprint" id="btnSubmit" onclick='doPrint()' style="float:right;margin-right:80px;margin-bottom: 10px" class="btn btn-primary" type="submit" value="&nbsp;打&nbsp;&nbsp;印&nbsp;"/>
	
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>姓名</th>
				<th>性别</th>
				<th>年龄</th>
				<th>职务</th>
				<th>政治面貌</th>
				<th>文化程度</th>
				<th>调入时间</th>
				
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list}" var="tbEmployee">
			<tr>
				<td>
				${tbEmployee.name}
				</td>
				<td>
					${fns:getDictLabel(tbEmployee.sex, 'sex', '')}
					
				</td>
				<td>
					${tbEmployee.age}
				</td>
				<td>
					${fns:getDictLabel(tbEmployee.zw, 'zw', '')}
				</td>
				<td>
					${fns:getDictLabel(tbEmployee.zzmm, 'zzmm', '')}
				</td>
				<td>
					${fns:getDictLabel(tbEmployee.whcd, 'whcd', '')}
				</td>
				<td>
					<fmt:formatDate value="${tbEmployee.drsj}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
			
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
</body>
</html>