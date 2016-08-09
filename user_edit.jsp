<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/tiles/cj/title_setting.jsp"%>
<base target="_self">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增</title>
<%@ include file="/tiles/cj/meta.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctx }/skins/css/shi.css">
<!-- Loading Bootstrap -->
    <link href="${ctx}/tiles/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!--self-->
    <link rel="stylesheet" type="text/css" href="${ctx}/skins/css/wdoc.css"/>
    <!--font-awesome-->
    <link rel="stylesheet" type="text/css" href="${ctx}/tiles/awesome/css/font-awesome.min.css"/>
    <!-- Loading jquery -->
    <script type="text/javascript" src="${ctx}/tiles/js/jquery-2.2.3.min.js"></script>
    <!-- 表单验证组件 --> 
	<script type="text/javascript" src="${ctx}/tiles/js/Validform_v5.3.2.js"></script>
	<link rel="stylesheet" type="text/css" href="${ctx}/tiles/js/style_gzz.css"/>
	<link rel="stylesheet" type="text/css" href="${ctx}/tiles/uploadify/css/uploadify.css"/>
	<!-- md5加密 -->
	<script type="text/javascript" src="${ctx }/tiles/js/md5.js"></script>
	<!-- 表单样式 -->
	<link href="${ctx}/tiles/data-tables/css/demo_page.css" rel="stylesheet" />
    <link href="${ctx}/tiles/data-tables/css/demo_table.css" rel="stylesheet" />
    <link rel="stylesheet" href="${ctx}/tiles/data-tables/DT_bootstrap.css" />
</head>

<body>
	<p style="text-align:center;font-size:20px;padding-bottom: 15px;padding-top: 10px"><b>用户信息</b></p>
	<form method="post" id="mainForm" action="${ctx }/yy/saveWork">
	<input type="hidden" id="userId" name="user.userId" value="${obj.user.userId}" />
	<input type="hidden" id="unitId" name="user.unitId" value="${obj.unit.unitId}" />
	<input type="hidden" id="state" name="user.state" value="1"/>
	<div>
		<table width="80%" class="table_multilist" align="center">
  			<tr id="result">
  				<td width="20%" style="text-align:right; height:30px">登录名称：</td>
  				<td width="30%" >
  					<c:if test="${obj.userId == null }">
  						&nbsp;<input type="text" class="dfinput" style="width:95%" id="logonName" name="user.logonName" onblur="checkUser()" value="${obj.user.logonName}" datatype="*1-15"  nullmsg="请输入登录名称！" errormsg="长度不超过15个汉字！"/>
  					</c:if>
  					<c:if test="${obj.userId != null }">
  						${obj.user.logonName}
  						<input type="hidden"  name="user.logonName" value="${obj.user.logonName}" />
  					</c:if>
  				</td>
  				<td colspan="2" style="text-align:left; height:30px">&nbsp;
  					<span id="showMsg">
  						<c:if test="${obj.user.userId == null }">
  							<font color="red">登录名称请使用真实姓名!</font>
  						</c:if>
  					</span>
  					<c:if test="${obj.user.userId != null }">
			        	<a href='#' onclick="resetPwd('${obj.user.userId}')">重置密码</a> <label style="font-size:12px;color:red;">重置后密码为:111111</label>
			     	</c:if>
  				</td>		
  			</tr>
  			
  			<tr>
  				<td width="20%" style="text-align:right; height:30px">昵称：</td>
  				<td width="30%">&nbsp;<input type="text" class="dfinput" style="width:95%" id="displayName" name="user.displayName" value="${obj.user.displayName}" datatype="*1-50" ignore="ignore" errormsg="昵称长度不超过50个汉字！"/></td>
  			</tr>
  			
  			<c:if test="${obj.userId == null }">
  				<tr id="result">
  					<td width="20%" style="text-align:right; height:30px">用户密码：</td>
  					<td width="30%">
  						&nbsp;<input type="password" class="dfinput" style="width:95%" id="pwd" name="user.password" value="${obj.user.password}" datatype="*1-100"  nullmsg="请输入密码！" errormsg="长度不超过100个字符！"/>
  					</td>
  					<td width="20%"  style="text-align:right; height:30px">再次输入密码：</td>
  					<td width="30%">
  						&nbsp;<input type="password" class="dfinput" style="width:95%" id="pwd1" name="user.password1" value="${obj.user.password}" datatype="*1-100"  nullmsg="请输入密码！" errormsg="长度不超过100个字符！" />
  					</td>
  				</tr>
  			</c:if>
  			
  			<tr id="result">
  				<td width="20%" style="text-align:right; height:30px">用户归属：</td>
  				<td align="center" width="30%">&nbsp;					
	  				<c:if test="${obj.unit.unitId != null}">
	  					${obj.unit.unitName}
	  				</c:if>
  				</td>
  			</tr>	
  					
  			<tr>
  				<td width="20%" style="text-align:right; height:30px">邮箱：</td>
  				<td width="30%">&nbsp;<input type="text" class="dfinput" style="width:95%" id="eMail" name="user.eMail" value="${obj.user.eMail}" datatype="e" ignore="ignore" errormsg="请输入正确的邮箱"/></td>
  				<td width="20%" style="text-align:right; height:30px">部门：</td>
  				<td width="30%">&nbsp;<input type="text" class="dfinput" style="width:95%" id="dept" name="user.dept" value="${obj.user.dept}" datatype="*1-50" ignore="ignore" errormsg="部门长度不超过50个汉字！"/></td> 				
  			</tr>
  			
  			<tr>
  				<td width="20%" style="text-align:right; height:30px">职务：</td>
  				<td width="30%">&nbsp;<input type="text" class="dfinput" style="width:95%" id="position" name="user.position" value="${obj.user.position}" datatype="*1-50" ignore="ignore" errormsg="职务长度不超过50个汉字！"/></td>
  			</tr>		
		</table>
	</div>
	
	<div style="text-align: center;margin-top: 20px;padding-bottom: 10px">
		<input type="button" id="button"  class="button" value="保存" /> 
		<c:if test="${obj.user.userId != null }">
			<input type="button" id="delButton"  class="button" value="删除用户" onclick="delUser();"/> 
		</c:if>		
	</div>
	</form>
</body>

<script type="text/javascript">
var mainForm;
//使用md5加密用户密码
function checkPwd() {
	if($("#userId").val() == ""){
		if($("#pwd").val() != $("#pwd1").val()){
			alert("密码输入不一致！");
			return false;
		}
		$("#pwd").val(hex_md5($("#pwd1").val()));
	}
	return true;
	
}

//检测用户是否存在
function checkUser() {
	var logonName = $("#logonName").val();
	if($("#logonName").val() != ""){
		$.post("${ctx }/yy/checkUser", 
	        { Action: "post","logonName":logonName},
	        function (data, textStatus){
	        	 //初始值
	        	if(data.result == "1"){
	            	$("#showMsg").html("登录名称已存在，请重新输入");
	            	$("#showMsg").css("color","red");
	            	$("#logonName").val("");
	        	}else{
	            	$("#showMsg").html("登录名称可以使用");
	            	$("#showMsg").css("color","green");
	        	}
	            
	         }
	        , "json");
	}else{
    	$("#showMsg").html("请输入登录名称");
    	$("#showMsg").css("color","red");
	}
}

//重置密码
function resetPwd(userId){
	if(confirm("确定要重置密码吗？")){
	$.post("${ctx}/yy/resetPassword?userId="+userId, 
            { Action: "post"},
            function (data, textStatus){
            	if(data.result == "1"){
            		alert("操作成功！");
            	}else{
            		alert("操作失败！");
            	}
             }
            , "json");  
	}
}



$(function(){
	mainForm = $("#mainForm").Validform({
		btnSubmit:"#button",		
		callback:function(form){
			var flag = checkPwd();
			var num = $(':checked').length;
			if ($('#state').val() == '0'){
				form[0].submit();
				return false;
			}
			if(flag &&　confirm("确定要保存吗？")){
				form[0].submit();
			}
			return false;
		}
	});
});

function delUser(){
	if (confirm('是否确定删除该用户？')){
		$('#state').val('0');//state为1时显示，否则不显示。此处将state值变为0，即为不显示在屏幕上
		mainForm.ignore();
		$('#mainForm').submit();	
	}
}

</script>
</html>





