<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="common/css/styles.css" rel="stylesheet" type="text/css">
<title>Update</title>
</head>
<body>
	<div style="width:50%;margin:auto;margin-top:3%">
		<s:url namespace="/" action="index" var="l"></s:url>
		<div style="width:200px">
			<s:a class="button success" href="%{l}">Go Back</s:a>
		</div>
		
		<s:form action="doUpdate" method="post">
			<s:hidden name="a.code"></s:hidden>
			<s:textfield label="Name"  minlength="8" required="true" name="a.name"></s:textfield>
			<s:textfield label="Description"  minlength="8" name="a.description"></s:textfield>
			<s:textfield label="Count" step="1" required="true" name="a.count"></s:textfield>
			<s:textfield label="Price" step="0.1" default="0" required="true" name="a.price"></s:textfield>
			<s:submit class="button primary" value="Update Article"></s:submit>
		</s:form>
	</div>
</body>
</html>