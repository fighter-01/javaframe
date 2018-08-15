<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>${fns:getConfig('productName')} 登录</title>

	<%-- <script src="${ctxStatic}/myplugins/layer/layer.js" type="text/javascript"></script> --%>
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/login/page.css">
		

	<meta name="renderer" content="webkit"><meta http-equiv="X-UA-Compatible" content="IE=8,IE=9,IE=10" />
	<meta http-equiv="Expires" content="0"><meta http-equiv="Cache-Control" content="no-cache"><meta http-equiv="Cache-Control" content="no-store">
	<script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
	<script src="${ctxStatic}/bootstrap/2.3.1/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="${ctxStatic}/bootstrap/bsie/js/bootstrap-ie.min.js" type="text/javascript"></script>
	<script src="${ctxStatic}/jquery-select2/3.4/select2.min.js" type="text/javascript"></script>
	<script src="${ctxStatic}/jquery-validation/1.11.0/jquery.validate.min.js" type="text/javascript"></script>
	<script src="${ctxStatic}/jquery-jbox/2.3/jquery.jBox-2.3.min.js" type="text/javascript"></script>
	<script src="${ctxStatic}/common/mustache.min.js" type="text/javascript"></script>
	<script src="${ctxStatic}/common/javamg.min.js" type="text/javascript"></script>
	<script type="text/javascript">var ctx = '${ctx}', ctxStatic='${ctxStatic}';</script>
	
	<link href="${ctxStatic}/bootstrap/2.3.1/css_${not empty cookie.theme.value ? cookie.theme.value : 'cerulean'}/bootstrap.min.css" type="text/css" rel="stylesheet" />
		
	<script type="text/javascript">
	/*  $(function(){
	        $.ajaxSetup({ cache:false });
	        
	 }); */
		$(document).ready(function() {
			$("#loginForm").validate({
				rules: {
					validateCode: {remote: "${pageContext.request.contextPath}/servlet/validateCodeServlet"}
				},
				messages: {
					username: {required: "请填写用户名."},password: {required: "请填写密码."},
					validateCode: {remote: "验证码不正确.", required: "请填写验证码."}
				},
				errorLabelContainer: "#messageBox",
				errorPlacement: function(error, element) {
					error.appendTo($("#loginError").parent());
				} 
			});
		});
		
		// 如果在框架或在对话框中，则弹出提示并跳转到首页
		if(self.frameElement && self.frameElement.tagName == "IFRAME" || $('#left').length > 0 || $('.jbox').length > 0){
			alert('未登录或登录超时。请重新登录，谢谢！');
			top.location = "${ctx}";
		}
		
		function myTrim(){
			var obj = document.getElementById("loginForm").username;
			obj.value = obj.value.replace(/(^\s*)|(\s*$)/g, "");
		}
		/* function doSubmit(){
			
			alert("sdfasf");
			//if(chkForm(document.forms("LogonForm"))){
			var form = document.getElementById("loginForm");
			
				form.submit();
			
		} */
		
		
	function doReset(){
		alert("ddsds");
	}
	</script>
	<style>
		.header {
    		height: 80px;
    		padding-top: 20px;
		}	
		.alert {
		    padding: 8px 35px 8px 14px;
		    margin-bottom: 20px;
		    text-shadow: 0 1px 0 rgba(255,255,255,0.5);
		    background-color: #f1ceab;
		    border: 1px solid #efb99e;
		    -webkit-border-radius: 4px;
		    -moz-border-radius: 4px;
		    border-radius: 4px;
		}
	.alert, .alert h4 {
	    color: #dd5600;
	}	
	</style>
</head>
<body scroll="no" class="logon_body">
	<!--[if lte IE 6]><br/><div class='alert alert-block' style="text-align:left;padding-bottom:10px;"><a class="close" data-dismiss="alert">x</a><h4>温馨提示：</h4><p>你使用的浏览器版本过低。为了获得更好的浏览体验，我们强烈建议您 <a href="http://browsehappy.com" target="_blank">升级</a> 到最新版本的IE浏览器，或者使用较新版本的 Chrome、Firefox、Safari 等。</p></div><![endif]-->
		<div id="messageBox" class="alert alert-error ${empty message ? 'hide' : ''}"><button data-dismiss="alert" class="close">×</button>
			<label id="loginError" class="error">${message}</label>
		</div>	
	<form id="loginForm" class="form-signin" action="${ctx}/login" method="post">
		
		<div class="logon" align="center">
		
		<div class="logon_mid_center">
			
			<div class="logon_user">用户名：<input style="background-color:transparent;" id="username" name="username"   class="input_class" type="text"></div>
			<!--  <div class="logon_user">密码：<input type="password" name="Password" value="000000als" onKeyPress="javascript:pressEnter(2, event);"  class="input_class"/></div>-->
			<div class="logon_user">密码：<input id="password" name="password"  class="input_class" type="password"></div>
		 	<c:if test="${isValidateCodeLogin}"><div class="validateCode">
				<label class="input-label mid " for="validateCode" style=" margin-left:8px;display:inline;color: #576e94;font-size: 12px;">验证码：</label>
				<sys:validateCode   name="validateCode" inputCssStyle="margin-bottom:0;width:50px"/>
			</div></c:if>
		<%--  	<label for="rememberMe" title="下次不需要再登录"><input type="checkbox" id="rememberMe" style="padding-top: 10px" name="rememberMe" ${rememberMe ? 'checked' : ''}/> 记住我（公共场所慎用）</label> --%>
		 	
			<input class="btn  btn-primary" type="submit" value="登 录" style="margin-top: 23px;margin-left: -10px;"/>&nbsp;&nbsp;
		
			<div class="logon_button"></div>
			
			</div>
			</div>
		     <div style = "text-align:right;margin-bottom: 13px">
		     	<a style="margin-right: 30px" href="${ctxStatic}/Firefox-57.0.4.6577-setup.exe">Firefox下载</a>
			</div>
	</form>
	<a class="logon_sysstyle" href="javascript:void(0)"></a>
	
	<script src="${ctxStatic}/flash/zoom.min.js" type="text/javascript"></script>
</body>
</html>