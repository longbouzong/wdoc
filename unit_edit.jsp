<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/tiles/cj/title_setting.jsp"%>
<base target="_self">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/tiles/cj/meta.jsp"%>
<title>新增单位</title>
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
	<!-- 表单样式 -->
	<link href="${ctx}/tiles/data-tables/css/demo_page.css" rel="stylesheet" />
    <link href="${ctx}/tiles/data-tables/css/demo_table.css" rel="stylesheet" />
    <link rel="stylesheet" href="${ctx}/tiles/data-tables/DT_bootstrap.css" />
</head>
<script type="text/javascript">
var mainForm;
//检测单位是否存在
function checkUnit() {
	var unitName = $("#unitName").val();
	if($("#unitName").val() != ""){
		$.post("${ctx }/yy/checkUnit", 
	        { Action: "post","unitName":unitName},
	        function (data, textStatus){
	        	 //初始值
	        	if(data.result == "1"){
	            	$("#showMsg").html("单位名称已存在，请重新输入");
	            	$("#showMsg").css("color","red");
	            	$("#unitName").val("");
	        	}else{
	            	$("#showMsg").html("单位名称可以使用");
	            	$("#showMsg").css("color","green");
	        	}
	            
	         }
	        , "json");
	}else{
    	$("#showMsg").html("请输入单位名称");
    	$("#showMsg").css("color","red");
	}
}

function delUnit(){
	if (confirm('是否确定删除该用户？')){
		$('#state').val('0');
		mainForm.ignore();
		$('#mainForm').submit();	
	}
}

$(function(){
	mainForm = $("#mainForm").Validform({
		btnSubmit:"#button",		
		callback:function(form){
			var num = $(':checked').length;
			if ($('#state').val() == '0'){
				form[0].submit();
				return false;
			}
			if(confirm("确定要保存吗？")){
				form[0].submit();
			}
			return false;
		}
	});
});

</script>

<body>
<p style="text-align:center;font-size:20px;padding-bottom: 15px;padding-top: 10px"><b>单位信息</b></p>
	<form method="post" id="mainForm" action="${ctx }/yy/saveUnit">
	<input type="hidden" id="unitId" name="unit.unitId" />
	<input type="hidden" name="unit.state" id="state" value="1"/>
	<div>
		<table width="80%" class="table_multilist" align="center">
  			<tr id="result">
  				<td width="20%" style="text-align:right; height:30px">单位名称：</td>
  				<td width="30%" >
  				<c:if test="${obj.unitId == null }">
  					&nbsp;<input type="text" class="dfinput" style="width:95%" id="unitName" name="unit.unitName" onblur="checkUnit()" value="${obj.unit.unitName}" datatype="*1-15"  nullmsg="请输入单位名称！" errormsg="长度不超过15个汉字！"/>
  				</c:if>
  				<c:if test="${obj.unitId != null }">
  					${obj.unit.unitName} <input type="hidden"  name="unit.unitName" value="${obj.unit.unitName}" />
  				</c:if>
  				</td>
  				<td colspan="2" style="text-align:left; height:30px">&nbsp;
  					<span id="showMsg">
  						<c:if test="${obj.unitId == null }">
  							<font color="red">请填写详细的单位名称!</font>
  						</c:if>
  					</span>
  				</td>		
  			</tr>
  			
  			<tr>
  				<td width="20%" style="text-align:right; height:30px">单位地址：</td>
  				<td width="30%">&nbsp;<input type="text" class="dfinput" style="width:95%" id="unitAddress" name="unit.unitAddress" value="${obj.unit.unitAddress}" datatype="*1-50" ignore="ignore" />
  				</td>
  						
  			</tr>
  						
  			<tr>
  				<td width="20%" style="text-align:right; height:30px">单位联系人：</td>
  				<td width="30%">&nbsp;<input type="text" class="dfinput" style="width:95%" id="unitContactPerson" name="unit.unitContactPerson" value="${obj.unit.unitContactPerson}" datatype="*1-50" ignore="ignore" />
  				</td>
  				<td width="20%" style="text-align:right; height:30px">联系人电话：</td>
  				<td width="30%">&nbsp;<input type="text" class="dfinput" style="width:95%" id="dept" name="unit.unitTelephone" value="${obj.unit.unitTelephone}" datatype="m" ignore="ignore" errormsg="请输入正确的手机号！"/>
  				</td>			
  			</tr>	
		</table>
	</div>
		<div style="text-align: center;margin-top: 20px;padding-bottom: 10px">
		<input type="button" id="button"  class="button" value="保存" /> 
		<c:if test="${obj.unitId != null }">
		<input type="button" id="delButton"  class="button" value="删除单位" onclick="delUnit();"/> 
		</c:if>		
		</div>
	</form>
</body>
</html>




