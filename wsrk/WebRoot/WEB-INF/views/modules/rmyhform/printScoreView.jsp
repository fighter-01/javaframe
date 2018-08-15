<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<html>
<head>
	<title>考核表预览及下发</title>
	<meta name="decorator" content="default"/>
<object id="WebBrowser" classid=CLSID:8856F961-340A-11D0-A96B-00C04FD705A2 height="0" width="0"> 
</object> 
<%--scriptx打印 <object id="xprint" style="display:none" classid="clsid:1663ed61-23eb-11d2-b92f-008048fdd814" codebase="${ctxStatic}/smsx.cab#version=6,5,439,72"></object>
 --%><%--   	 <OBJECT  ID="jatoolsPrinter" CLASSID="CLSID:B43D3361-D075-4BE2-87FE-057188254255" codebase="${ctxStatic}/jatoolsPrinter.cab#version=8,6,0,0"></OBJECT>  
 --%>
 <%--  <object id="jatoolsPrinter" codebase="${ctxStatic}/jatoolsPrinter.cab#version=5,4,0,0"
        classid="clsid:B43D3361-D075-4BE2-87FE-057188254255" width="0" height="0">
           <!--  <embed id="ejatoolsPrinter" type="application/x-vnd.jatoolsPrinter"
            pluginspage="jatoolsPrinter.exe" width="0" height="0"
            /> --> --%>
 <script src="${ctxStatic}/ckfinder/ckfinder.js" type="text/javascript"></script>
	<script src="${ctxStatic}/confirm/js/confirm.js" type="text/javascript"></script>
	<script src="${ctxStatic}/jquery-plugin/jquery.PrintArea.js" type="text/javascript"></script>
	<script type="text/javascript">
		
		function clickform(id){
			
			window.location.href="${ctx}/rmyhform/khformview/view?id="+id+"&fromflag=0";
	/* 		$.ajax({  
				type:'post',
				url:'${ctx}/rmyhform/khformview/table',
				
				async:true,
				data: {"id":id},  
				traditional: true,//可传递数组
				success:function(tabData){
					
					addResults(tabData);
				},
				error: function(XMLHttpRequest, textStatus, errorThrown) {
		            //  alert(XMLHttpRequest.readyState);
		           // alert(textStatus);
					//alert("请输入正确的查询条件!");
		        }
				
				
			}); */
				
	     }

	
	
		  function doPrint() {
			  
	            myDoc = {
	            	settings:{paperName:'a4',
	            		orientation:2,
	            		topMargin:100,
	                    leftMargin:100,
	                    bottomMargin:100,
	                    rightMargin:100},
	                documents: document,
	                /*
	                 要打印的div 对象在本文档中，控件将从本文档中的 id 为 'page1' 的div对象，
	                 作为首页打印id 为'page2'的作为第二页打印            */
	                copyrights: '杰创软件拥有版权  www.jatools.com' // 版权声明,必须   
	            };
	                
	            var jatoolsPrinter = document.getElementById("jatoolsPrinter");
	            jatoolsPrinter.printPreview(myDoc);
	           
	            	//jatoolsPrinter.print(myDoc, true); //打印设置
	            	
	             //
	            //document.getElementById("jatoolsPrinter").print(myDoc, false); // 直接打印，不弹出打印机设置对话框 
	        }
	
   /*  function doPrint(){
    
        window.print();
     } */
     
   
 	function printit(isZong, isSelectPrinter) {
	   //打印预览
 		document.all.WebBrowser.ExecWB(7,1) ;
	   //打印设置
 		//document.all.WebBrowser.ExecWB(6,6);
 		//页面设置
	   //document.all.WebBrowser.ExecWB(8,1)
	   //直接打印
	   //document.all.WebBrowser.ExecWB(6,1)
	   
 		/* ScriptX打印
 		//isZong:是否纵向打印   isSelectPrinter:是否选择打印机,false直接使用默认打印机打印
 		try {
 			xprint.printing.portrait = isZong;//true为纵向,false为横向
 			xprint.printing.footer = "页脚";//页脚
 			xprint.printing.header = "页眉";//页眉
 			xprint.printing.leftMargin =0.5;//左
 			xprint.printing.topMargin = 0.5;//上
 			xprint.printing.rightMargin = 0.5;//右
 			xprint.printing.bottomMargin = 0.5;//下

 			//xprint.printing.PageSetup(); //弹出打印设置窗口 
 			xprint.printing.Preview(); //弹出打印预览窗口 

 			//xprint.printing.Print(isSelectPrinter); //是否弹出打印机选择页面
 		 } catch(e) {
 				alert('没有设置默认打印机或安装smsx.exe文件');
 				//location.href='smsx.exe';
 		} */
 	}
</script>

 <style media=print>
.Noprint{display:none;}
.PageNext{page-break-after: always;}
</style>
</head>
<body>

<input class="Noprint" id="btnSubmit" onclick='printit()' style="float:right;margin-right:80px;margin-top: 10px" class="btn btn-primary" type="submit" value="&nbsp;打&nbsp;&nbsp;&nbsp;印&nbsp;"/>	
	<div id="page1">
	<h2 id="title" class="text-center">${title}</h2><br/>
<p>归属部门（支行）:<u>${officename}</u></p>
	<!-- 资料上报的上报按钮 -->	
<table class="table table-bordered">
 
    <tr>
      <th  width="7%">项目</th>
      <th width="15%">考核内容</th>
      <th  width="15%">考核标准</th>
      <th width="5%" >分值</th>
      <th width="15%"> 计分标准</th>
      <th width="15%">查阅资料</th>
	  <th width="5%" >扣分</th>
	  <th width="15%">扣分原因</th>
     
    </tr>

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
	      	<td>
		      		<c:forEach items="${rowdata.jfbzList}" var="jfbzdata">
		      			<p>${jfbzdata.name}</p>
		      		</c:forEach>
		      	</td>
	      	<td >
	      	 	<c:forEach items="${rowdata.fileDatail}" var="filedata">
	      			<p>${filedata.name}</p>
	      		</c:forEach>
	      	</td>
	      	 
		      	
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
		      
		   
		     	 <td>
			      	${rowdata.kfReason}
			     </td>
		 
	    </tr>
   </c:forEach> 
  </tbody>
</table> 
</div>
 
<%--  <OBJECT  ID="jatoolsPrinter" CLASSID="CLSID:B43D3361-D075-4BE2-87FE-057188254255" codebase="${ctxStatic}/jatoolsPrinter.cab#version=8,6,0,0"></OBJECT>  
     --%>        
</body>
		
	