<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>半年自查表管理</title>
	<meta name="decorator" content="default"/>
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
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		
		<li class="active"><a href="${ctx}/accounts/tbHalfyearTable/form?id=${tbHalfyearTable.id}">半年自查表<shiro:hasPermission name="accounts:tbHalfyearTable:edit">${not empty tbHalfyearTable.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="accounts:tbHalfyearTable:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="tbHalfyearTable" action="${ctx}/accounts/tbHalfyearTable/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
          <table class="table table-bordered">
  <thead>
    <tr>
      <th  width="9%">自查项目</th>
      <th width="5%" colspan="2">分值</th>
      <th  width="15%">自查内容</th>
      <th width="15%" >自查标准</th>
      <th width="3%"> 扣分</th>
      <th width="3%">得分</th>
    </tr>
  </thead>
  <tbody id="tl">
	    <tr>
	      	<td rowspan="4">
					<form:textarea path="a1" htmlEscape="false" rows="4" class="input-xlarge required"/>
					<span class="help-inline"><font color="red">*</font> </span>
	      	</td>
	      	<td rowspan="4">
	      		<form:input path="a2" htmlEscape="false" maxlength="4" class="required"  style="width: 34px;"/>
				<span class="help-inline"><font color="red">*</font> </span>
	      	</td>
	      	<td width="2%">
	      		<form:input path="a3" htmlEscape="false" maxlength="4" class="required"  style="width: 34px;"/>
				<span class="help-inline"><font color="red">*</font> </span>
	      	</td>
	      	<td>
	      		<form:textarea path="a4" htmlEscape="false" rows="4" class="input-xlarge required"/>
					<span class="help-inline"><font color="red">*</font> </span>
			</td>
	      	<td>
	      		<form:textarea path="a5" htmlEscape="false" rows="4" class="input-xlarge required"/>
					<span class="help-inline"><font color="red">*</font> </span>
	
	      		</td>
	      	<td>
	      		
			</td>
	      	<td rowspan="4">
	      		
	      	</td>
	    </tr>
	     <tr>
	      	<td>
	      		<form:input path="a6" htmlEscape="false" maxlength="4" class="required"  style="width: 34px;"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</td>
	      	<td>
	      		<form:textarea path="a7" htmlEscape="false" rows="4" class="input-xlarge required"/>
					<span class="help-inline"><font color="red">*</font> </span>
			</td>
	      	<td >
	      		<form:textarea path="a8" htmlEscape="false" rows="4" class="input-xlarge required"/>
					<span class="help-inline"><font color="red">*</font> </span>
			</td>
	      	<td> </td>
	    </tr>
	     <tr>
	      	<td>
	      		<form:input path="a9" htmlEscape="false" maxlength="4" class="required"  style="width: 34px;"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</td>
	      	<td>
	      		<form:textarea path="a10" htmlEscape="false" rows="4" class="input-xlarge required"/>
					<span class="help-inline"><font color="red">*</font> </span>
			</td>
	      	<td ><form:textarea path="a11" htmlEscape="false" rows="4" class="input-xlarge required"/>
					<span class="help-inline"><font color="red">*</font>
			</td>
	      	<td>  </td>
	    </tr>
	    <tr>
		     <td>
		     	<form:input path="a12" htmlEscape="false" maxlength="4" class="required"  style="width: 34px;"/>
				<span class="help-inline"><font color="red">*</font> </span></td>
	      	<td><form:textarea path="a13" htmlEscape="false" rows="4" class="input-xlarge required"/>
					<span class="help-inline"><font color="red">*</font>
			</td>
	      	<td ><form:textarea path="a14" htmlEscape="false" rows="4" class="input-xlarge required"/>
					<span class="help-inline"><font color="red">*</font>
			</td>
	      	<td>  </td>
	    </tr>
	    
	     <tr>
	      	<td rowspan="5">
	      		<form:textarea path="a15" htmlEscape="false" rows="4" class="input-xlarge required"/>
					<span class="help-inline"><font color="red">*</font>
			</td>
	      	<td rowspan="5">
	      		<form:input path="a16" htmlEscape="false" maxlength="4" class="required"  style="width: 34px;"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</td>
	      	<td width="2%">
	      		<form:input path="a17" htmlEscape="false" maxlength="4" class="required"  style="width: 34px;"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</td>
	      	<td><form:textarea path="a18" htmlEscape="false" rows="4" class="input-xlarge required"/>
					<span class="help-inline"><font color="red">*</font>
		</td>
	      	<td>
	      	<form:textarea path="a19" htmlEscape="false" rows="4" class="input-xlarge required"/>
					<span class="help-inline"><font color="red">*</font>
			</td>
	      	<td>  </td>
	      	<td rowspan="5">
	      		
	      	</td>
	    </tr>
	     <tr>
	      	<td width="2%">
	      		<form:input path="a20" htmlEscape="false" maxlength="4" class="required"  style="width: 34px;"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</td>
	      	<td>
	      		<form:textarea path="a21" htmlEscape="false" rows="4" class="input-xlarge required"/>
					<span class="help-inline"><font color="red">*</font>
			</td>
	      	<td>
	      		<form:textarea path="a22" htmlEscape="false" rows="4" class="input-xlarge required"/>
					<span class="help-inline"><font color="red">*</font>
			</td>
	      	<td>  </td>
	    </tr>
	     <tr>
	      	<td width="2%">
	      		<form:input path="a23" htmlEscape="false" maxlength="4" class="required"  style="width: 34px;"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</td>
	      	<td>
	      		<form:textarea path="a24" htmlEscape="false" rows="4" class="input-xlarge required"/>
					<span class="help-inline"><font color="red">*</font>
			</td>
	      	<td>
	      	<form:textarea path="a25" htmlEscape="false" rows="4" class="input-xlarge required"/>
					<span class="help-inline"><font color="red">*</font>
			</td>
	      	<td> </td>
	    </tr>
	     <tr>
	      	<td width="2%">
	      		<form:input path="a26" htmlEscape="false" maxlength="4" class="required"  style="width: 34px;"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</td>
	      	<td>
	      	<form:textarea path="a27" htmlEscape="false" rows="4" class="input-xlarge required"/>
					<span class="help-inline"><font color="red">*</font>
			</td>
	      	<td>
	      		<form:textarea path="a28" htmlEscape="false" rows="4" class="input-xlarge required"/>
					<span class="help-inline"><font color="red">*</font>
		</td>
	      	<td>  </td>
	    </tr>
	     <tr>
	      	<td width="2%">
	      	<form:input path="a29" htmlEscape="false" maxlength="4" class="required"  style="width: 34px;"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</td>
	      	<td>
	      		<form:textarea path="a30" htmlEscape="false" rows="4" class="input-xlarge required"/>
					<span class="help-inline"><font color="red">*</font>
			</td>
	      	<td>
	      		<form:textarea path="a31" htmlEscape="false" rows="4" class="input-xlarge required"/>
	      		<span class="help-inline"><font color="red">*</font>
			</td>
	      	<td>  </td>
	    </tr>
	    
	       <tr>
	      	<td rowspan="2">
	      			<form:textarea path="a32" htmlEscape="false" rows="4" class="input-xlarge required"/>
	      		<span class="help-inline"><font color="red">*</font>
			</td>
	      	<td rowspan="2">
	      		<form:input path="a33" htmlEscape="false" maxlength="4" class="required"  style="width: 34px;"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</td>
	      	<td width="2%">
	      		<form:input path="a34" htmlEscape="false" maxlength="4" class="required"  style="width: 34px;"/>
				<span class="help-inline"><font color="red">*</font> </span>
	      	<td>
	      		<form:textarea path="a35" htmlEscape="false" rows="4" class="input-xlarge required"/>
	      		<span class="help-inline"><font color="red">*</font>
			</td>
	      	<td>
	      		<form:textarea path="a36" htmlEscape="false" rows="4" class="input-xlarge required"/>
	      		<span class="help-inline"><font color="red">*</font>
			</td>
	      	<td>  </td>
	      	<td rowspan="2">
	      		
	      	</td>
	    </tr>
	     <tr>
	      	<td width="2%"><form:input path="a37" htmlEscape="false" maxlength="4" class="required"  style="width: 34px;"/>
				<span class="help-inline"><font color="red">*</font> </span></td>
	      	<td>
	      	<form:textarea path="a38" htmlEscape="false" rows="4" class="input-xlarge required"/>
	      		<span class="help-inline"><font color="red">*</font>
			</td>
	      	<td>
	      		<form:textarea path="a39" htmlEscape="false" rows="4" class="input-xlarge required"/>
	      		<span class="help-inline"><font color="red">*</font>
	      	</td>
	      	<td>  </td>
	    </tr>
	    
	      <tr>
	      	<td rowspan="3">
	      	<form:textarea path="a40" htmlEscape="false" rows="4" class="input-xlarge required"/>
	      		<span class="help-inline"><font color="red">*</font>
	     </td>
	      	<td rowspan="3">
	      	<form:input path="a41" htmlEscape="false" maxlength="4" class="required"  style="width: 34px;"/>
				<span class="help-inline"><font color="red">*</font> </span>
	      </td>
	      	<td width="2%">
	      		<form:input path="a42" htmlEscape="false" maxlength="4" class="required"  style="width: 34px;"/>
				<span class="help-inline"><font color="red">*</font> </span>
	     </td>
	      	<td>
	      	<form:textarea path="a43" htmlEscape="false" rows="4" class="input-xlarge required"/>
	      		<span class="help-inline"><font color="red">*</font>
	     </td>
	      	<td>
	      	<form:textarea path="a44" htmlEscape="false" rows="4" class="input-xlarge required"/>
	      		<span class="help-inline"><font color="red">*</font>
	    </td>
	      	<td><  </td>
	      	<td rowspan="3">
	      	
	      	</td>
	    </tr>
	     <tr>
	      	<td width="2%">	
	      		<form:input path="a45" htmlEscape="false" maxlength="4" class="required"  style="width: 34px;"/>
				<span class="help-inline"><font color="red">*</font> </span>
		 </td>
	      	<td><form:textarea path="a46" htmlEscape="false" rows="4" class="input-xlarge required"/>
	      		<span class="help-inline"><font color="red">*</font>
	 		</td>
	      	<td>
	      	<form:textarea path="a47" htmlEscape="false" rows="4" class="input-xlarge required"/>
	      		<span class="help-inline"><font color="red">*</font>
	 		</td>
	      	<td>  </td>
	    </tr>
	     <tr>
	      	<td width="2%">		
	      		<form:input path="a48" htmlEscape="false" maxlength="4" class="required"  style="width: 34px;"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</td>
	      	<td>
	      		<form:textarea path="a49" htmlEscape="false" rows="4" class="input-xlarge required"/>
	      		<span class="help-inline"><font color="red">*</font>
	 	</td>
	      	<td>
	      		<form:textarea path="a50" htmlEscape="false" rows="4" class="input-xlarge required"/>
	      		<span class="help-inline"><font color="red">*</font>
	 	</td>
	      	<td>  </td>
	    </tr>
	    
	     <tr>
	      	<td>
	      		<form:textarea path="a51" htmlEscape="false" rows="4" class="input-xlarge required"/>
	      		<span class="help-inline"><font color="red">*</font>
		 </td>
	      	<td >
	      	<form:input path="a52" htmlEscape="false" maxlength="4" class="required"  style="width: 34px;"/>
				<span class="help-inline"><font color="red">*</font> </span>
		</td>
	      	<td width="2%">
	      	<form:input path="a53" htmlEscape="false" maxlength="4" class="required"  style="width: 34px;"/>
				<span class="help-inline"><font color="red">*</font> </span>
		</td>
	      	<td>
	      	<form:textarea path="a54" htmlEscape="false" rows="4" class="input-xlarge required"/>
	      		<span class="help-inline"><font color="red">*</font>
	      	</td>
	      	<td><form:textarea path="a55" htmlEscape="false" rows="4" class="input-xlarge required"/>
	      		<span class="help-inline"><font color="red">*</font>
	      		</td>
	      	<td>  </td>
	      	<td >
	      		
	      	</td>
	    </tr>
	    
	      <tr>
	      	<td colspan="7">
	      	部门落实党风廉政建设责任制自查得分：</td>
	    </tr>
	     <tr>
	      	<td colspan="7">部门负责人签字：<span style="text-align: right;float:right;margin-right:140px"></span></td>
	    </tr>
  </tbody>
</table> 
		<div class="form-actions">
			<shiro:hasPermission name="accounts:tbHalfyearTable:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			
		</div>
	</form:form>
</body>
</html>