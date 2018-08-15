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
		
		//审批通过
		function changeStatus(id){
			
			
			//当当前status为2， 6时，为部门负责人审核 status为3时为行领导审核
			
			var status = ${tbWorkInspect.status};
			if(status == "3"){
				status = "4"
			}else{
				status = "3";
			}
				var message = "	你确定要通过审核吗？";
			
			Confirm.show('提示',message, {
                '确定': {
                    'primary': false,
                    'callback': function() {
                    	$.ajax({  
    						type:'post',
    						url:'${ctx}/accounts/tbWorkInspect/updateStatus',
    						async:true,
    						data: {"id":id,"status":status},    
    						dataType:"text",
    						traditional: true,//可传递数组
    						success:function(data){
    							if(data == 1){
    								if(status == "4"){
        								window.location.href="${ctx}/accounts/tbWorkInspect/list?flag=3";

    								}else{
        								window.location.href="${ctx}/accounts/tbWorkInspect/list?flag=2";

    								}
    							}
    					
    						},
    						error: function(XMLHttpRequest, textStatus, errorThrown) {
    							
    								alert("审核失败!请联系管理员！！");
    							
    							
    				        }
    						
    						
    					});
                    }
                }
            });
			
		}
		
		
		function showModal(){
			
			$('#myModal').modal('show');
		}
		
		function submitReson(id){
			
			var status = ${tbWorkInspect.status};
			if(status == "3"){
				status = "6"
			}else{
				status = "5";
			}
			
			$('#myModal').modal('hide');
			var remark = $("#remarks").val();
			if(!remark){
				alert("退回原因不能为空！！");
				return;
			}
			$.ajax({  
				type:'post',
				url:'${ctx}/accounts/tbWorkInspect/updateStatus',
				async:true,
				data: {"id":id,"remarks":remark,"status":status},  
				dataType:"text",
				traditional: true,//可传递数组
				success:function(data){
					if(data == 1){
						alert("退回成功！！");
						if(	status == "6"){
							window.location.href="${ctx}/accounts/tbWorkInspect/list?flag=3";
						}else{
							window.location.href="${ctx}/accounts/tbWorkInspect/list?flag=2";

						}
						
					}else{
						alert("退回失败！！请联系管理员！！！");
					}
						
				},
				error: function(XMLHttpRequest, textStatus, errorThrown) {
					
						alert("退回失败！！请联系管理员！！！");
					
					
		        }
				
				
			});
		}
	</script>
</head>
<body>	
		<ul class="nav nav-tabs">
		<c:choose>
			 <c:when test="${tbWorkInspect.status == '3'}">
				<li><a href="${ctx}/accounts/tbWorkInspect/list?flag=3">工作检查记录行领导审核列表</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="${ctx}/accounts/tbWorkInspect/list?flag=2">工作检查记录部门负责人审核列表</a></li>
			</c:otherwise>
		</c:choose>
		
		<li class="active"><a href="#">工作检查记录审核</a></li>
		</ul>	
	
		<div ><p style="font-family:SimSun;font-size:30px;text-align: center;margin-top: 49px;"><strong> 部门落实党风廉政建设责任制年度量化考评表</strong></p></div>
		<div style="float:right;margin-right: 20px;margin-bottom:10px;">
			<input id="btnSubmit" onclick='showModal()' style="float:right;margin-right:80px;margin-bottom: 10px" class="btn btn-primary" type="submit" value="&nbsp;退&nbsp;&nbsp;回&nbsp;"/>
			<input id="btnSubmit" onclick='changeStatus("${tbWorkInspect.id}")' style="float:right;margin-right:10px;margin-bottom: 10px" class="btn btn-primary" type="submit" value="&nbsp;通&nbsp;&nbsp;过&nbsp;"/>
	</div>
<table class="table table-bordered " style="margin-top: 30px">
  
  <tbody id="tl">
		    <tr>
		      <th  width="25%" style="text-align: center;">分管领导</th>
		      <th width="25%">
		      <span>&nbsp${tbWorkInspect.fgld} </span>
			     
			   </th>
			   <th width="25%" style="text-align: center;" >检查时间</td>
		      <th  width="10%">
		       <span><fmt:formatDate value="${tbWorkInspect.inspectTime}" pattern="yyyy年MM月dd日"/> </span>
		      	
		      </th>
		    </tr>
	   
	     <tr>
	      	<td  style="height:200px;">对部门党风廉政建设工作的总体评价</td>
	      	<td colspan="3">
		      	
					<span>&nbsp${tbWorkInspect.evaluate} </span>
				
		</td>
	      	
	    </tr>
	     <tr>
	      	<td tyle="height:200px;">部门党风廉政建设存在的问题及要求</td>
	      	<td colspan="3">
	      	<span>&nbsp${tbWorkInspect.problem} </span>
				
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
	<!-- 模态窗口 -->		
<div class="modal fade" id="myModal" style="width:500px;display:none;" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
				<button type="button" class="btn" onclick='submitReson("${tbWorkInspect.id}")'>
					提交
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</body>
</html>