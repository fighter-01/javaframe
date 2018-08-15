<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>台账评分管理</title>
	<meta name="decorator" content="default"/>
	<script src="${ctxStatic}/myplugins/layer/layer.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/myplugins/layer/skin/layer.css">
	
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
		
		function employeeView(){
			
					window.open("${ctx}/accounts/tbEmployee/scoreEmployeeList?office.id="+$("#officeId").val());   
		}
		
		 function test () {
			 	var officeId = $("#officeId").val();
			 	if(officeId == null || officeId ==''){
			 		$("#myalert").show();
					return false;
			 	};
			 	var year = $("#year").val();
			 	var jidu = $("#jidu").val()
		        var url = "${ctx}/accounts/tbAccountsScore/layer?office.id="+officeId+"&year="+year+"&jidu="+jidu;
		       layer.open({
		                type: 2,
		                title: '评分',
		                maxmin: true,
		            	area : [$(window).width()*0.55+'px' , $(window).height()*0.6+'px'],
		                btn: ['保存' , '取消'],
		                content: [url,'no'],
		                yes: function(index,layero){
		                    var iframeWin = window[layero.find('iframe')[0]['name']];
		                    //查找到弹出页面的formSubmit方法
		                    iframeWin.formSubmit();
		                },
			            cancel:function (index) {
			                layer.close(index);
			            },
			            success:function(layero, index){
			            	//	alert("成功");
			            	//layer.close(index);
			            }
		            });
		        }
		    
		
	</script>
</head>
<body>
		<div class="alert alert-danger hide" id="myalert">
	    <button type="button" class="close" data-dismiss="alert">&times;</button>
	  	请选择评分部门！！！
	</div>
	<form:form id="searchForm"  modelAttribute="tbAccountsScore" action="${ctx}/accounts/tbAccountsScore/socre" method="post" class="breadcrumb form-search">
		<br>
		<ul class="ul-form">
			<li><label>年：</label>
				<input id="year" name="year" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${tbAccountsScore.year}" pattern="yyyy"/>"
					onclick="WdatePicker({dateFmt:'yyyy',isShowClear:false});"/>
			</li>
			<li><label>季度：</label>
				<form:select path="jidu" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('jidu')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<input id="officeId" name="officeId"  value="${tbAccountsScore.officeId}" type="hidden" />
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li  style="margin-left: 200px"><button type="button" style="background-color:red;color:blank" class="btn" onclick='test()'>评分</button></li>
		
			<li class="clearfix"></li>
		</ul>
		<br>
	</form:form>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>台账类型</th>
				<th>提交时间</th>
				<th>提交人</th>
				<shiro:hasPermission name="accounts:tbAccountsScore:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list}" var="tbAccountsScore">
			<tr>
				<td><a href="${ctx}/accounts/tbAccountsScore/form?id=${tbAccountsScore.id}">
					${tbAccountsScore.accountType}
				</a></td>
				<td>
					<fmt:formatDate value="${tbAccountsScore.submitTime}" pattern="yyyy-MM-dd"/>
				</td>
				<td>
					${tbAccountsScore.submitPerson}
				</td>
				<td>
					<c:choose>
    						<c:when test="${tbAccountsScore.type == 1}">
	    						<a href="#" onclick="employeeView()">
	    							查看
	    						</a>
    						</c:when>
    						<c:when test="${tbAccountsScore.type == 2}">
	    						<a href="${ctx}/accounts/tbPlan/scoreView?id=${tbAccountsScore.id}" target="view_window">
	    							查看
	    						</a>
    						</c:when>
    						<c:when test="${tbAccountsScore.type == 3}">
	    						<a href="${ctx}/accounts/tbOfficeDflz/scoreView?id=${tbAccountsScore.id}" target="view_window">
	    							查看
	    						</a>
    						</c:when>
    						<c:when test="${tbAccountsScore.type == 4}">
								<a href="${ctx}/accounts/tbDeptDflz/scoreView?id=${tbAccountsScore.id}" target="view_window">	    							查看
	    						</a>
    						</c:when>
    						<c:when test="${tbAccountsScore.type == 5}">
								<a href="${ctx}/accounts/tbAffairsOpen/scoreView?id=${tbAccountsScore.id}" target="view_window">	    							查看
	    						</a>
    						</c:when>
    						<c:when test="${tbAccountsScore.type == 6}">
								<a href="${ctx}/accounts/tbEducation/scoreView?id=${tbAccountsScore.id}" target="view_window">	    							查看
	    						</a>
    						</c:when>
    						<c:when test="${tbAccountsScore.type == 7}">
								<a href="${ctx}/accounts/tbSupervision/scoreView?id=${tbAccountsScore.id}" target="view_window">		    							查看
	    						</a>
    						</c:when>
    						<c:when test="${tbAccountsScore.type == 8}">
								<a href="${ctx}/accounts/tbHalfyear/view?id=${tbAccountsScore.id}" target="view_window">	    							查看
	    						</a>
    						</c:when>
    						<c:when test="${tbAccountsScore.type == 9}">
								<a href="${ctx}/accounts/tbYear/view?id=${tbAccountsScore.id}" target="view_window">	    							查看
	    						</a>
    						</c:when>
    						<c:when test="${tbAccountsScore.type == 10}">
									<a href="${ctx}/accounts/tbWorkInspect/view?id=${tbAccountsScore.id}" target="view_window">		    							查看
	    						</a>
    						</c:when>
    					</c:choose>
				</td>
				
			</tr>
		</c:forEach>
		</tbody>
	</table>

</body>
</html>