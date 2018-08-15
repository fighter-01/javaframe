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
		
		function formSubmit(){
			
			var officeId = $("#officeId").val();
		 	var year = $("#year").val();
		 	var jidu = $("#jidu").val();
		 	var score = $("#score").val();
			var remarks = $("#remarks").val();
			if(score == null || score == ''){
				 parent.layer.msg('评分不能为空！' , {
                     icon: 6,
                     time: 1000 //1秒关闭（如果不配置，默认是3秒）
                 });
				return;
			}
			  $.ajax({
                  type:'post',
                  url: "${ctx}/accounts/tbAccountsScore/layersave",
                  async:true,
                  data: {"year":year,"jidu":jidu,"score":score,"remarks":remarks,"officeId":officeId},
                  traditional: true,//可传递数组
                  success:function(data){
                	  if(data == "0"){
                		  parent.layer.msg('添加失败！该季度已经评分完成！！' , {
                              icon: 5,
                              time: 2000 //1秒关闭（如果不配置，默认是3秒）
                          }); 
                	  }else if(data == "1"){
                          parent.layer.msg('数据保存成功！' , {
                              icon: 6,
                              time: 1000 //1秒关闭（如果不配置，默认是3秒）
                          });
                          var _index = parent.layer.getFrameIndex(window.name);
                          parent.layer.close(_index);
                          //重新加载数据"signResult"
                         // parent.$('#signResult').bootstrapTable('refresh', {url: $ctx +'/solr/solrManager/findResources'});
                         // parent.layer.close(_index);
                	  }																		
                  },
                  error:function(){
                   //   parent.layer.close(loadingIndex);//关闭加载层
                      layer.msg('数据保存失败!' , {
                          icon: 5,
                          time: 1000 //1秒关闭（如果不配置，默认是3秒）
                      });
                  }
              });
			 
		}
	</script>
</head>
<body>
	<form:form id="inputForm" modelAttribute="tbAccountsScore" action="${ctx}/accounts/tbAccountsScore/layersave" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<input id="year" name="year" type="hidden" readonly="readonly" maxlength="20" class="input-medium Wdate required"
					value="<fmt:formatDate value="${tbAccountsScore.year}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
		<input id="jidu" name="jidu" type="hidden"  type="hidden"  value="${tbAccountsScore.jidu}" />
		<input id="officeId" name="office.id"  value="${tbAccountsScore.office.id}" type="hidden" />
		<div class="control-group" style="margin-top: 20px">
			<label class="control-label"><span style="font-weight:bold ;">分数：</span></label>
			<div class="controls">
				<form:input id="score" path="score" htmlEscape="false" maxlength="4" class="input-xlarge required digits"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
			<br>
		</div>
		<br>
		<div class="control-group">
			<label class="control-label"><span style="font-weight:bold ;">评语：</span></label>
			<div class="controls">
				<form:textarea id="remarks" path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
	</form:form>
</body>
</html>