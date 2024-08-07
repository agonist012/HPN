<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="zone.framework.model.base.SessionInfo"%>
<%@ page import="zone.framework.model.base.RolePO"%>
<%@ page import="zone.framework.model.base.OrganizationPO"%>
<%@ page import="zone.framework.model.base.ResourcePO"%>
<%@ page import="zone.framework.model.easyui.Tree"%>
<%@ page import="zone.framework.util.base.DateUtil"%>
<%@ page import="zone.framework.util.base.BeanUtils"%>
<%@ page import="zone.framework.util.base.ConfigUtil"%>
<%@ page import="zone.framework.util.base.StringUtil"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Set"%>
<%@ page import="java.util.HashSet"%>
<%
	String contextPath = request.getContextPath();
	SessionInfo sessionInfo = (SessionInfo) session.getAttribute(ConfigUtil.getSessionInfoName());
	Set<RolePO> roles = sessionInfo.getUser().getFrmRoles();//用户的角色
	Set<OrganizationPO> organizations = sessionInfo.getUser().getFrmOrganizations();//用户的机构
	List<ResourcePO> resources = new ArrayList<ResourcePO>();//用户可访问的资源
	for (RolePO role : roles) {
		resources.addAll(role.getFrmResources());
	}
	for (OrganizationPO organization : organizations) {
		resources.addAll(organization.getFrmResources());
	}
	resources = new ArrayList<ResourcePO>(new HashSet<ResourcePO>(resources));//去重
	List<Tree> resourceTree = new ArrayList<Tree>();
	for (ResourcePO resource : resources) {
		Tree node = new Tree();
		BeanUtils.copyNotNullProperties(resource, node);
		node.setText(resource.getName());
		if (resource.getFrmResource() != null) {
			node.setPid(resource.getFrmResource().getId());
		}
		resourceTree.add(node);
	}
	String resourceTreeJson = com.alibaba.fastjson.JSON.toJSONString(resourceTree);
%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<jsp:include page="../inc.jsp"></jsp:include>
<%
	out.println("<script>var resourceTreeJson = '" + resourceTreeJson + "';</script>");
%>
<script type="text/javascript">
	$(function() {
		$('#resources').tree({
			parentField : 'pid',
			data : eval("(" + resourceTreeJson + ")")
		});
	});
</script>
</head>
<body class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',fit:true,border:false">
		<table style="width: 100%;">
			<tr>
				<td><fieldset>
						<legend>用户信息</legend>
						<table class="table" style="width: 100%;">
							<tr>
								<th>用户ID</th>
								<td><%=sessionInfo.getUser().getId()%></td>
								<th>使用IP</th>
								<td><%=sessionInfo.getUser().getIp()%></td>
							</tr>
							<tr>
								<th>登录名</th>
								<td><%=sessionInfo.getUser().getLoginName()%></td>
								<th>姓名</th>
								<td><%=sessionInfo.getUser().getName()%></td>
							</tr>
							<tr>
								<th>性别</th>
								<td>
									<%
										if (sessionInfo.getUser().getSex() != null && sessionInfo.getUser().getSex().equals("1")) {
											out.print("男");
										} else {
											out.print("女");
										}
									%>
								</td>
								<th>年龄</th>
								<td><%=sessionInfo.getUser().getAge()%></td>
							</tr>
							<tr>
								<th>创建时间</th>
								<td><%=DateUtil.dateToString(sessionInfo.getUser().getCreateDatetime())%></td>
								<th>最后修改时间</th>
								<td><%=DateUtil.dateToString(sessionInfo.getUser().getUpdateDatetime())%></td>
							</tr>
						</table>
					</fieldset></td>
			</tr>
			<tr>
				<td>
					<fieldset>
						<legend>权限信息</legend>
						<table class="table" style="width: 100%;">
							<thead>
								<tr>
									<th>角色</th>
									<th>机构</th>
									<th>权限</th>
								</tr>
							</thead>
							<tr>
								<td valign="top">
									<%
										out.println("<ul>");
										for (RolePO role : roles) {
											out.println(StringUtil.formateString("<li title='{1}'>{0}</li>", role.getName(), role.getDescription()));
										}
										out.println("</ul>");
									%>
								</td>
								<td valign="top">
									<%
										out.println("<ul>");
										for (OrganizationPO organization : organizations) {
											out.println(StringUtil.formateString("<li>{0}</li>", organization.getName()));
										}
										out.println("</ul>");
									%>
								</td>
								<td valign="top"><ul id="resources"></ul></td>
							</tr>
						</table>
					</fieldset>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>