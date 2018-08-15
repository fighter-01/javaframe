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
			
			var allScore = ${tbYear.a}+${tbYear.b}+${tbYear.c}+${tbYear.d}+${tbYear.e};
			$("#allScore").text(allScore);
			
			
			
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
			
			var status = ${tbYear.status};
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
    						url:'${ctx}/accounts/tbYear/updateStatus',
    						async:true,
    						data: {"id":id,"status":status},    
    						dataType:"text",
    						traditional: true,//可传递数组
    						success:function(data){
    							if(data == 1){
    								if(status == "4"){
        								window.location.href="${ctx}/accounts/tbYear/list?flag=3";

    								}else{
        								window.location.href="${ctx}/accounts/tbYear/list?flag=2";

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
			
			var status = ${tbYear.status};
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
				url:'${ctx}/accounts/tbYear/updateStatus',
				async:true,
				data: {"id":id,"remarks":remark,"status":status},  
				dataType:"text",
				traditional: true,//可传递数组
				success:function(data){
					if(data == 1){
						alert("退回成功！！");
						if(	status == "6"){
							window.location.href="${ctx}/accounts/tbYear/list?flag=3";
						}else{
							window.location.href="${ctx}/accounts/tbYear/list?flag=2";

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
			 <c:when test="${tbYear.status == '3'}">
				<li><a href="${ctx}/accounts/tbYear/list?flag=3">年度量化考评列表</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="${ctx}/accounts/tbYear/list?flag=2">部门落实党风廉政建设责任制年度量化考评表列表</a></li>
			</c:otherwise>
		</c:choose>
		
		<li class="active"><a href="#">年度量化考评表审核</a></li>
		</ul>	
	
		<div ><p style="font-family:SimSun;font-size:30px;text-align: center;margin-top: 49px;"><strong> 部门落实党风廉政建设责任制年度量化考评表</strong></p></div>
		<div style="float:right;margin-right: 20px;margin-bottom:10px;">
			<input id="btnSubmit" onclick='showModal()' style="float:right;margin-right:80px;margin-bottom: 10px" class="btn btn-primary" type="submit" value="&nbsp;退&nbsp;&nbsp;回&nbsp;"/>
			<input id="btnSubmit" onclick='changeStatus("${tbYear.id}")' style="float:right;margin-right:10px;margin-bottom: 10px" class="btn btn-primary" type="submit" value="&nbsp;通&nbsp;&nbsp;过&nbsp;"/>
	</div>
<table class="table table-bordered " style="margin-top: 30px">
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
				<span>&nbsp${tbYear.a1} </span>
		</td>
	      	<td rowspan="4">
	      			<span>&nbsp${tbYear.a} </span>
	      	</td>
	    </tr>
	     <tr>
	      	<td>${tbYear.tbHalfyearTable.a6}</td>
	      	<td>${tbYear.tbHalfyearTable.a7}</td>
	      	<td >${tbYear.tbHalfyearTable.a8}</td>
	      	  	<td>	<span>&nbsp${tbYear.a2} </span> </td>
	    </tr>
	     <tr>
	      	<td>${tbYear.tbHalfyearTable.a9}</td>
	      	<td>${tbYear.tbHalfyearTable.a10}</td>
	      	<td >${tbYear.tbHalfyearTable.a11}</td>
	    	      	<td><span>&nbsp${tbYear.a3}  </td>
	    </tr>
	    <tr>
		    <td>${tbYear.tbHalfyearTable.a12}</td>
	      	<td>${tbYear.tbHalfyearTable.a13}</td>
	      	<td >${tbYear.tbHalfyearTable.a14}</td>
	        	<td><span>&nbsp${tbYear.a4} </td>
	    </tr>
	    
	     <tr>
	      	<td rowspan="5">${tbYear.tbHalfyearTable.a15}</td>
	      	<td rowspan="5">${tbYear.tbHalfyearTable.a16}</td>
	      	<td width="2%">${tbYear.tbHalfyearTable.a17}</td>
	      	<td>${tbYear.tbHalfyearTable.a18}</td>
	      	<td>${tbYear.tbHalfyearTable.a19}</td>
		      	<td> <span>&nbsp${tbYear.a5} </td>
	      	<td rowspan="5">
	      		<span>&nbsp${tbYear.b}
	      	</td>
	    </tr>
	     <tr>
	      <td width="2%">${tbYear.tbHalfyearTable.a20}</td>
	      	<td>${tbYear.tbHalfyearTable.a21}</td>
	      	<td>${tbYear.tbHalfyearTable.a22}</td>
	         	<td><span>&nbsp${tbYear.a6}  </td>
	    </tr>
	     <tr>
	      	<td width="2%">${tbYear.tbHalfyearTable.a23}</td>
	      	<td>${tbYear.tbHalfyearTable.a24}</td>
	      	<td>${tbYear.tbHalfyearTable.a25}</td>
	       	<td> <span>&nbsp${tbYear.a7} </td>
	    </tr>
	     <tr>
	      <td width="2%">${tbYear.tbHalfyearTable.a26}</td>
	      	<td>${tbYear.tbHalfyearTable.a27}</td>
	      	<td>${tbYear.tbHalfyearTable.a28}</td>
	        	<td> <span>&nbsp${tbYear.a8} </td>
	    </tr>
	     <tr>
	      <td width="2%">${tbYear.tbHalfyearTable.a29}</td>
	      	<td>${tbYear.tbHalfyearTable.a30}</td>
	      	<td>${tbYear.tbHalfyearTable.a31}</td>
	     	<td> <span>&nbsp${tbYear.a9} </td>
	    </tr>
	    
	       <tr>
	      	<td rowspan="2">${tbYear.tbHalfyearTable.a32}</td>
	      	<td rowspan="2">${tbYear.tbHalfyearTable.a33}</td>
	      	<td width="2%">${tbYear.tbHalfyearTable.a34}</td>
	      	<td>${tbYear.tbHalfyearTable.a35}</td>
	      	<td>${tbYear.tbHalfyearTable.a36}</td>
	      	<td> <span>&nbsp${tbYear.a10}</td>
	      	<td rowspan="2">
	      		<span>&nbsp${tbYear.c}
	      	</td>
	    </tr>
	     <tr>
	      	<td width="2%">${tbYear.tbHalfyearTable.a37}</td>
	      	<td>${tbYear.tbHalfyearTable.a38}</td>
	      	<td>${tbYear.tbHalfyearTable.a39}</td>
	    	<td><span>&nbsp${tbYear.a11}  </td>
	    </tr>
	    
	      <tr>
	      		<td rowspan="3">${tbYear.tbHalfyearTable.a40}</td>
	      	<td rowspan="3">${tbYear.tbHalfyearTable.a41}</td>
	      	<td width="2%">${tbYear.tbHalfyearTable.a42}</td>
	      	<td>${tbYear.tbHalfyearTable.a43}</td>
	      	<td>${tbYear.tbHalfyearTable.a44}</td>
	      	    	<td><span>&nbsp${tbYear.a12} </td>
	      	<td rowspan="3">
	      		<span>&nbsp${tbYear.d}
	      	</td>
	    </tr>
	     <tr>
	      	<td width="2%">${tbYear.tbHalfyearTable.a45}</td>
	      	<td>${tbYear.tbHalfyearTable.a46}</td>
	      	<td>${tbYear.tbHalfyearTable.a47}</td>
	 
      	<td><span>&nbsp${tbYear.a13}  </td>
	    </tr>
	     <tr>
	      		<td width="2%">${tbYear.tbHalfyearTable.a48}</td>
	      	<td>${tbYear.tbHalfyearTable.a49}</td>
	      	<td>${tbYear.tbHalfyearTable.a50}</td>
	      	<td><span>&nbsp${tbYear.a14} </td>
	    </tr>
	    
	     <tr>
	      		<td>${tbYear.tbHalfyearTable.a51}</td>
	      	<td >${tbYear.tbHalfyearTable.a52}</td>
	      	<td width="2%">${tbYear.tbHalfyearTable.a53}</td>
	      	<td>${tbYear.tbHalfyearTable.a54}</td>
	      	<td>${tbYear.tbHalfyearTable.a55}</td>
	      	  	<td><span>&nbsp${tbYear.a15} </td>
	      	<td >
	      		<span>&nbsp${tbYear.e}
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
				<button type="button" class="btn" onclick='submitReson("${tbYear.id}")'>
					提交
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</body>
</html>