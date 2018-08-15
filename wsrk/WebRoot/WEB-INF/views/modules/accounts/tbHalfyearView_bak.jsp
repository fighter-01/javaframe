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
		
		 function doPrint(){
	    	 
			 document.all.WebBrowser.ExecWB(7,1) ;
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
	
		<div ><p style="font-family:SimSun;font-size:30px;text-align: center;margin-top: 49px;"><strong>八、部门落实党风廉政建设责任制情况半年自查表</strong></p></div>
			<input class="Noprint" id="btnSubmit" onclick='doPrint()' style="float:right;margin-right:80px;margin-bottom: 10px" class="btn btn-primary" type="submit" value="&nbsp;打&nbsp;&nbsp;印&nbsp;"/>
	</br>
	</br>
<table class="table table-bordered " style="font-family:SimSun;font-size:16px;width:80%;margin: auto;border: 1px solid #333; margin-bottom: 30px " >
    <tr>
      <td  width="5%" style="text-align: center;font-weight:bold ;">自</br>查</br>项</br>目</td>
      <td width="5%" colspan="2" style="text-align: center;font-weight:bold ;">分值</td>
      <td  width="15%" style="text-align: center;font-weight:bold ;">自查内容</td>
      <td width="15%" style="text-align: center;font-weight:bold ;">自查标准</td>
      <td width="3%" style="text-align: center;font-weight:bold ;"> 扣分</td>
      <td width="3%" style="text-align: center;font-weight:bold ;">得分</td>
    </tr>
	    <tr>
	      	<td rowspan="4" style="text-align: center;font-weight:bold ;">完善</br>部门</br>党风</br>廉政</br>建设</br>工作</br>机制</td>
	      	<td rowspan="4" style="text-align: center;font-weight:bold ;">20</td>
	      	<td width="2%" style="text-align: center;font-weight:bold ;">4</td>
	      	<td  style="font-weight:bold ;font-size:13px;">1、制订部门年度党风廉政建设工作计划。</td>
	      	<td style="font-weight:bold ;font-size:13px;">未制订部门年度党风廉政建设工作计划不得分。</td>
	      	<td>
				<span>&nbsp${tbHalfyear.a1} </span>
			</td>
	      	<td rowspan="4">
	      			<span>&nbsp${tbHalfyear.a} </span>
	      	</td>
	    </tr>
	     <tr>
	      	<td style="text-align: center;font-weight:bold ;">6</td>
	      	<td style="font-weight:bold ;font-size:13px;">2、部门负责人认真履行“一岗两责”对本部门党风廉政建设工作负总责，把落实党风廉政建设责任制摆上部门重议事日程，每季度至少专题研究一次本部门党风廉政建设工作情况，研究布置本部门业务工作的同时对党风廉政建设工作提出具体要求，解决具体问题。</td>
	      	<td style="font-weight:bold ;font-size:13px;">部门每季度未专题研究党风廉政建设工作的、部门负责人在本部门工作会议上未对党风廉政建设工作提出具体要求的各扣2分(以部门会议记录为准)。</td>
	      	<td>	<span>&nbsp${tbHalfyear.a2} </span> </td>
	    </tr>
	     <tr>
	      	<td style="text-align: center;font-weight:bold ;">5</td>
	      	<td style="font-weight:bold ;font-size:13px;">1、制订部门年度党风廉政建设工作计划。</td>
	      	<td style="font-weight:bold ;font-size:13px;">未制订部门年度党风廉政建设工作计划不得分。</td>
	      	<td><span>&nbsp${tbHalfyear.a3}  </td>
	    </tr>
	    <tr>
		     <td style="text-align: center;font-weight:bold ;">5</td>
	      	<td style="font-weight:bold ;font-size:13px;">1、制订部门年度党风廉政建设工作计划。</td>
	      	<td style="font-weight:bold ;font-size:13px;">未制订部门年度党风廉政建设工作计划不得分。</td>
	      	<td><span>&nbsp${tbHalfyear.a4} </td>
	    </tr>
	    
	     <tr>
	      	<td rowspan="5" style="text-align: center;font-weight:bold ;">严格</br>执行</br>廉洁</br>自律</br>规定</td>
	      	<td rowspan="5" style="text-align: center;font-weight:bold ;">25</td>
	      	<td width="2%" style="text-align: center;font-weight:bold ;">5</td>
	      	<td style="font-weight:bold ;font-size:13px;">1、部门负责人应带头遵守《中国共产党党员领导干部廉洁从政若干准则》，“四大纪律八项要求”和“九个不准”等廉洁从政各项规定。</td>
	      	<td style="font-weight:bold ;font-size:13px;">部门党员干部因违反廉洁自律规定受到党政纪处分的该项不得分，被诫勉谈话的每一起扣2分。</td>
	      	<td> <span>&nbsp${tbHalfyear.a5} </td>
	      	<td rowspan="5">
	      		<span>&nbsp${tbHalfyear.b}
	      	</td>
	    </tr>
	     <tr>
	      	<td width="2%" style="text-align: center;font-weight:bold ;">5</td>
	      	<td style="font-weight:bold ;font-size:13px;">2、结合党员评议、半年总结和年度考核，开展“述职述廉”工作。</td>
	      	<td style="font-weight:bold ;font-size:13px;">在党员评议、半年总结和年度考核中，本部门工作人员未按要求进行述职述廉的每1人扣分。</td>
	      	<td><span>&nbsp${tbHalfyear.a6}  </td>
	    </tr>
	     <tr>
	      	<td width="2%" style="text-align: center;font-weight:bold ;">5</td>
	      	<td style="font-weight:bold ;font-size:13px;">3、认真执行《中国人民银行党员干部报告个人有关事项实施办法》，把报告个人有关事项的情况作为述职述廉和考察、考核党员领导干部的一项重要内容。</td>
	      	<td style="font-weight:bold ;font-size:13px;">部门党员领导干部无正当理由不按时报告、不如实报告个人有关事项、不按组织答复意见办理或隐瞒不的每发现一起扣2分。</td>
	      	<td> <span>&nbsp${tbHalfyear.a7} </td>
	    </tr>
	     <tr>
	      	<td width="2%" style="text-align: center;font-weight:bold ;">5</td>
	      	<td style="font-weight:bold ;font-size:13px;">4、管好配偶、子女及下属工作人员。</td>
	      	<td style="font-weight:bold ;font-size:13px;">对配偶、子女及下属工作人员严重违纪违法知情不管、不汇报的不得分；发现有轻微问题不汇报的每起扣1分。</td>
	      	<td> <span>&nbsp${tbHalfyear.a8} </td>
	    </tr>
	     <tr>
	      	<td width="2%" style="text-align: center;font-weight:bold ;">5</td>
	      	<td style="font-weight:bold ;font-size:13px;">5、严禁个人私自驾驶公务用车和向下属单位借用车辆并擅自驾驶。</td>
	      	<td style="font-weight:bold ;font-size:13px;">部门人员私自驾驶公务用车或向下属单位借用车辆并擅自驾驶的每发现一起扣1分。</td>
	      	<td> <span>&nbsp${tbHalfyear.a9} </td>
	    </tr>
	    
	       <tr>
	      	<td rowspan="2" style="text-align: center;font-weight:bold ;">积极</br>组织</br>开展</br>反腐</br>倡廉</br>教育</td>
	      	<td rowspan="2" style="text-align: center;font-weight:bold ;">20</td>
	      	<td width="2%" style="text-align: center;font-weight:bold ;">10</td>
	      	<td style="font-weight:bold ;font-size:13px;">1、积极参加党委（党组）、纪委或纪检监察部门组织的党课、党风廉政教育等党风廉政建设活动。</td>
	      	<td style="font-weight:bold ;font-size:13px;">部门人员无故不参加统一组织的党风廉政建设活动每少1人／次扣1分。</td>
	      	<td> <span>&nbsp${tbHalfyear.a10}</td>
	      	<td rowspan="2">
	      		<span>&nbsp${tbHalfyear.c}
	      	</td>
	    </tr>
	     <tr>
	      	<td width="2%" style="text-align: center;font-weight:bold ;">10</td>
	      	<td style="font-weight:bold ;font-size:13px;">2、部门应定期组织党风廉政教育，其中重要节假日、部门人员出国、外出培训、调研检查前应进行提醒教育。</td>
	      	<td style="font-weight:bold ;font-size:13px;">部门组织党风廉政教育季度少于1次、重要节假日、部门人员出国、外出培训、检查前未进行提醒教育的每少1次各扣1分。</td>
	      	<td><span>&nbsp${tbHalfyear.a11}  </td>
	    </tr>
	    
	      <tr>
	      	<td rowspan="3" style="text-align: center;font-weight:bold ;">加强</br>案件</br>与</br>事故</br>防范</td>
	      	<td rowspan="3" style="text-align: center;font-weight:bold ;">20</td>
	      	<td width="2%" style="text-align: center;font-weight:bold ;">8</td>
	      	<td style="font-weight:bold ;font-size:13px;">1、部门主要领导要认真处理影响本部门和谐与安全稳定的突出问题，努力营造良好的工作环境。</td>
	      	<td style="font-weight:bold ;font-size:13px;">部门工作人员发生违法、违规、违纪行为，经调查核实属实的每一起扣4分。</td>
	      	<td><span>&nbsp${tbHalfyear.a12} </td>
	      	<td rowspan="3">
	      		<span>&nbsp${tbHalfyear.d}
	      	</td>
	    </tr>
	     <tr>
	      	<td width="2%" style="text-align: center;font-weight:bold ;">5</td>
	      	<td style="font-weight:bold ;font-size:13px;">2、认真落实案件防范责任制。</td>
	      	<td style="font-weight:bold ;font-size:13px;">部门负责人在案件防范工作中履行职责不到位的该项不得分。</td>
	      	<td><span>&nbsp${tbHalfyear.a13}  </td>
	    </tr>
	     <tr>
	      	<td width="2%" style="text-align: center;font-weight:bold ;">7</td>
	      	<td style="font-weight:bold ;font-size:13px;">3、对责任范围内发现重大问题的要及时报告、处置。</td>
	      	<td style="font-weight:bold ;font-size:13px;">对本部门发现的重大问题未及时报告、处置的每一起扣3分。</td>
	      	<td><span>&nbsp${tbHalfyear.a14} </td>
	    </tr>
	    
	     <tr>
	      	<td style="text-align: center;font-weight:bold ;">作风<br>与<br>行风<br>建设<br>情况</td>
	      	<td style="text-align: center;font-weight:bold ;">15</td>
	      	<td width="2%" style="text-align: center;font-weight:bold ;">15</td>
	      	<td style="font-weight:bold ;font-size:13px;">努力加强机关作风建设，形成廉洁、务实、高效的机关作风。</td>
	      	<td style="font-weight:bold ;font-size:13px;">未制订部门作风建设工作计划、部门人员工作职责不明确或存在明显违反行风建设规定，造成不良影响和严重后果的该项不得分。部门工作人员不遵守劳动纪律、在行务、政务公开工作中履行职责不到位造成服务对象投诉经调查属实的每一起扣3分。</td>
	      	<td><span>&nbsp${tbHalfyear.a15} </td>
	      	<td >
	      		<span>&nbsp${tbHalfyear.e}
	      	</td>
	    </tr>
	    
	      <tr>
	      	<td colspan="7" style="font-weight:bold ;">部门落实党风廉政建设责任制自查得分：<span id="allScore"></span></td>
	    </tr>
	     <tr>
	      	<td colspan="7"style="font-weight:bold ;">部门负责人签字：<span style="font-weight:normal;">${tbHalfyear.sign}</span><span style="text-align: right;float:right;margin-right:140px"><fmt:formatDate value="${tbHalfyear.signTime}" pattern="yyyy年MM月dd日"/></span></td>
	    </tr>
</table> 
</body>
</html>