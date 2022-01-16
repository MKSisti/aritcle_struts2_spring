<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="common/css/styles.css" rel="stylesheet" type="text/css">
<title>Home</title>
</head>
<body>
	<div style="width: 90%; margin: auto; margin-top: 3%">
	<s:url namespace="/" action="goToCreate" var="cr"></s:url>
	
		<div style="width:200px">
			<s:a class="button success" href="%{cr}">Create</s:a>
		</div>
		<div style="margin-top: 20px;">
		<s:if test="%{articles.size()==0}">
			<h1>No articles to show</h1>
		</s:if>
		<s:else>
			<table id="mytb">
					<tr>
						<th>Code</th>
						<th>Name</th>
						<th>Description</th>
						<th>Price</th>
						<th>Count</th>
						<th>Update</th>
						<th>Delete</th>
					</tr>
					<s:iterator value="articles" var="art">
						<tr>
							<td><s:property value="code"/></td>
							<td><s:property value="name"/></td>
							<td><s:property value="description"/></td>
							<td><s:property value="price"/></td>
							<td><s:property value="count"/></td>
							<!-- update link -->
							<s:url namespace="/" action="goToUpdate" var="up">
								<s:param name="code">
									<s:property value="code"/>
								</s:param>
							</s:url>
							<td><s:a class="button update" href="%{up}">Edit</s:a></td>
							<!-- delete link -->
							<s:url namespace="/" action="doDelete" var="del">
								<s:param name="code">
									<s:property value="code"/>
								</s:param>
							</s:url>
							<td><s:a class="button delete" href="%{del}">Delete</s:a></td>
						</tr>
					</s:iterator>
						
				</table>
			</s:else>
				
		</div>
	</div>
</body>
</html>