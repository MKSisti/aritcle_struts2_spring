<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="common/css/styles.css" rel="stylesheet" type="text/css">
<title>Home</title>
</head>
<body>
	<div style="width: 90%; margin: auto; margin-top: 3%">
		<s:if test="%{mode_insertion == 'creating'}">
			<div style="width: 50%; margin-top: 3%">
				<s:url namespace="/" action="index" var="l"></s:url>
	
				<s:form action="doCreate" method="post">
					<s:textfield label="Name" minlength="8" required="true"
						name="a.name"></s:textfield>
					<s:textfield label="Description" minlength="8" name="a.description"></s:textfield>
					<s:textfield type="number" step="1" label="Count" required="true"
						name="a.count"></s:textfield>
					<s:textfield type="number" step="0.1" default="0" required="true"
						label="Price" name="a.price"></s:textfield>
					<s:submit class="button primary" value="Save Article"></s:submit>
				</s:form>
			</div>
		</s:if>
		<s:else>
			<div style="width: 50%; margin-top: 3%">
				<s:url namespace="/" action="index" var="l"></s:url>
				
				<s:form action="doUpdate" method="post">
					<s:hidden name="a.code"></s:hidden>
					<s:textfield label="Name" minlength="8" required="true"
						name="a.name"></s:textfield>
					<s:textfield label="Description" minlength="8" name="a.description"></s:textfield>
					<s:textfield label="Count" step="1" required="true" name="a.count"></s:textfield>
					<s:textfield label="Price" step="0.1" default="0" required="true"
						name="a.price"></s:textfield>
					<s:submit class="button primary" value="Update Article"></s:submit>
				</s:form>
			</div>
		</s:else>

		<!-- 
		<div style="width: 200px">
			<s:a class="button success" href="%{cr}">Create</s:a>
		</div> -->
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
							<td><s:property value="code" /></td>
							<td><s:property value="name" /></td>
							<td><s:property value="description" /></td>
							<td><s:property value="price" /></td>
							<td><s:property value="count" /></td>
							<!-- update link -->
							<s:url namespace="/" action="goToUpdate" var="up">
								<s:param name="code">
									<s:property value="code" />
								</s:param>
								<s:param name="mode_insertion">
									<s:property value="updating" />
								</s:param>
							</s:url>
							<td><s:a class="button update" href="%{up}">Edit</s:a></td>
							<!-- delete link -->
							<s:url namespace="/" action="doDelete" var="del">
								<s:param name="code">
									<s:property value="code" />
								</s:param>
							</s:url>
							<td><s:a class="button delete" href="%{del}">Delete</s:a></td>
						</tr>
					</s:iterator>

				</table>
			</s:else>

		</div>
		<footer style="margin-top: 2%;	">
			Examen_Mohammed Karim_SISTI
		</footer>
	</div>
</body>
</html>
