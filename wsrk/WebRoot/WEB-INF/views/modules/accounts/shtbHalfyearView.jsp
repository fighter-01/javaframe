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
			
			var allScore = ${tbHalfyear.a}+${tbHalfyear.b}+${tbHalfyear.c}+${tbHalfyear.d}+${tbHalfyear.e};
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
		
		
		function changeStatus(id){
		
				var message = "	你确定要通过审核吗？";
			
			Confirm.show('提示',message, {
                '确定': {
                    'primary': false,
                    'callback': function() {
                    	$.ajax({  
    						type:'post',
    						url:'${ctx}/accounts/tbHalfyear/updateSign',
    						async:true,
    						data: {"id":id,"status":"3"},    
    						dataType:"text",
    						traditional: true,//可传递数组
    						success:function(data){
    							if(data == 1){
    								
    								window.location.href="${ctx}/accounts/tbHalfyear/list?flag=2";
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
			$('#myModal').modal('hide');
			var remark = $("#remarks").val();
			if(!remark){
				alert("退回原因不能为空！！");
				return;
			}
			$.ajax({  
				type:'post',
				url:'${ctx}/accounts/tbHalfyear/updateRemarks',
				async:true,
				data: {"id":id,"remarks":remark},  
				dataType:"text",
				traditional: true,//可传递数组
				success:function(data){
					if(data == 1){
						alert("退回成功！！");
						
						window.location.href="${ctx}/accounts/tbHalfyear/list?flag=2";
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
		<li><a href="${ctx}/accounts/tbHalfyear/list?flag=2">半年自查表列表</a></li>
		<li class="active"><a href="#">半年自查表审核</a></li>
		</ul>	
		<div ><p style="font-family:SimSun;font-size:30px;text-align: center;margin-top: 49px;"><strong> 部门落实党风廉政建设责任制情况半年自查表</strong></p></div>
		<%-- <div class="control-group">
			<label class="control-label">归属支行：</label>
			<div class="controls" style="float:left;margin-left: 5px">
				${tbHalfyear.company.name}
			</div>
			<div style="float:left;margin-right: 0px;">
			<label class="control-label">归属部门：</label>
			${tbHalfyear.company.name}
		</div>
		<c:if test="${tbHalfyear.status == '1'}">
			<a href="#" onclick='changeStatus()'  style="margin-left:-20px" class="btn btn-primary mb10 mr5 notification" data-note-style="primary" data-note-opacity="0.75">提&nbsp;交&nbsp审&nbsp核</a>
		</c:if>
		<c:if test="${tbHalfyear.status == '2'}">
			<a href="#" onclick='changeStatus()'  style="margin-left:-40px" class="btn btn-primary mb10 mr5 notification" data-note-style="primary" data-note-opacity="0.75">通&nbsp;过</a>
			<a href="#" onclick='changeStatus()'  style="margin-left:2px" class="btn btn-primary mb10 mr5 notification" data-note-style="primary" data-note-opacity="0.75">退&nbsp;回</a>
		</c:if>
		</div> --%>
		<div style="float:right;margin-right: 20px;margin-bottom:10px;">
			<input id="btnSubmit" onclick='showModal()' style="float:right;margin-right:80px;margin-bottom: 10px" class="btn btn-primary" type="submit" value="&nbsp;退&nbsp;&nbsp;回&nbsp;"/>
			<input id="btnSubmit" onclick='changeStatus("${tbHalfyear.id}")' style="float:right;margin-right:10px;margin-bottom: 10px" class="btn btn-primary" type="submit" value="&nbsp;通&nbsp;&nbsp;过&nbsp;"/>
	</div>
<table class="table table-bordered " style="margin-top: 30px">
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
	      	<td rowspan="4">${tbHalfyear.tbHalfyearTable.a1}</td>
	      	<td rowspan="4">${tbHalfyear.tbHalfyearTable.a2}</td>
	      	<td width="2%">${tbHalfyear.tbHalfyearTable.a3}</td>
	      	<td>${tbHalfyear.tbHalfyearTable.a4}</td>
	      	<td>${tbHalfyear.tbHalfyearTable.a5}</td>
	      	<td>
				<span>&nbsp${tbHalfyear.a1} </span>
			</td>
	      	<td rowspan="4">
	      			<span>&nbsp${tbHalfyear.a} </span>
	      	</td>
	    </tr>
	     <tr>
	      	<td>${tbHalfyear.tbHalfyearTable.a6}</td>
	      	<td>${tbHalfyear.tbHalfyearTable.a7}</td>
	      	<td >${tbHalfyear.tbHalfyearTable.a8}</td>
	      	<td>	<span>&nbsp${tbHalfyear.a2} </span> </td>
	    </tr>
	     <tr>
	      	<td>${tbHalfyear.tbHalfyearTable.a9}</td>
	      	<td>${tbHalfyear.tbHalfyearTable.a10}</td>
	      	<td >${tbHalfyear.tbHalfyearTable.a11}</td>
	      	<td><span>&nbsp${tbHalfyear.a3}  </td>
	    </tr>
	    <tr>
		     <td>${tbHalfyear.tbHalfyearTable.a12}</td>
	      	<td>${tbHalfyear.tbHalfyearTable.a13}</td>
	      	<td >${tbHalfyear.tbHalfyearTable.a14}</td>
	      	<td><span>&nbsp${tbHalfyear.a4} </td>
	    </tr>
	    
	     <tr>
	      	<td rowspan="5">${tbHalfyear.tbHalfyearTable.a15}</td>
	      	<td rowspan="5">${tbHalfyear.tbHalfyearTable.a16}</td>
	      	<td width="2%">${tbHalfyear.tbHalfyearTable.a17}</td>
	      	<td>${tbHalfyear.tbHalfyearTable.a18}</td>
	      	<td>${tbHalfyear.tbHalfyearTable.a19}</td>
	      	<td> <span>&nbsp${tbHalfyear.a5} </td>
	      	<td rowspan="5">
	      		<span>&nbsp${tbHalfyear.b}
	      	</td>
	    </tr>
	     <tr>
	      	<td width="2%">${tbHalfyear.tbHalfyearTable.a20}</td>
	      	<td>${tbHalfyear.tbHalfyearTable.a21}</td>
	      	<td>${tbHalfyear.tbHalfyearTable.a22}</td>
	      	<td><span>&nbsp${tbHalfyear.a6}  </td>
	    </tr>
	     <tr>
	      	<td width="2%">${tbHalfyear.tbHalfyearTable.a23}</td>
	      	<td>${tbHalfyear.tbHalfyearTable.a24}</td>
	      	<td>${tbHalfyear.tbHalfyearTable.a25}</td>
	      	<td> <span>&nbsp${tbHalfyear.a7} </td>
	    </tr>
	     <tr>
	      	<td width="2%">${tbHalfyear.tbHalfyearTable.a26}</td>
	      	<td>${tbHalfyear.tbHalfyearTable.a27}</td>
	      	<td>${tbHalfyear.tbHalfyearTable.a28}</td>
	      	<td> <span>&nbsp${tbHalfyear.a8} </td>
	    </tr>
	     <tr>
	      	<td width="2%">${tbHalfyear.tbHalfyearTable.a29}</td>
	      	<td>${tbHalfyear.tbHalfyearTable.a30}</td>
	      	<td>${tbHalfyear.tbHalfyearTable.a31}</td>
	      	<td> <span>&nbsp${tbHalfyear.a9} </td>
	    </tr>
	    
	       <tr>
	      	<td rowspan="2">${tbHalfyear.tbHalfyearTable.a32}</td>
	      	<td rowspan="2">${tbHalfyear.tbHalfyearTable.a33}</td>
	      	<td width="2%">${tbHalfyear.tbHalfyearTable.a34}</td>
	      	<td>${tbHalfyear.tbHalfyearTable.a35}</td>
	      	<td>${tbHalfyear.tbHalfyearTable.a36}</td>
	      	<td> <span>&nbsp${tbHalfyear.a10}</td>
	      	<td rowspan="2">
	      		<span>&nbsp${tbHalfyear.c}
	      	</td>
	    </tr>
	     <tr>
	      	<td width="2%">${tbHalfyear.tbHalfyearTable.a37}</td>
	      	<td>${tbHalfyear.tbHalfyearTable.a38}</td>
	      	<td>${tbHalfyear.tbHalfyearTable.a39}</td>
	      	<td><span>&nbsp${tbHalfyear.a11}  </td>
	    </tr>
	    
	      <tr>
	      	<td rowspan="3">${tbHalfyear.tbHalfyearTable.a40}</td>
	      	<td rowspan="3">${tbHalfyear.tbHalfyearTable.a41}</td>
	      	<td width="2%">${tbHalfyear.tbHalfyearTable.a42}</td>
	      	<td>${tbHalfyear.tbHalfyearTable.a43}</td>
	      	<td>${tbHalfyear.tbHalfyearTable.a44}</td>
	      	<td><span>&nbsp${tbHalfyear.a12} </td>
	      	<td rowspan="3">
	      		<span>&nbsp${tbHalfyear.d}
	      	</td>
	    </tr>
	     <tr>
	      	<td width="2%">${tbHalfyear.tbHalfyearTable.a45}</td>
	      	<td>${tbHalfyear.tbHalfyearTable.a46}</td>
	      	<td>${tbHalfyear.tbHalfyearTable.a47}</td>
	      	<td><span>&nbsp${tbHalfyear.a13}  </td>
	    </tr>
	     <tr>
	      	<td width="2%">${tbHalfyear.tbHalfyearTable.a48}</td>
	      	<td>${tbHalfyear.tbHalfyearTable.a49}</td>
	      	<td>${tbHalfyear.tbHalfyearTable.a50}</td>
	      	<td><span>&nbsp${tbHalfyear.a14} </td>
	    </tr>
	    
	     <tr>
	      	<td>${tbHalfyear.tbHalfyearTable.a51}</td>
	      	<td >${tbHalfyear.tbHalfyearTable.a52}</td>
	      	<td width="2%">${tbHalfyear.tbHalfyearTable.a53}</td>
	      	<td>${tbHalfyear.tbHalfyearTable.a54}</td>
	      	<td>${tbHalfyear.tbHalfyearTable.a55}</td>
	      	<td><span>&nbsp${tbHalfyear.a15} </td>
	      	<td >
	      		<span>&nbsp${tbHalfyear.e}
	      	</td>
	    </tr>
	    
	      <tr>
	      	<td colspan="7">部门落实党风廉政建设责任制自查得分：<span id="allScore"></span></td>
	    </tr>
	     <tr>
	      	<td colspan="7">部门负责人签字：<span style="text-align: right;float:right;margin-right:140px"><fmt:formatDate value="${tbHalfyear.signTime}" pattern="yyyy-MM-dd"/></span></td>
	    </tr>
  </tbody>
</table> 
	<!-- 模态窗口 -->		
<div class="modal fade" id="myModal" style="width:500px;display: none;" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
				<button type="button" onclick='submitReson("${tbHalfyear.id}")'>
				<%-- <button type="button" class="btn btn-primary" onclick='submitReson("${tbHalfyear.id}")'> --%>
					提交
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</body>
</html>