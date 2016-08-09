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
//增加单位信息
function toAddUnit(unitId){
		var href = "${ctx }/yy/toUnitEdit?unitId"+unitId;
		var returnValue = window.showModalDialog( href,'self',"dialogHeight=600px;dialogWidth=800px;center=yes");
		 if (returnValue==1){
			 query();
		 }
}

//删除单位
function toDelUnit(unitId){
	if(confirm("确定删除该单位吗？")){
	$.post("${ctx}/yy/toDelUnit?unitId="+unitId, 
            { Action: "post"},
            function (data, textStatus){
            	query();
             }
            , "json");
	}
}

//修改单位信息
function toEditUnit(unitId){
		href = "${ctx}/yy/toUnitEdit?unitId="+unitId;
		var returnValue = window.showModalDialog( href,'self',"dialogHeight=600px;dialogWidth=800px;center=yes");
		 if (returnValue==1){
			 query();
		 }
}

function query(){
	$('#queryForm').submit();
}




</script>


<body>
<jsp:include page="/tiles/cj/header.jsp"/>
<br/> 

<form id="queryForm" name="queryForm" action="toUnitList" method="post">
<div class="container">

	
    <div class="row">
        <div class="col-md-3">
            <jsp:include page="../menu.jsp"/>
        </div>
        <div class="col-md-9">
        
        <h2 class="page-header" style="margin-top: 5px">单位管理
        	<span style="float: right;padding-right: 10px">
        		<button type="button" class="btn btn-warning" onclick="toAddUnit()">新增单位</button>
        	</span>
        </h2>
        
        <!--  
        <table width="98%">
        	<tr>
            	<td><h2 class="page-header" style="margin-top: 5px">单位管理</h2></td>
				<td align="right" style=>
					<input type="button" id="button" class="minButton" value="增加 " onclick="toAddUnit()"/>
				</td>					
			</tr>	   
        </table>
            -->
		
            <div class="content">
            	
                <div class="panel-body">
               
                      <div class="adv-table">
                                        
                        <table  class="display table table-bordered table-striped" id="dynamic-table">
                        	
                            
                            <thead>
                            <tr>
                                <th>编号</th>
                                <th>单位名</th>                                
                                <th>单位地址</th>
                                <th>联系人</th>
                                <th>电话</th>
                                <th>操作</th>
                            </tr>

                            </thead>
                            <tbody>
                            <c:forEach items="${obj.unitList}" var="unit" varStatus="status">
                            <tr>
                            	<td>${status.index+1 }</td>
                            	<td>${unit.unitName }</td>
                            	<td>${unit.unitAddress }</td>
                            	<td>${unit.unitContactPerson }</td>
                            	<td>${unit.unitTelephone }</td>
			        			<td>
			        				<a href="#" onclick="toEditUnit('${unit.unitId }')">修改</a>
			        				&nbsp;
			        				<a href="#" onclick="toDelUnit('${unit.unitId }')">删除</a>			        	
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>

        </div>

    </div>
</div>
</form>
    <jsp:include page="/tiles/cj/foot.jsp"/>

</body>
<script type="text/javascript" language="javascript" src="${ctx}/tiles/data-tables/jquery.dataTables.js"></script>
<script type="text/javascript" src="${ctx}/tiles/data-tables/DT_bootstrap.js"></script>
<!--dynamic table initialization -->
<script src="${ctx}/tiles/data-tables/dynamic_table_init.js"></script>

</html>
