<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>表单管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox") || element.is(":radio") || element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
		
		
		
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/rmyhform/tbRmyhKhformInfo/">表单列表</a></li>
		<li class="active"><a href="#">表单<shiro:hasPermission name="rmyhform:tbRmyhKhformInfo:edit">${not empty tbRmyhKhformInfo.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="rmyhform:tbRmyhKhformInfo:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="tbRmyhKhformInfo" action="${ctx}/rmyhform/tbRmyhKhformInfo/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		
		<sys:message content="${message}"/>		
		<div class="control-group" hidden="hidden">
			<label class="control-label">上级项名称:</label>
			<div class="controls">
				<sys:treeselect id="parent" name="parent.id" value="${tbRmyhKhformInfo.parent.id}" labelName="parent.name" labelValue="${tbRmyhKhformInfo.parent.name}"
					title="父级编号" url="/rmyhform/tbRmyhKhformInfo/treeData" extId="${tbRmyhKhformInfo.id}" cssClass="" allowClear="true"/>
			</div>
		</div> 
		
			<div class="control-group">
			<label class="control-label"></label>
			<div class="controls">
			<!-- 0为修改，1为添加下级节点连接 -->
				<c:if test="${flag == 0}">
			  		<label class="control-label" style="font-size: 20px;font-weight: bold;font-family: serif;">${ fns:getDictLabel (columnType,'formtype','' )}修改</label>
			  	</c:if>
			  	<c:if test="${flag == 1 || flag == 2}">
			  
				    <c:choose>
				  		
				  		<c:when test="${columnType == 4 }" >
				  		  <form:select  path="type" class="input-xlarge required"  onchange="changevalue(this);">
				  				<c:forEach items="${fns:getDictList('formtype')}" var="item"  begin="${columnType}" >  
									 <form:option value="${item.value}"  label="${item.label }"/>
								</c:forEach>
						  </form:select>
						    添加
				  		</c:when>
				  		<c:otherwise>
				  		    <form:hidden path="type"/>
				  			<label class="control-label" style="font-size: 20px;font-weight: bold;font-family: serif;">${ fns:getDictLabel (columnType,'formtype','' )}添加</label>
				  		</c:otherwise>
				   </c:choose>
				
				</c:if>
				
				
			</div>
		</div>
		 
		 <!-- 0为添加考核表名，1为添加项目名 -->
		<c:choose>
			<c:when test="${columnType == 0}">
			         <div class="control-group">
							<label class="control-label">考核表名：</label>
							<div class="controls">
								<form:input path="name" htmlEscape="false"  maxlength="65535" class="input-xlarge required"/>
								<span class="help-inline"><font color="red">*</font> </span>
							</div>
					  </div>
					  <div class="control-group">
							<label class="control-label">分值：</label>
							<div class="controls">
								<form:input path="allScore" htmlEscape="false" maxlength="100" class="input-xlarge required"/>
								<span class="help-inline"><font color="red">*</font> </span>
							</div>
					 </div>
					 <div class="control-group">
				   <label class="control-label">考核开始时间：</label>
						<div class="controls">
							<input name="khStartTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
								value="<fmt:formatDate value="${tbRmyhKhformInfo.khStartTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
						</div>
					  </div>
					 <div class="control-group">
							<label class="control-label">考核截止时间：</label>
							<div class="controls">
								<input name="khEndTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
									value="<fmt:formatDate value="${tbRmyhKhformInfo.khEndTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
									onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
							</div>
					</div>
			</c:when>
			<c:when test="${columnType == 1}">
				<div class="control-group">
					<label class="control-label">考核项目名称：</label>
					<div class="controls">
						<form:input path="name" htmlEscape="false"  maxlength="65535" class="input-xlarge required"/>
						<span class="help-inline"><font color="red">*</font> </span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">分值：</label>
					<div class="controls">
						<form:input path="allScore" htmlEscape="false" maxlength="100" class="input-xlarge required"/>
						<span class="help-inline"><font color="red">*</font> </span>
					</div>
				</div>
			</c:when>
			<c:when test="${columnType == 2}">
					<div class="control-group">
						<label class="control-label">考核内容名称：</label>
						<div class="controls">
							<form:input path="name" htmlEscape="false"  maxlength="65535" class="input-xlarge required"/>
							<span class="help-inline"><font color="red">*</font> </span>
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label">分值：</label>
						<div class="controls">
							<form:input path="allScore" htmlEscape="false" maxlength="100" class="input-xlarge required"/>
							<span class="help-inline"><font color="red">*</font> </span>
							
						</div>
					</div>
			</c:when>
			<c:when test="${columnType == 3}">
				<div class="control-group">
					<label class="control-label">考核标准名称：</label>
					<div class="controls">
						<form:input path="name" htmlEscape="false"  maxlength="65535" class="input-xlarge required"/>
						<span class="help-inline"><font color="red">*</font> </span>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label">扣分总值：</label>
					<div class="controls">
						<form:input path="allScore" htmlEscape="false" maxlength="100" class="input-xlarge required"/>
						<span class="help-inline"><font color="red">*</font> </span>
					</div>
				</div>
			</c:when>
			<c:when test="${columnType == 4}">
					<div class="control-group" >
						<label id="bs" class="control-label">查阅资料名称：</label>
						<div class="controls">
							<form:input path="name" htmlEscape="false"  maxlength="65535" class="input-xlarge required"/>
							<span class="help-inline"><font color="red">*</font> </span>
						</div>
					</div>
					
					<div class="control-group"   hidden="hidden" id="cs">
						<label class="control-label">分值：</label>
						<div class="controls">
							<form:input path="allScore" htmlEscape="false" maxlength="100" class="input-xlarge required"/>
							<span class="help-inline"><font color="red">*</font> </span>
						</div>
					</div>
			</c:when>
			<c:when test="${columnType == 5}">
					<div class="control-group" >
						<label id="bs" class="control-label">计分标准：</label>
						<div class="controls">
							<form:input path="name" htmlEscape="false"  maxlength="65535" class="input-xlarge required"/>
							<span class="help-inline"><font color="red">*</font> </span>
						</div>
					</div>
					
					<div class="control-group"   id="cs">
						<label class="control-label">扣分分值：</label>
						<div class="controls">
							<form:input path="allScore" htmlEscape="false" maxlength="100" class="input-xlarge required"/>
							<span class="help-inline"><font color="red">*</font> </span>
						</div>
					</div>
			</c:when>
		</c:choose>
		
		<%-- <div class="control-group">
			<label class="control-label">得分：</label>
			<div class="controls">
				<form:input path="score" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div> --%>
		<%-- <div class="control-group">
			<label class="control-label">扣分理由：</label>
			<div class="controls">
				<form:input path="kfReason" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div> --%>
	
		<form:input path="sort" htmlEscape="false" type="hidden" class="input-xlarge required"/>
			
	
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="rmyhform:tbRmyhKhformInfo:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
	
	<script type="text/javascript">
	
	function changevalue(obj){
		var val =$(obj).val();
		if(val == 5){
			document.getElementById('bs').innerHTML="计分标准：";
			$("#cs").show()
		}
		if(val == 4){
			document.getElementById('bs').innerHTML="查阅资料名称:";
			$("#cs").hide()
		}
		
	}
	</script>
</body>
</html>