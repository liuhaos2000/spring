<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户一览</title>
<link rel="stylesheet" type="text/css"
	href="${path}/js/common/easy_ui/themes/default/easyui.css"
	charset="utf-8" />
<link rel="stylesheet" type="text/css"
	href="${path}/js/common/easy_ui/themes/icon.css" charset="utf-8" />
<script type="text/javascript" src="${path}/js/common/jquery/jquery.js"></script>
<script type="text/javascript"
	src="${path}/js/common/easy_ui/src/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${path}/js/common/easy_ui/locale/easyui-lang-zh_CN.js"></script>

<script type="text/javascript">
	// 参数定义
	var path = '${path}';
	var backparam = '${backparam}';
	var sortName;
	var sortOrder;
	var pageSize;
	var pageNumber;
	var minEndDate;

	jQuery(function() {
		// 显示信息
		if (jQuery.trim('${message}')) {
			window.top.notice.open_hide('${message}');
		}
		// 初始化画面
		initlayout();
		// 初始化Grid
		initDateGrid();
	});
	function initlayout() {

		jQuery("#btSearch").click(function() {
			var params = getParams();
			jQuery('#dg').datagrid('reload', params);
		});

	}

	function initDateGrid() {
		setSeachParm();
		$('#dg').datagrid({
			//idField : 'userId',
			url : path + '/user/doSearch.do',
			queryParams : getParams(),
			striped : true,
			remoteSort : true,
			pagination : true,
			singleSelect : false,
			sortName : sortName,
			sortOrder : sortOrder,
			pageSize : pageSize,
			pageNumber : pageNumber,
			pageList : [ pageSize, pageSize * 2, pageSize * 3, pageSize * 4 ],
			height : '100%',
			//onSelect : selectChange,
			//onUnselect : selectChange,
			//onSelectAll : selectChange,
			//onUnselectAll : selectChange,
			onLoadSuccess : function() {
				//jQuery(this).datagrid("doCellTip", {});
			},
		});
	}
	/* 操作格式化 */
	function doFormatter(value, row, index) {

		var backparam = getParamsWhitPageInfo();

		var updateUrl = path + "/user/updateUser.do?userId="
				+ row.userId + "&backparam=" + JSON.stringify(backparam);

		var strLink;

		strLink = "<a class='td_caozuo' href=" + updateUrl + ">修改</a>";

		return strLink;
	}

	/* 设置参数*/
	function setSeachParm() {
		// 如果是初始化
		if (!backparam) {
			sortName = "userId";
			sortOrder = "desc";
			pageSize = "${pageSize}";
			pageNumber = 1;
			// 如果是返回
		} else {
			var parm = JSON.parse(backparam);
			jQuery("#userId").val(parm.userId);
			jQuery("#userName").val(parm.userName);
			jQuery("#birthdayFrom").val(parm.birthdayFrom);
			jQuery("#birthdayTo").val(parm.birthdayTo);

			sortName = parm.sort;
			sortOrder = parm.order;
			pageSize = parm.rows;
			pageNumber = parm.page;
		}
	}
	/* 获取参数*/
	function getParams() {
		var userId = jQuery("#userId").val();
		var userName = jQuery("#userName").val();
		var birthdayFrom = jQuery("#birthdayFrom").val();
		var birthdayTo = jQuery("#birthdayTo").val();

		var params = {
			userId : userId,
			userName : userName,
			birthdayFrom : birthdayFrom,
			birthdayTo : birthdayTo
		};
		return params;
	}
	/* 获取带分页信息的参数*/
	function getParamsWhitPageInfo() {
		var pageOptions = jQuery("#dg").datagrid('getPager').data("pagination").options;
		var tableOptions = jQuery("#dg").datagrid("options");
		var params = getParams();
		params.page = pageOptions.pageNumber;
		params.rows = pageOptions.pageSize;
		params.sort = tableOptions.sortName;
		params.order = tableOptions.sortOrder;
		return params;
	}
</script>
</head>
<body>
	<div class="public_con public_con_grid">
		<!--搜索条件区域-->
		<div class="page_header">
			<form id="searchForm">
				<table class="search_tab">
					<tr>
						<th>用户ID：</th>
						<td><input id="userId" type="text" class="easyui-textbox" /></td>
						<th>用户名称：</th>
						<td><input id="userName" type="text"
							class="easyui-textbox" /></td>
						<th>生日：</th>
						<td><input id="birthdayFrom" type="text"
							class="easyui-datebox" /> -
							<input id="birthdayFrom" type="text"
                            class="easyui-datebox" />
							
						</td>
						<th><a id="btSearch" href="#" class="easyui-linkbutton"
							data-options="iconCls:'icon-search'">查询</a></th>
					</tr>
				</table>
			</form>
		</div>
		<div class="page_explain">注： 用户列表！</div>

		<div>
		</div>

	</div>
            <table class="easyui-datagrid" id="dg">
                <thead>
                    <tr>
                        <th data-options="field:'userId',width:100">用户ID</th>
                        <th data-options="field:'userName',width:100">用户名</th>
                        <th data-options="field:'birthday',width:100,align:'right'">生日</th>
                        <th data-options="field:'userPassword',width:100,formatter:doFormatter,align:'right'">操作</th>
                    </tr>
                </thead>
            </table>
</body>
</html>