<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>部门落实党风廉政建设责任制情况半年自查表管理</title>
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
			
			$("#allScore").text(getEndScore());
			$("#a1,#a2,#a3,#a4").blur(function(){
				
				var a1 = getInputValue("a1");
				var a2 = getInputValue("a2");
				var a3 = getInputValue("a3");	
				var a4 = getInputValue("a4");
				//计算后面的总得分
				$("#a").val(a1+a2+a3+a4);
				//计算总得分
				$("#allScore").text(getEndScore());
			});
			
			$("#a5,#a6,#a7,#a8,#a9").blur(function(){
				
				var a5 = getInputValue("a5");
				var a6 = getInputValue("a6");
				var a7 = getInputValue("a7");	
				var a8 = getInputValue("a8");
				var a9 = getInputValue("a9");
				$("#b").val(a5+a6+a7+a8+a9);
				$("#allScore").text(getEndScore());
			});
			
			$("#a10,#a11").blur(function(){
				
				var a10 = getInputValue("a10");
				var a11 = getInputValue("a11");
				$("#c").val(a10+a11);
				$("#allScore").text(getEndScore());
			});
			
			$("#a12,#a13,#a14").blur(function(){
				
				var a12 = getInputValue("a12");
				var a13 = getInputValue("a13");
				var a14 = getInputValue("a14");
				$("#d").val(a12+a13+a14);
				$("#allScore").text(getEndScore());
			});
			
			$("#a15").blur(function(){
				
				var a15 = getInputValue("a15");
				$("#e").val(a15);
				$("#allScore").text(getEndScore());
			});
			
			
		});
		
		//得到input值，并将空值转化为0
		function getInputValue(tag){
			
			 var inputval = $('#'+tag).val();
			 if(inputval == null || inputval =='' ){
				 inputval = 0;
				}else{
					inputval =  parseFloat(inputval); 
				}
			return inputval;
		}
		
		//计算得分总值
		function getEndScore(){
			var a = getInputValue("a");
			var b = getInputValue("b");
			var c = getInputValue("c");
			var d = getInputValue("d");
			var e = getInputValue("e");
			return a+b+c+d+e;
		}
		
		
		function changeStatus(id){
				var message = "你确定提交给部门负责人进行审核？";
			
			Confirm.show('提示',message, {
                '确定': {
                    'primary': true,
                    'callback': function() {
                    	$.ajax({  
    						type:'post',
    						url:'${ctx}/accounts/tbYear/updateStatus',
    						async:true,
    						data: {"id":id,"status":"2"},  
    						dataType:"text",
    						traditional: true,//可传递数组
    						success:function(data){
    							if(data==1){
    								alert("保存成功！！");
    								window.location.href="${ctx}/accounts/tbYear/list?flag=1";
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
		<li><a href="${ctx}/accounts/tbYear/list?flag=1">部门落实党风廉政建设责任制年度量化考评表列表</a></li>
		<li class="active"><a href="${ctx}/accounts/tbYear/form?id=${tbYear.id}">部门落实党风廉政建设责任制年度量化考评表<shiro:hasPermission name="accounts:tbYear:edit">${not empty tbYear.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="accounts:tbYear:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="tbYear" action="${ctx}/accounts/tbYear/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">归属支行：</label>
			<div class="controls" style="float:left;margin-left: 5px">
				<sys:treeselect id="company" name="company.id" value="${tbYear.company.id}" labelName="company.name" labelValue="${tbYear.company.name}"
					title="部门" url="/sys/office/treeData?type=1" cssClass="required" allowClear="true" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
			<div style="float:left;margin-right: 0px;">
			<label class="control-label">归属部门：</label>
			<div class="controls">
				<sys:treeselect id="office" name="office.id" value="${tbYear.office.id}" labelName="office.name" labelValue="${tbYear.office.name}"
					title="部门" url="/sys/office/treeData?type=2" cssClass="required" allowClear="true" notAllowSelectParent="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<c:if test="${tbYear.status == '1'}">
			<a href="#" onclick='changeStatus("${tbYear.id}")'  style="margin-left:-20px" class="btn btn-primary mb10 mr5 notification" data-note-style="primary" data-note-opacity="0.75">提&nbsp;交&nbsp审&nbsp核</a>
		</c:if>
		<c:if test="${tbYear.status == '5'}">
			<a href="#" onclick='changeStatus("${tbYear.id}")'  style="margin-left:-20px" class="btn btn-primary mb10 mr5 notification" data-note-style="primary" data-note-opacity="0.75">提&nbsp;交&nbsp审&nbsp核</a>
		</c:if>
		</div>
		
<table class="table table-bordered">
  <thead>
    <tr>
      <th  width="9%">考评项目</th>
      <th width="5%" colspan="2">分值</th>
      <th  width="15%">考评内容</th>
      <th width="15%" >考评标准</th>
      <th width="3%"> 扣分</th>
      <th width="3%">得分</th>
    </tr>
  </thead>
  <tbody id="tl">
	    <tr>
	      		<td rowspan="4">${tbYear.tbHalfyearTable.a1}</td>
	      	<td rowspan="4">${tbYear.tbHalfyearTable.a2}</td>
	      	<td width="2%">${tbYear.tbHalfyearTable.a3}</td>
	      	<td>${tbYear.tbHalfyearTable.a4}</td>
	      	<td>${tbYear.tbHalfyearTable.a5}</td>
	      	<td>
	      		<div class="controls"  style="	margin:0; padding: 0;">
				<form:input path="a1" htmlEscape="false" maxlength="5"   style="width:38px;" class="required digits" />
				<span class="help-inline"><font color="red">*</font> </span>
			   </div> 
			</td>
	      	<td rowspan="4">
	      		<div class="controls"  style="	margin:0; padding: 0;">
				<form:input path="a" htmlEscape="false" maxlength="5"   style="width:38px;"  readonly="true" class="required digits "/>
				<span class="help-inline"><font color="red">*</font> </span>
			   </div> 
	      	</td>
	    </tr>
	     <tr>
	     	<td>${tbYear.tbHalfyearTable.a6}</td>
	      	<td>${tbYear.tbHalfyearTable.a7}</td>
	      	<td >${tbYear.tbHalfyearTable.a8}</td>	      	<td><div class="controls"  style="	margin:0; padding: 0;">
				<form:input path="a2" htmlEscape="false" maxlength="5"   style="width:38px;" class="required digits"/>
				<span class="help-inline"><font color="red">*</font> </span>
			   </div> </td>
	    </tr>
	     <tr>
	      	<td>${tbYear.tbHalfyearTable.a9}</td>
	      	<td>${tbYear.tbHalfyearTable.a10}</td>
	      	<td >${tbYear.tbHalfyearTable.a11}</td>
	         <td><div class="controls"  style="	margin:0; padding: 0;">
				<form:input path="a3" htmlEscape="false" maxlength="5"   style="width:38px;" class="required digits"/>
				<span class="help-inline"><font color="red">*</font> </span>
			   </div>  </td>
	    </tr>
	    <tr>
		    <td>${tbYear.tbHalfyearTable.a12}</td>
	      	<td>${tbYear.tbHalfyearTable.a13}</td>
	      	<td >${tbYear.tbHalfyearTable.a14}</td>
	      	<td><div class="controls"  style="	margin:0; padding: 0;">
				<form:input path="a4" htmlEscape="false" maxlength="5"   style="width:38px;" class="required digits"/>
				<span class="help-inline"><font color="red">*</font> </span>
			   </div>  </td>
	    </tr>
	    
	     <tr>
	      	<td rowspan="5">${tbYear.tbHalfyearTable.a15}</td>
	      	<td rowspan="5">${tbYear.tbHalfyearTable.a16}</td>
	      	<td width="2%">${tbYear.tbHalfyearTable.a17}</td>
	      	<td>${tbYear.tbHalfyearTable.a18}</td>
	      	<td>${tbYear.tbHalfyearTable.a19}</td>    	<td> <div class="controls"  style="	margin:0; padding: 0;">
				<form:input path="a5" htmlEscape="false" maxlength="5"   style="width:38px;" class="required digits"/>
				<span class="help-inline"><font color="red">*</font> </span>
			   </div> </td>
	      	<td rowspan="5">
	      		<div class="controls"  style="	margin:0; padding: 0;">
				<form:input path="b" htmlEscape="false" maxlength="5"  readonly="true" style="width:38px;" class="required digits"/>
				<span class="help-inline"><font color="red">*</font> </span>
			   </div> 
	      	</td>
	    </tr>
	     <tr>
	      	<td width="2%">${tbYear.tbHalfyearTable.a20}</td>
	      	<td>${tbYear.tbHalfyearTable.a21}</td>
	      	<td>${tbYear.tbHalfyearTable.a22}</td>
	   	      	<td><div class="controls"  style="	margin:0; padding: 0;">
				<form:input path="a6" htmlEscape="false" maxlength="5"   style="width:38px;" class="required digits"/>
				<span class="help-inline"><font color="red">*</font> </span>
			   </div>  </td>
	    </tr>
	     <tr>
	      	  	<td width="2%">${tbYear.tbHalfyearTable.a23}</td>
	      	<td>${tbYear.tbHalfyearTable.a24}</td>
	      	<td>${tbYear.tbHalfyearTable.a25}</td>
	      	<td> <div class="controls"  style="	margin:0; padding: 0;">
				<form:input path="a7" htmlEscape="false" maxlength="5"   style="width:38px;" class="required digits"/>
				<span class="help-inline"><font color="red">*</font> </span>
			   </div> </td>
	    </tr>
	     <tr>
	      	<td width="2%">${tbYear.tbHalfyearTable.a26}</td>
	      	<td>${tbYear.tbHalfyearTable.a27}</td>
	      	<td>${tbYear.tbHalfyearTable.a28}</td>
	      	<td> <div class="controls"  style="	margin:0; padding: 0;">
				<form:input path="a8" htmlEscape="false" maxlength="5"   style="width:38px;" class="required digits"/>
				<span class="help-inline"><font color="red">*</font> </span>
			   </div> </td>
	    </tr>
	     <tr>
	        	<td width="2%">${tbYear.tbHalfyearTable.a29}</td>
	      	<td>${tbYear.tbHalfyearTable.a30}</td>
	      	<td>${tbYear.tbHalfyearTable.a31}</td>
	      	<td> <div class="controls"  style="	margin:0; padding: 0;">
				<form:input path="a9" htmlEscape="false" maxlength="5"   style="width:38px;" class="required digits"/>
				<span class="help-inline"><font color="red">*</font> </span>
			   </div> </td>
	    </tr>
	    
	       <tr>
	      	<td rowspan="2">${tbYear.tbHalfyearTable.a32}</td>
	      	<td rowspan="2">${tbYear.tbHalfyearTable.a33}</td>
	      	<td width="2%">${tbYear.tbHalfyearTable.a34}</td>
	      	<td>${tbYear.tbHalfyearTable.a35}</td>
	      	<td>${tbYear.tbHalfyearTable.a36}</td>
      	<td> <div class="controls"  style="	margin:0; padding: 0;">
				<form:input path="a10" htmlEscape="false" maxlength="5"   style="width:38px;" class="required digits" />
				<span class="help-inline"><font color="red">*</font> </span>
			   </div> </td>
	      	<td rowspan="2">
	      		<div class="controls"  style="	margin:0; padding: 0;">
				<form:input path="c" htmlEscape="false" maxlength="5"   readonly="true" style="width:38px;" class="required digits"/>
				<span class="help-inline"><font color="red">*</font> </span>
			   </div> 
	      	</td>
	    </tr>
	     <tr>
	      	<td width="2%">${tbYear.tbHalfyearTable.a37}</td>
	      	<td>${tbYear.tbHalfyearTable.a38}</td>
	      	<td>${tbYear.tbHalfyearTable.a39}</td>
	      	<td><div class="controls"  style="	margin:0; padding: 0;">
				<form:input path="a11" htmlEscape="false" maxlength="5"  style="width:38px;" class="required digits"/>
				<span class="help-inline"><font color="red">*</font> </span>
			   </div>  </td>
	    </tr>
	    
	      <tr>
	      	<td rowspan="3">${tbYear.tbHalfyearTable.a40}</td>
	      	<td rowspan="3">${tbYear.tbHalfyearTable.a41}</td>
	      	<td width="2%">${tbYear.tbHalfyearTable.a42}</td>
	      	<td>${tbYear.tbHalfyearTable.a43}</td>
	      	<td>${tbYear.tbHalfyearTable.a44}</td>
	      	<td><div class="controls"  style="	margin:0; padding: 0;">
				<form:input path="a12" htmlEscape="false" maxlength="5"   style="width:38px;" class="required digits"/>
				<span class="help-inline"><font color="red">*</font> </span>
			   </div>  </td>
	      	<td rowspan="3">
	      		<div class="controls"  style="	margin:0; padding: 0;">
				<form:input path="d" htmlEscape="false" maxlength="5"  readonly="true" style="width:38px;" class="required digits"/>
				<span class="help-inline"><font color="red">*</font> </span>
			   </div> 
	      	</td>
	    </tr>
	     <tr>
	      		<td width="2%">${tbYear.tbHalfyearTable.a45}</td>
	      	<td>${tbYear.tbHalfyearTable.a46}</td>
	      	<td>${tbYear.tbHalfyearTable.a47}</td>
	       	<td><div class="controls"  style="	margin:0; padding: 0;">
				<form:input path="a13" htmlEscape="false" maxlength="5"   style="width:38px;" class="required digits"/>
				<span class="help-inline"><font color="red">*</font> </span>
			   </div>  </td>
	    </tr>
	     <tr>
	      	<td width="2%">${tbYear.tbHalfyearTable.a48}</td>
	      	<td>${tbYear.tbHalfyearTable.a49}</td>
	      	<td>${tbYear.tbHalfyearTable.a50}</td>
	          	<td> <div class="controls"  style="	margin:0; padding: 0;">
				<form:input path="a14" htmlEscape="false" maxlength="5"   style="width:38px;" class="required digits"/>
				<span class="help-inline"><font color="red">*</font> </span>
			   </div> </td>
	    </tr>
	    
	     <tr>
	      	<td>${tbYear.tbHalfyearTable.a51}</td>
	      	<td >${tbYear.tbHalfyearTable.a52}</td>
	      	<td width="2%">${tbYear.tbHalfyearTable.a53}</td>
	      	<td>${tbYear.tbHalfyearTable.a54}</td>
	      	<td>${tbYear.tbHalfyearTable.a55}</td>
	        	<td><div class="controls"  style="	margin:0; padding: 0;">
				<form:input path="a15" htmlEscape="false" maxlength="5"   style="width:38px;" class="required digits"/>
				<span class="help-inline"><font color="red">*</font> </span>
			   </div>  </td>
	      	<td >
	      		<div class="controls"  style="	margin:0; padding: 0;">
				<form:input path="e" htmlEscape="false" maxlength="5"  readonly="true" style="width:38px;" class="required digits"/>
				<span class="help-inline"><font color="red">*</font> </span>
			   </div> 
	      	</td>
	    </tr>
	    
	      <tr>
	      	<td colspan="7">部门落实党风廉政建设责任制量化考评得分：<span id="allScore">10</span></td>
	    </tr>
	     <tr>
	      	<td colspan="7">部门负责人签字：<span style="text-align: right;float:right;margin-right:140px">2017年</span></td>
	    </tr>
	     <tr>
	      	<td colspan="7">分管行领导签字：<span style="text-align: right;float:right;margin-right:140px">2017年</span></td>
	    </tr>
  </tbody>
</table> 
		<div class="form-actions">
			<shiro:hasPermission name="accounts:tbYear:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
	<script type="text/javascript" src="${ctx}/static/solrManager.js"></script>
</body>
</html>