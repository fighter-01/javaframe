<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>部门落实党风廉政建设责任制情况半年自查表管理</title>
	<meta name="decorator" content="default"/>
	<object id="WebBrowser" classid=CLSID:8856F961-340A-11D0-A96B-00C04FD705A2 height="0" width="0"> 
</object> 
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
		
		
		function changeStatus(id){
		
				var message = "	你确定要通过审核吗？";
			
			Confirm.show('提示',message, {
                '确定': {
                    'primary': true,
                    'callback': function() {
                    	$.ajax({  
    						type:'post',
    						url:'${ctx}/accounts/tbYear/updateSign',
    						async:true,
    						data: {"id":id,"status":"3"},    
    						dataType:"text",
    						traditional: true,//可传递数组
    						success:function(data){
    							if(data == 1){
    								
    								window.location.href="${ctx}/accounts/tbYear/list?flag=2";
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
				url:'${ctx}/accounts/tbYear/updateRemarks',
				async:true,
				data: {"id":id,"remarks":remark},  
				dataType:"text",
				traditional: true,//可传递数组
				success:function(data){
					if(data == 1){
						alert("退回成功！！");
						
						window.location.href="${ctx}/accounts/tbYear/list?flag=2";
					}else{
						alert("退回失败！！请联系管理员！！！");
					}
						
				},
				error: function(XMLHttpRequest, textStatus, errorThrown) {
					
						alert("退回失败！！请联系管理员！！！");
					
					
		        }
				
				
			});
		}
		
		 function doPrint(){
	    	 
			 document.all.WebBrowser.ExecWB(7,1);
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
	<style type="text/css">
		table, td
		 {
			border: 1px solid #333; 
		 }
		
	</style>
</head>
<body>
	
		<div ><p style="font-family:SimSun;font-size:30px;text-align: center;margin-top: 49px;"><strong>九、部门落实党风廉政建设责任制年度量化考评表</strong></p></div>
			<input class="Noprint" id="btnSubmit" onclick='doPrint()' style="float:right;margin-right:80px;margin-bottom: 10px" class="btn btn-primary" type="submit" value="&nbsp;打&nbsp;&nbsp;印&nbsp;"/>
	</br>
	</br>
<table class="table table-bordered " style="font-family:SimSun;font-size:16px;width:80%;margin: auto;border: 1px solid #333; margin-bottom: 30px " >
  <thead>
    <tr>
       <td  width="2%" style="text-align: center;font-weight:bold ;">考</br>评</br>项</br>目</td>
      <td width="3%" colspan="2" style="text-align: center;font-weight:bold ;">分值</td>
      <td  width="17%" style="text-align: center;font-weight:bold ;">考评内容</td>
      <td width="17%" style="text-align: center;font-weight:bold ;">考评标准</td>
      <td width="2%" style="text-align: center;font-weight:bold ;"> 扣分</td>
      <td width="2%" style="text-align: center;font-weight:bold ;">得分</td>
    </tr>
  </thead>
  <tbody id="tl">
	    <tr>
	      	 <td rowspan="4" style="text-align: center;font-weight:bold ;">${tbYear.tbHalfyearTable.a1}</td>
	      	<td rowspan="4" style="text-align: center;font-weight:bold ;">${tbYear.tbHalfyearTable.a2}</td>
	      	<td width="2%" style="text-align: center;font-weight:bold ;">${tbYear.tbHalfyearTable.a3}</td>
	      	<td  style="font-weight:bold ;font-size:13px;">${tbYear.tbHalfyearTable.a4}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbYear.tbHalfyearTable.a5}</td>	      
	      	<td>
				<span>&nbsp${tbYear.a1} </span>
			</td>
	      	<td rowspan="4">
	      			<span>&nbsp${tbYear.a} </span>
	      	</td>
	    </tr>
	     <tr>
	      	<td style="text-align: center;font-weight:bold ;">${tbYear.tbHalfyearTable.a6}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbYear.tbHalfyearTable.a7}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbYear.tbHalfyearTable.a8}</td>
		      	<td>	<span>&nbsp${tbYear.a2} </span> </td>
	    </tr>
	     <tr>
	      	<td style="text-align: center;font-weight:bold ;">${tbYear.tbHalfyearTable.a9}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbYear.tbHalfyearTable.a10}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbYear.tbHalfyearTable.a11}</td>
	 	      	<td><span>&nbsp${tbYear.a3}  </td>
	    </tr>
	    <tr>
		   <td style="text-align: center;font-weight:bold ;">${tbYear.tbHalfyearTable.a12}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbYear.tbHalfyearTable.a13}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbYear.tbHalfyearTable.a14}</td>
	   	      	<td><span>&nbsp${tbYear.a4} </td>
	    </tr>
	    
	     <tr>
	      	<td rowspan="5" style="text-align: center;font-weight:bold ;">${tbYear.tbHalfyearTable.a15}</td>
	      	<td rowspan="5" style="text-align: center;font-weight:bold ;">${tbYear.tbHalfyearTable.a16}</td>
	      	<td width="2%" style="text-align: center;font-weight:bold ;">${tbYear.tbHalfyearTable.a17}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbYear.tbHalfyearTable.a18}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbYear.tbHalfyearTable.a19}</td>
	      	<td> <span>&nbsp${tbYear.a5} </td>
	      	<td rowspan="5">
	      		<span>&nbsp${tbYear.b}
	      	</td>
	    </tr>
	     <tr>
	      <td width="2%" style="text-align: center;font-weight:bold ;">${tbYear.tbHalfyearTable.a20}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbYear.tbHalfyearTable.a21}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbYear.tbHalfyearTable.a22}</td>
	      	<td><span>&nbsp${tbYear.a6}  </td>
	    </tr>
	     <tr>
	      	<td width="2%" style="text-align: center;font-weight:bold ;">${tbYear.tbHalfyearTable.a23}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbYear.tbHalfyearTable.a24}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbYear.tbHalfyearTable.a25}</td>
	     	<td> <span>&nbsp${tbYear.a7} </td>
	    </tr>
	     <tr>
	    <td width="2%" style="text-align: center;font-weight:bold ;">${tbYear.tbHalfyearTable.a26}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbYear.tbHalfyearTable.a27}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbYear.tbHalfyearTable.a28}</td>
	       	<td> <span>&nbsp${tbYear.a8} </td>
	    </tr>
	     <tr>
	      	<td width="2%" style="text-align: center;font-weight:bold ;">${tbYear.tbHalfyearTable.a29}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbYear.tbHalfyearTable.a30}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbYear.tbHalfyearTable.a31}</td>
	        	<td> <span>&nbsp${tbYear.a9} </td>
	    </tr>
	    
	       <tr>
	      		<td rowspan="2" style="text-align: center;font-weight:bold ;">${tbYear.tbHalfyearTable.a32}</td>
	      	<td rowspan="2" style="text-align: center;font-weight:bold ;">${tbYear.tbHalfyearTable.a33}</td>
	      	<td width="2%" style="text-align: center;font-weight:bold ;">${tbYear.tbHalfyearTable.a34}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbYear.tbHalfyearTable.a35}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbYear.tbHalfyearTable.a36}</td>
      	<td> <span>&nbsp${tbYear.a10}</td>
	      	<td rowspan="2">
	      		<span>&nbsp${tbYear.c}
	      	</td>
	    </tr>
	     <tr>
	      		<td width="2%" style="text-align: center;font-weight:bold ;">${tbYear.tbHalfyearTable.a37}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbYear.tbHalfyearTable.a38}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbYear.tbHalfyearTable.a39}</td>
	    	<td><span>&nbsp${tbYear.a11}  </td>
	    </tr>
	    
	      <tr>
	      			<td rowspan="3" style="text-align: center;font-weight:bold ;">${tbYear.tbHalfyearTable.a40}</td>
	      	<td rowspan="3" style="text-align: center;font-weight:bold ;">${tbYear.tbHalfyearTable.a41}</td>
	      	<td width="2%" style="text-align: center;font-weight:bold ;">${tbYear.tbHalfyearTable.a42}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbYear.tbHalfyearTable.a43}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbYear.tbHalfyearTable.a44}</td>
	      	<td><span>&nbsp${tbYear.a12} </td>
	      	<td rowspan="3">
	      		<span>&nbsp${tbYear.d}
	      	</td>
	    </tr>
	     <tr>
	      	<td width="2%" style="text-align: center;font-weight:bold ;">${tbYear.tbHalfyearTable.a45}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbYear.tbHalfyearTable.a46}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbYear.tbHalfyearTable.a47}</td>
	   	<td><span>&nbsp${tbYear.a13}  </td>
	    </tr>
	     <tr>
	      			<td width="2%" style="text-align: center;font-weight:bold ;">${tbYear.tbHalfyearTable.a48}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbYear.tbHalfyearTable.a49}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbYear.tbHalfyearTable.a50}</td>
	   	<td><span>&nbsp${tbYear.a14} </td>
	    </tr>
	    
	     <tr>
	      		<td style="text-align: center;font-weight:bold ;">${tbYear.tbHalfyearTable.a51}</td>
	      	<td style="text-align: center;font-weight:bold ;">${tbYear.tbHalfyearTable.a52}</td>
	      	<td width="2%" style="text-align: center;font-weight:bold ;">${tbYear.tbHalfyearTable.a53}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbYear.tbHalfyearTable.a54}</td>
	      	<td style="font-weight:bold ;font-size:13px;">${tbYear.tbHalfyearTable.a55}</td>
	      	<td><span>&nbsp${tbYear.a15} </td>
	      	<td >
	      		<span>&nbsp${tbYear.e}
	      	</td>
	    </tr>
	    
	      <tr>
	      	<td colspan="7" style="font-weight:bold ;">部门落实党风廉政建设责任制量化考评得分：<span id="allScore" style="font-weight:normal ;font-size:15px;">10</span></td>
	    </tr>
	     <tr>
	      	<td colspan="7" style="font-weight:bold ;">部门负责人签字：<span style="font-weight:normal ;">${tbYear.deptSign}</span><span style="text-align: right;float:right;margin-right:140px"><fmt:formatDate value="${tbYear.deptSignTime}" pattern="yyyy年MM月dd日"/></span></td>
	    </tr>
	     <tr>
	      	<td colspan="7" style="font-weight:bold ;">分管行领导签字：<span style="font-weight:normal ;">${tbYear.hldSign}</span><span style="text-align: right;float:right;margin-right:140px"><fmt:formatDate value="${tbYear.hldSignTime}" pattern="yyyy年MM月dd日"/></span></td>
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
				<button type="button" class="btn btn-primary" onclick='submitReson("${tbYear.id}")'>
					提交
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</body>
</html>