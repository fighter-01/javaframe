<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>工作检查记录</title>
	<meta name="decorator" content="default"/>
	<script src="${ctxStatic}/confirm/js/confirm.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		})
		function changeStatus(id){
				var message = "你确定提交给部门负责人进行审核？";
			
			Confirm.show('提示',message, {
                '确定': {
                    'primary': true,
                    'callback': function() {
                    	$.ajax({  
    						type:'post',
    						url:'${ctx}/accounts/tbWorkInspect/updateStatus',
    						async:true,
    						data: {"id":id,"status":"2"},  
    						dataType:"text",
    						traditional: true,//可传递数组
    						success:function(data){
    							if(data==1){
    								alert("保存成功！！");
    								window.location.href="${ctx}/accounts/tbWorkInspect/list?flag=1";
    							}else{
    								alert("提交失败!请联系管理员！！");
    							}
    						},
    						error: function(XMLHttpRequest, textStatus, errorThrown) {
    							
    							alert("提交失败!请联系管理员！！");
    				        }
    						
    					});
                    }
                }
            });
			
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/accounts/tbWorkInspect/list?flag=1">部门落实党风廉政建设责任制情况半年自查表列表</a></li>
		<li class="active"><a href="${ctx}/accounts/tbWorkInspect/form?id=${tbWorkInspect.id}">部门落实党风廉政建设责任制情况半年自查表<shiro:hasPermission name="accounts:tbWorkInspect:edit">${not empty tbWorkInspect.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="accounts:tbWorkInspect:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="tbWorkInspect" action="${ctx}/accounts/tbWorkInspect/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>										   
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">归属支行：</label>
			<div class="controls" style="float:left;margin-left: 5px">
				<sys:treeselect id="company" name="company.id" value="${tbWorkInspect.company.id}" labelName="company.name" labelValue="${tbWorkInspect.company.name}"
					title="部门" url="/sys/office/treeData?type=1" cssClass="required" allowClear="true" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
			<div style="float:left;margin-right: 0px;">
			<label class="control-label">归属部门：</label>
			<div class="controls">
				<sys:treeselect id="office" name="office.id" value="${tbWorkInspect.office.id}" labelName="office.name" labelValue="${tbWorkInspect.office.name}"
					title="部门" url="/sys/office/treeData?type=2" cssClass="required" allowClear="true" notAllowSelectParent="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<c:if test="${tbWorkInspect.status == '1'}">
			<a href="#" onclick='changeStatus("${tbWorkInspect.id}")'  style="margin-left:-20px" class="btn btn-primary mb10 mr5 notification" data-note-style="primary" data-note-opacity="0.75">提&nbsp;交&nbsp审&nbsp核</a>
		</c:if>
		<c:if test="${tbWorkInspect.status == '5'}">
			<a href="#" onclick='changeStatus("${tbWorkInspect.id}")'  style="margin-left:-20px" class="btn btn-primary mb10 mr5 notification" data-note-style="primary" data-note-opacity="0.75">提&nbsp;交&nbsp审&nbsp核</a>
		</c:if>
		</div>
		
<table class="table table-bordered">
  
  <tbody id="tl">
		    <tr>
		      <th  width="25%" style="text-align: center;">分管领导</th>
		      <th width="25%">
			      <div class="controls"  style="margin:0; padding: 0;">
					<form:input path="fgld" htmlEscape="false" maxlength="40"   style="width:150px;" class="required input-xlarge" />
					<span class="help-inline"><font color="red">*</font> </span>
				   </div>
			   </th>
			   <th width="25%" style="text-align: center;" >检查时间</td>
		      <th  width="10%">
		      	<div>
					<input name="inspectTime" type="text" readonly="readonly" maxlength="20" class="required input-medium Wdate "
						value="<fmt:formatDate value="${tbWorkInspect.inspectTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
						
				</div>
		      </th>
		    </tr>
	    
	   
	    
	     <tr>
	      	<td>对部门党风廉政建设工作的总体评价</td>
	      	<td colspan="3">
		      	<div class="control-group">
				<div class="controls">
					<form:textarea path="evaluate" htmlEscape="false" rows="10" maxlength="1500" class="required input-xxlarge "/>
					<span class="help-inline"><font color="red">*</font> </span>
				</div>
			</div>
		</td>
	      	
	    </tr>
	     <tr>
	      	<td>部门党风廉政建设存在的问题及要求</td>
	      	<td colspan="3">
	      			<div class="control-group">
			<div class="controls">
				<form:textarea path="problem" htmlEscape="false"  rows="10" maxlength="1500" class="required input-xxlarge "/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
	      	</td>
	      	
	    </tr>
	    
	     <tr>
	   		  <td >分管行领导签字：</td>
	   		  <td ></td>
	      		<td>部门负责人签字：</td>
	      		<td ></td>
	    </tr>
	     
  </tbody>
</table> 
		<div class="form-actions">
			<shiro:hasPermission name="accounts:tbWorkInspect:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
	<script type="text/javascript" src="${ctx}/static/solrManager.js"></script>
</body>
</html>