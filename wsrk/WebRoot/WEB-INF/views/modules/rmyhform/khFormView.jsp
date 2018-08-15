<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<html>
<head>
	<title>考核表预览及下发</title>
	<meta name="decorator" content="default"/>
	
	<script src="${ctxStatic}/ckfinder/ckfinder.js" type="text/javascript"></script>
	<script src="${ctxStatic}/confirm/js/confirm.js" type="text/javascript"></script>
		<script type="text/javascript">
		
		function clickform(id){
			
			window.location.href="${ctx}/rmyhform/khformview/view?id="+id+"&fromflag=0";
	
				
	     }

		
		// 确认对话框
		function confirmx(mess,id,office,closed){
			top.$.jBox.confirm(mess,'系统提示',function(v,h,f){
				if(v=='ok'){
					
					$.ajax({  
						type:'post',
						url:'${ctx}/rmyhform/khformview/update',
						async:true,
						data: {"id":id,"officeIds":office},  
						traditional: true,//可传递数组
						success:function(data){
							if(data == 1){
								alert("下发失败，考核表内容不能为空！！");
							}else if(data == 2){
								alert("考核表下发成功！");
							}else{
								alert("表名为:'"+data+"'的表已下发，不能重复下发！！");
							}
							
						
							
						window.location.href="${ctx}/rmyhform/khformview/view?&fromflag=0";	
						
						},
						error: function(XMLHttpRequest, textStatus, errorThrown) {
				          
							alert("考核表下发失败!请联系管理员！！");
				        }
						
						
					});
				}
			},{buttonsFocus:1, closed:function(){
				if (typeof closed == 'function') {
					closed();
				}
			}});
			top.$('.jbox-body .jbox-icon').css('top','55px');
			return false;
		}
		
		function sendkh(id){
			
			
			
			 var office = document.getElementById("companyId").value; 
				if(office==''){
					$("#myalert").show();
					return false;
				}
			
				confirmx("你确定要给选中的单位下发考核表吗？",id,office,"#");
			
		}
		
		
		function changeStatus(fileId,fileUlr){
			
			var message="";
			if(fileUlr == 1){
				message = "资料上报后不可修改，你确定要上报考核资料吗？";
			}else if(fileUlr == 11 ){
				
				message = "考核表将提交给纪检部门进行考核评分，你确定通过审核吗？";
			}else if(fileUlr == 2 ){
				
				message = "考核表将提交给上级部门进行审核，你确定通过审核吗？";
			}
			//confirmxSB(fileId,fileUlr,message,"#")
		 	Confirm.show('提示',message, {
                '确定': {
                    'primary': false,
                    'callback': function() {
                    	$.ajax({  
    						type:'post',
    						url:'${ctx}/rmyhform/tbRmyhFile/save',
    						async:true,
    						data: {"id":fileId,"fileUlr":fileUlr},  
    						dataType:"text",
    						traditional: true,//可传递数组
    						success:function(data){
    							if(fileUlr == 1){
    								alert("上报成功！！");
    								window.location.href="${ctx}/rmyhform/tbRmyhFile/list?status=1";
    							}else if( fileUlr == 2 ){
    								window.location.href="${ctx}/rmyhform/tbRmyhFile/shlist?file_status=1";
    							}else if( fileUlr == 11 ){
    								
    								window.location.href="${ctx}/rmyhform/tbRmyhFile/shlist2?file_status=2";
    							}
    					
    						},
    						error: function(XMLHttpRequest, textStatus, errorThrown) {
    							if(fileUlr == 1 ){
    								alert("上报失败!请联系管理员！！");
    							}
    							
    				        }
    						
    						
    					});
                    }
                }
            }); 
			
		}
	
		
		// 确认对话框
		function confirmxSB(fileId,fileUlr,mess,closed){
			top.$.jBox.confirm(mess,'提示',function(v,h,f){
				if(v=='ok'){
					
					$.ajax({  
						type:'post',
						url:'${ctx}/rmyhform/tbRmyhFile/save',
						async:true,
						data: {"id":fileId,"fileUlr":fileUlr},  
						dataType:"text",
						traditional: true,//可传递数组
						success:function(data){
							if(fileUlr == 1){
								alert("上报成功！！");
								window.location.href="${ctx}/rmyhform/tbRmyhFile/list?status=1";
							}else if( fileUlr == 2 ){
								window.location.href="${ctx}/rmyhform/tbRmyhFile/shlist?file_status=1";
							}else if( fileUlr == 11 ){
								
								window.location.href="${ctx}/rmyhform/tbRmyhFile/shlist2?file_status=2";
							}
					
						},
						error: function(XMLHttpRequest, textStatus, errorThrown) {
							if(fileUlr == 1 ){
								alert("上报失败!请联系管理员！！");
							}
							
				        }
						
						
					});
				}
			},{buttonsFocus:1, closed:function(){
				if (typeof closed == 'function') {
					closed();
				}
			}});
			top.$('.jbox-body .jbox-icon').css('top','55px');
			return false;
		}
		
		
		function pfPass(id,officeId,fileId){
				message = "你确定通过审核吗？";
				//confirmxPF(id,officeId,fileId,message,"#");
				
			Confirm.show('提示',message, {
                '确定': {
                    'primary': false,
                    'callback': function() {
                    	
                    	submitScore(id,officeId,fileId);
                    }
                }
            }); 
			
		}
		
		// 确认对话框
		function confirmxPF(id,officeId,fileId,mess,closed){
			top.$.jBox.confirm(mess,'提示',function(v,h,f){
				if(v=='ok'){
					
					submitScore(id,officeId,fileId);
				}
			},{buttonsFocus:1, closed:function(){
				if (typeof closed == 'function') {
					closed();
				}
			}});
			top.$('.jbox-body .jbox-icon').css('top','55px');
			return false;
		}
		
		
		function showModal(){
					
			$('#myModal').modal('show');
			
				
		}
		
		function showScoreModal(fileId,fileUlr){
			
			$('#scoreModal').modal('show');
			
				
		}
		function submitReson(fileId,fileUlr){
			
			$('#myModal').modal('hide');
			var remark = $("#remarks").val();
			if(!remark){
				alert("退回原因不能为空！！");
				return;
			}
			var fromflag = ${fromflag};
			
	       	$.ajax({  
				type:'post',
				url:'${ctx}/rmyhform/tbRmyhFile/save',
				async:true,
				data: {"id":fileId,"fileUlr":fileUlr,"remark":remark,"fromflag":fromflag},  
				dataType:"text",
				traditional: true,//可传递数组
				success:function(data){
					if(fromflag == '20'){
						
						window.location.href="${ctx}/rmyhform/tbRmyhFile/scoreList?flag=3";
					}else if(fromflag == '25'){
						window.location.href="${ctx}/rmyhform/tbRmyhFile/scoreList?flag=5";
					} else if(fromflag == '6'){
						window.location.href="${ctx}/rmyhform/tbRmyhFile/shlist?file_status=1";
					}else if(fromflag == '88'){
						window.location.href="${ctx}/rmyhform/tbRmyhFile/shlist2?file_status=2";
					}
						
				},
				error: function(XMLHttpRequest, textStatus, errorThrown) {
					if(fileUlr == 1){
						alert("退回失败！！请联系管理员！！！");
					}
					
		        }
				
			});
		}
		function submitScore(id,officeId,fileId){
			$('#scoreModal').modal('hide');
			   var kfMap = {};
			   var kfRsMap = {};
			   var jfbzIdMap = {};
			$("td[name='kftd']").each(function(){
				var kfValue = $(this).attr("class");
				var kfKey = $(this).attr("id");
				kfMap[kfKey] = kfValue;
			});
			var  kfJson = JSON.stringify(kfMap); 
			$("textarea[name='kfReason']").each(function(){
				var kfRsValue = $(this).text();
				var kfRsKey = $(this).attr("id");
					kfRsMap[kfRsKey] = kfRsValue;
			});
			var kfRsJson = JSON.stringify(kfRsMap); 
			
			$("input[name='checkbox']:checked").each(function(){
				
				var ckIdkey = $(this).attr("class");
				var ckValue = $(this).attr("id");
				if(jfbzIdMap[ckIdkey] == null || jfbzIdMap[ckIdkey] == ""){
					jfbzIdMap[ckIdkey] = ckValue;
				}else{
					jfbzIdMap[ckIdkey] = jfbzIdMap[ckIdkey]+";"+ckValue;
				}
			});
			var jfbzIdJson = JSON.stringify(jfbzIdMap); 
			var fromflag = ${fromflag};
			
			var flagId = $("#flagId").val(); 
	       	$.ajax({  
				type:'post',
				url:'${ctx}/rmyhform/tbRmyhKf/save',
				async:true,
				data: {"formId":id,"kf":kfJson,"kfRs":kfRsJson,"jfbzIdJson":jfbzIdJson,"officeId":officeId,"fileId":fileId,"fromflag":fromflag,"flagId":flagId},  
				dataType: "json",
				traditional: true,//可传递数组
				success:function(data){
						alert("保存成功！"); 
						alert(fromflag);
						if(fromflag == '20'){
							
							window.location.href="${ctx}/rmyhform/tbRmyhFile/scoreList?flag=4";
						}else{
							window.location.href="${ctx}/rmyhform/tbRmyhFile/scoreList?&flag=2";
						}				
				},
				error: function(XMLHttpRequest, textStatus, errorThrown) {
					/* if(fileUlr == 1){
						alert("退回失败！！请联系管理员！！！");
					} */
					alert("保存成功！");
					if(fromflag == '20'){
						
						window.location.href="${ctx}/rmyhform/tbRmyhFile/scoreList?flag=4";
					}else if(fromflag == '25'){
						
						window.location.href="${ctx}/rmyhform/tbRmyhFile/scoreList?flag=6";
					}else{
						
						window.location.href="${ctx}/rmyhform/tbRmyhFile/scoreList?&flag=2";
					}	
		        }
				
				
			});
		}
		
		function checkboxOnclick(checkbox){
			var score=0;
			var str="";
			$(checkbox).parents("td").find("input[name='checkbox']:checkbox").each(function(){ 
                if($(this).attr("checked")){
                	score +=  parseFloat($(this).val());
                	str+=$(this).parent().text();
                	
                }
            })	;
		
			//校验分值
			var allSore= $(checkbox).parents("tr").find("td[name='standScore']").html();
			if(score >  parseFloat(allSore)){
				alert("扣分值不能大于总值！！");
				$(checkbox).attr("checked",false);
				return false;
			}
			//设置扣分原因
			$(checkbox).parents("tr").find("textarea[name='kfReason']").text(str);
			//设置扣分总值
			$(checkbox).parents("td").next().html(score);
			$(checkbox).parents("td").next().attr("class",score);
			/* $(checkbox).parents("td").find("input[name='kf']").val(score); */
			/* $("input[name='kf']").each(function(){
				
				alert($(this).val());
			}); */
		}
	
	
	
    function doPrint(){
    	//$(".print").printArea(); 
    	 
   		 var id = $("#id").val();
   		 var fileId = $("#fileId").val();
   		 var officeId = $("#officeId").val();
   		 var flagId = $("#flagId").val();
   		 
    	var url = "${ctx}/rmyhform/khformview/view?fromflag=30&id="+id+"&fileId="+fileId+"&officeId="+officeId+"&flagId="+flagId+"&officename=${officename}";
    	window.open(url);
        //window.print();
     }
</script>
</head>
<body>
 
	<input id="flagId" type="hidden" value="${flagId}"> 
	<input id="id" type="hidden" value="${id}"> 
	<input id="fileId" type="hidden" value="${fileId}"> 
	<input id="officeId" type="hidden" value="${officeId}"> 
	<c:if test="${fromflag == '0'}">
		 <ul class="ul-form breadcrumb form-search">
				 <c:forEach items="${formNameList}" var="nameInfo" varStatus="status">
						<li class="btns"><input name="formname" class="btn btn-primary:hover" type="button" value="${nameInfo.name}" onclick='clickform("${nameInfo.id}")'/></li>
				 </c:forEach>
		</ul>
	</c:if>
	<c:if test="${fromflag == '1'}">
		<ul class="nav nav-tabs">
			<li ><a href="${ctx}/rmyhform/tbRmyhFile/list?status=1">未上报</a></li>
			<li class="active"><a href="#">考核资料上报</a></li>
			
		</ul>
	</c:if>
	<c:if test="${fromflag == '2'}">
		<ul class="nav nav-tabs">
			<li><a href="${ctx}/rmyhform/tbRmyhFile/list?status=2">已上报</a></li>
			<li class="active"><a href="#">上报资料查看</a></li>
		</ul>
	</c:if>
	<c:if test="${fromflag == '3'}">
		<ul class="nav nav-tabs">
			<li><a href="${ctx}/rmyhform/tbRmyhFile/list?status=3">考核结果</a>
			<li class="active"><a href="#">详情查看</a></li>
		</ul>
	</c:if>
	
		
		
	<c:if test="${fromflag == '6'}">
		<ul class="nav nav-tabs">
			<li><a href="${ctx}/rmyhform/tbRmyhFile/shlist?file_status=1">未审核</a></li>
			<li class="active"><a href="#">审核</a></li>
		</ul>
	</c:if>
	<c:if test="${fromflag == '88'}">
		<ul class="nav nav-tabs">
			<li><a href="${ctx}/rmyhform/tbRmyhFile/shlist2?file_status=2">未审核</a></li>
			<li class="active"><a href="#">审核</a></li>
		</ul>
	</c:if>
	<c:if test="${fromflag == '7'}">
		<ul class="nav nav-tabs">
			<li><a href="${ctx}/rmyhform/tbRmyhFile/shlist?file_status=2">审核通过</a></li>
			<li class="active"><a href="#">考核资料查看</a></li>
		</ul>
	</c:if>
	<c:if test="${fromflag == '8'}">
		<ul class="nav nav-tabs">
			<li><a href="${ctx}/rmyhform/tbRmyhFile/shlist?file_status=3">审核未通过</a>
			<li class="active"><a href="">考核资料查看</a></li>
		</ul>
	</c:if>
	
	<c:if test="${fromflag == '9.1'}">
		<ul class="nav nav-tabs">
			<li><a href="${ctx}/rmyhform/tbRmyhFile/list?status=3">考核结果</a>
			<li class="active"><a href="#">详情查看</a></li>
		</ul>
	</c:if>
	<c:if test="${fromflag == '9.2'}">
		<ul class="nav nav-tabs">
			<li><a href="${ctx}/rmyhform/tbRmyhFile/shlist?file_status=4">考核结果</a>
			<li class="active"><a href="#">详情查看</a></li>
		</ul>
	</c:if>
	<c:if test="${fromflag == '9.3'}">
		<ul class="nav nav-tabs">
			<li><a href="${ctx}/rmyhform/tbRmyhFile/scoreList?flag=2">考核完成列表</a>
			<li class="active"><a href="#">详情查看</a></li>
		</ul>
	</c:if>
	<c:if test="${fromflag == '21'}">
		<ul class="nav nav-tabs">
			<li><a href="${ctx}/rmyhform/tbRmyhFile/scoreList?flag=4">评分审核完成列表</a>
			<li class="active"><a href="#">详情查看</a></li>
		</ul>
	</c:if>
	<c:if test="${fromflag == '26'}">
		<ul class="nav nav-tabs">
			<li><a href="${ctx}/rmyhform/tbRmyhFile/scoreList?flag=6">审核完成列表</a>
			<li class="active"><a href="#">详情查看</a></li>
		</ul>
	</c:if>
	<!-- 打分页面 -->
	<c:if test="${fromflag == '10'}">
		<ul class="nav nav-tabs">
			<li> <a  href="${ctx}/rmyhform/tbRmyhFile/scoreList?flag=1">未考核列表</a>
			<li class="active"><a href="">评分</a></li>
		</ul>
	</c:if>
		<c:if test="${fromflag == '11'}">
		<ul class="nav nav-tabs">
			<li> <a  href="${ctx}/rmyhform/tbRmyhFile/scoreList?flag=2">考核完成列表</a>
			<li class="active"><a href="">重新打分</a></li>
		</ul>
	</c:if>
	<c:if test="${fromflag == '20'}">
		<ul class="nav nav-tabs">
			<li> <a  href="${ctx}/rmyhform/tbRmyhFile/scoreList?flag=3">评分未审核列表</a></li>
			<li class="active"><a href="">审核</a></li>
		</ul>
	</c:if>
	
	<c:if test="${fromflag == '25'}">
		<ul class="nav nav-tabs">
			<li> <a  href="${ctx}/rmyhform/tbRmyhFile/scoreList?flag=5">未审核列表</a></li>
			<li class="active"><a href="">审核</a></li>
		</ul>
	</c:if>
	
	<c:if test="${fromflag == '3'||fromflag == '9.1' || fromflag == '9.2'|| fromflag == '9.3' || fromflag == '21'|| fromflag == '26'}">
		<input id="btnSubmit" onclick='doPrint()' style="float:right;margin-right:80px;margin-bottom: 10px" class="btn btn-primary" type="submit" value="&nbsp;打&nbsp;&nbsp;印&nbsp;"/>
	</c:if>
	
	<h2 id="title" class="text-center">${title}</h2>
	<!-- 资料上报的上报按钮 -->
	<c:if test="${fromflag == '1'}">
		<input id="btnSubmit" onclick='changeStatus("${fileId}",1)' style="float:right;margin-right:80px;margin-bottom: 10px" class="btn btn-primary" type="submit" value="&nbsp;上&nbsp;&nbsp;报&nbsp;"/>
	</c:if>
	<!-- 资料一级审核-->
	<c:if test="${fromflag == '6'}">
		<input id="btnSubmit" onclick='showModal()' style="float:right;margin-right:80px;margin-bottom: 10px" class="btn btn-primary" type="submit" value="&nbsp;退&nbsp;&nbsp;回&nbsp;"/>
		<input id="btnSubmit" onclick='changeStatus("${fileId}",2)' style="float:right;margin-right:10px;margin-bottom: 10px" class="btn btn-primary" type="submit" value="&nbsp;通&nbsp;&nbsp;过&nbsp;"/>
	</c:if>
	<!-- 资料二级审核-->
	<c:if test="${fromflag == '88'}">
		<input id="btnSubmit" onclick='showModal()' style="float:right;margin-right:80px;margin-bottom: 10px" class="btn btn-primary" type="submit" value="&nbsp;退&nbsp;&nbsp;回&nbsp;"/>
		<input id="btnSubmit" onclick='changeStatus("${fileId}",11)' style="float:right;margin-right:10px;margin-bottom: 10px" class="btn btn-primary" type="submit" value="&nbsp;通&nbsp;&nbsp;过&nbsp;"/>
	</c:if>
	
	<!-- 打分确认的按钮-->
	<c:if test="${fromflag == '10' || fromflag == '11' }">
		<input id="btnSubmit" onclick='showScoreModal()' style="float:right;margin-right:80px;margin-bottom: 10px" class="btn btn-primary" type="submit" value="&nbsp;提&nbsp;&nbsp;交&nbsp;"/>
	</c:if>
	<!-- 评分审核通过不通过按钮-->
	<c:if test="${fromflag == '20' || fromflag == '25'}">
		<input id="btnSubmit" onclick='showModal()' style="float:right;margin-right:80px;margin-bottom: 10px" class="btn btn-primary" type="submit" value="&nbsp;退&nbsp;&nbsp;回&nbsp;"/>
		<input id="btnSubmit" onclick='pfPass("${id}","${officeId}","${fileId}")' style="float:right;margin-right:10px;margin-bottom: 10px" class="btn btn-primary" type="submit" value="&nbsp;通&nbsp;&nbsp;过&nbsp;"/>
	</c:if>
	
	<c:if test="${fromflag == '0'}">
		<div style="display:inline;">
			<div style="float:right;margin-left: 30px">
				 <input id="btnSubmit" onclick='sendkh("${id}")' style="float:right;margin-right:40px" class="btn btn-primary" type="submit" value="考核表下发"/>
			</div>
			<div   style="float:right;margin-left: 30px">
				<label style="font-size:15px;">下发部门:</label>
				<div  style="display:inline;">
	                <sys:treeselect id="company" name="company.id" value="${user.company.id}" labelName="company.name" labelValue="${user.company.name}"
						title="部门" url="/sys/office/treeData?type=2" cssClass="required" checked="true"  smallBtn="true" />
				</div>
			</div>
			
			
		</div>
	<br/><br/>

	<div class="alert alert-danger hide" id="myalert">
	    <button type="button" class="close" data-dismiss="alert">&times;</button>
	  	请先选择下发单位！！！
	</div>
 </c:if>
		
		


<table class="table table-bordered">
  <thead>
    <tr>
      <th  width="7%">项目1</th>
      <th width="15%">考核内容</th>
      <th  width="15%">考核标准</th>
      <th width="5%" >分值</th>
      <c:if test="${fromflag != '10' && fromflag != '11' && fromflag != '20'  && fromflag != '25'}">  
      	<th width="15%"> 计分标准</th>
      </c:if>
      <th width="15%">查阅资料</th>
      <th  width="15%">资料附件</th>
      <c:if test="${fromflag == '10' || fromflag == '11' || fromflag == '11'  || fromflag == '20' || fromflag == '25'}">
      	<th width="15%">评分</th>
      </c:if>
      <c:if test="${fromflag == '9.1'||fromflag == '9.2'||fromflag == '9.3' || fromflag =='10' || fromflag =='11' || fromflag =='20'|| fromflag =='21'|| fromflag =='25'|| fromflag =='26'}">
	       <th>扣分</th>
	      <th width="15%">扣分原因</th>
      </c:if>
     
    </tr>
  </thead>
  <tbody id="tl">
   <c:forEach items="${rowData}" var="rowdata" varStatus="status">
	    <tr>
	      <c:if test="${rowdata.itemName != null}">
	      	<td rowspan="${rowdata.itemChildSize}">${rowdata.itemName}</td>
	      </c:if>	
	      <c:if test="${rowdata.contentName != null}">
	      	<td rowspan="${rowdata.contentChildSize}">${rowdata.contentName}</td>
	      </c:if>
	     
	      	<td>${rowdata.standName}</td>
	      
	      	<td name="standScore">${rowdata.standScore}</td>
	      	 <c:if test="${fromflag != '10' && fromflag != '11' && fromflag != '20' && fromflag != '25'}">
		      	<td>
		      		<c:forEach items="${rowdata.jfbzList}" var="jfbzdata">
		      			<p>${jfbzdata.name}</p>
		      		</c:forEach>
		      	</td>
		      	
		     </c:if>
	      	<td >
	      	 	<c:forEach items="${rowdata.fileDatail}" var="filedata">
	      			<p>${filedata.name}</p>
	      		</c:forEach>
	      	</td>
	      	 
	      	<td   style="text-align:center;">
	      		<c:choose>
	      			<c:when test="${fromflag == '1' && rowdata.file != null }">
		      			 <input id="nameImage${status.index}" name="file" maxlength="255" class="input-xlarge" type="hidden" value="${rowdata.file}">
						 <sys:ckfinder input="nameImage${status.index}" type="khfiles" uploadPath="${flagId}/${rowdata.standId}" selectMultiple="true" maxWidth="100" maxHeight="100"/>
	      			</c:when>
	      			<c:otherwise>
	      				<input id="nameImage${status.index}" name="file" maxlength="255" class="input-xlarge" type="hidden" value="${rowdata.file}">
					 <sys:ckfinder input="nameImage${status.index}" type="khfiles" uploadPath="${rowdata.standId}" readonly="true" selectMultiple="true" maxWidth="100" maxHeight="100"/>
	      			</c:otherwise>
	      		</c:choose>
	      	</td>
	       <c:if test="${fromflag == '10' || fromflag == '11' || fromflag == '20' || fromflag == '25'}">	
	      	<td >
	      		<%-- <input id="${rowdata.standId}" name="kf"  value=""  hidden="hidden"> --%>
				<c:forEach items="${rowdata.jfbzList}" var="jfbzdata">
	      			<div class="checkbox">
						<label><input id=${jfbzdata.id} <c:if test="${fn:contains(rowdata.jfbzIds,jfbzdata.id)}"> checked ='checked'</c:if>class="${rowdata.standId}" type="checkbox" name="checkbox" value="${jfbzdata.allScore}"  onclick="checkboxOnclick(this)">${jfbzdata.name}</label>
					</div>
	      		</c:forEach>                          
	      	</td>
	     </c:if>
	     <c:if test="${fromflag == '9.1' || fromflag == '9.2' ||fromflag == '9.3'|| fromflag == '10' || fromflag == '11' || fromflag == '20' || fromflag == '21'|| fromflag == '25'|| fromflag == '26'}">
		     
		      	
			      	<c:choose>
			      		<c:when test="${rowdata.df != null && rowdata.df !='' }">
			      			 <td name="kftd" id="${rowdata.standId}" class="${rowdata.df}">
			      				<fmt:parseNumber value="${rowdata.df}" pattern="0" />
			      			</td>
			      		</c:when>
			      		<c:otherwise>
			      			<td name="kftd" id="${rowdata.standId}" class="0">
			      				0
			      			</td>
			      		</c:otherwise>
			      	</c:choose>
		      
	      </c:if>
		   
		    <c:if test="${fromflag == '9.1' || fromflag == '9.2' ||fromflag == '9.3'||fromflag == '21'||fromflag == '26'}">
		     	 <td>
			      	${rowdata.kfReason}
			     </td>
		   </c:if>
		   <c:if test="${fromflag == '10' || fromflag == '11'  || fromflag == '20' || fromflag == '25'}">
		   		<td>
		   			<textarea id="${rowdata.standId}" name="kfReason" maxlength="500" class="input-xlarge" rows="5">${rowdata.kfReason}</textarea>	
		   		</td>
		   </c:if>
	    </tr>
   </c:forEach> 
  </tbody>
</table> 
<!-- 模态窗口 -->		
<div class="modal fade" id="myModal" style="width:500px;;display: none;" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
				</button>
				<h4 class="modal-title" id="myModalLabel">
					退回原因
				</h4>
			</div>
			<div class="modal-body" >
				<textarea id="remarks" name="remarks" maxlength="5000"  style="width:450px"  class="input-xlarge" rows="5"></textarea>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">
					关闭
				</button>
				<button type="button"  onclick='submitReson("${fileId}",3)'>
					提交
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- 模态窗口 -->		
<div class="modal fade" id="scoreModal" style="width:500px;display: none;margin-top: 150px" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
				</button>
			</div>
			<div class="modal-body" >
				<p style="color:red;">请确认评分无误后，进行提交！！！</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">
					取消
				</button>
				<button type="button"  onclick='submitScore("${id}","${officeId}","${fileId}")'>
					提交
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->




</body>
		
	