<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/tiles/cj/title_setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>${sys_title}</title>
    <%@ include file="/tiles/cj/meta.jsp" %>
    <!-- Loading Bootstrap -->
    <link href="${ctx}/tiles/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!--self-->
    <link rel="stylesheet" type="text/css" href="${ctx}/skins/css/wdoc.css"/>
    <!--font-awesome-->
    <link rel="stylesheet" type="text/css" href="${ctx}/tiles/awesome/css/font-awesome.min.css"/>
    <!-- Loading jquery -->
    <script type="text/javascript" src="${ctx}/tiles/js/jquery-2.2.3.min.js"></script>

    <link href="${ctx}/tiles/data-tables/css/demo_page.css" rel="stylesheet" />
    <link href="${ctx}/tiles/data-tables/css/demo_table.css" rel="stylesheet" />
    <link rel="stylesheet" href="${ctx}/tiles/data-tables/DT_bootstrap.css" />
    
    <link rel="stylesheet" type="text/css" href="${ctx}/skins/css/form.css">
    
</head>
<script type="text/javascript">
//修改用户信息
function toUserInfo(userId,unitId){
		href = "${ctx}/yy/toUserEdit?userId="+userId+"&unitId="+unitId;
		var returnValue = window.showModalDialog( href,'window',"dialogHeight=600px;dialogWidth=800px;center=yes");
		 if (returnValue==1){
			 query();
		 }
}

//增加用户信息
function toAddUser(unitId){
		var href = "${ctx }/yy/toUserEdit?unitId="+unitId;
		var returnValue = window.showModalDialog( href,'self',"dialogHeight=600px;dialogWidth=800px;center=yes");
		 if (returnValue==1){
			 query();
		 }
}

//删除用户
function toDelUnit(unitId){
	if(confirm("确定删除吗？")){
	$.post("${ctx}/work/delUnit?UnitId="+UnitId, 
            { Action: "post"},
            function (data, textStatus){
            	query();
             }
            , "json");
	}
}


function query(){
	$('#queryForm1').submit();
}
</script>
<body>
<jsp:include page="/tiles/cj/header.jsp"/>
<br/>
<form id="queryForm1" name="queryForm1" action="toUserList" method="post"> 
<div class="container">
    <div class="row">
        <div class="col-md-3">
            <jsp:include page="../menu.jsp"/>
        </div>
        <div class="col-md-9">
            <h2 class="page-header" style="margin-top: 5px">用户管理</h2>
            <div class="content">
                <div class="panel-body">
                    <div class="adv-table">                                       					
                        <table  class="display table table-bordered table-striped" id="dynamic-table" align="center">
                            <thead>                                                                                
                            <tr>
                                <td align="center"><b>序号</b></td>
                                <td align="center"><b>单位</b></td>
                                <td align="center"><b>登陆名</b></td>
                                <td align="center"><b>操作</b></td>
                            </tr>
                            </thead>
                            
                            <tbody>
                            <c:forEach items="${obj.unitList}" var="unit" varStatus="status">
                            	<tr>
                            		<td align="center">${status.count}</td>
                            		<td align="center">${unit.unitName}
                            		<td align="left">
                            			<c:forEach items="${obj.userList}" var="user" varStatus="status">
                            				<c:if test="${user.unitId == unit.unitId }">
                            					<a href='#' onclick="toUserInfo('${user.userId}','${unit.unitId}')">${user.logonName}</a>&nbsp;&nbsp;&nbsp;&nbsp;
                            				</c:if>
                            			</c:forEach>
                            		</td>
                            		<td align="center">			        			
			        					<input value="新增" type="button" id="button" class="btn btn-warning" onclick="toAddUser('${unit.unitId}')" />			        	
			        				</td>
                            	</tr>
                            </c:forEach>                               
                        </table>
                                            
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/tiles/cj/foot.jsp"/>
</form>
</body>
<script type="text/javascript" language="javascript" src="${ctx}/tiles/data-tables/jquery.dataTables.js"></script>
<script type="text/javascript" src="${ctx}/tiles/data-tables/DT_bootstrap.js"></script>
<!--dynamic table initialization -->
<script src="${ctx}/tiles/data-tables/dynamic_table_init.js"></script>
</html>
