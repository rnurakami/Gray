

<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'article.label', default: 'Article')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-article" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-article" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="contDate" title="${message(code: 'article.contDate.label', default: 'Cont Date')}" />
					
						<g:sortableColumn property="contributor" title="${message(code: 'article.contributor.label', default: 'Contributor')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'article.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="title" title="${message(code: 'article.title.label', default: 'Title')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${articleInstanceList}" status="i" var="articleInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${articleInstance.id}">${fieldValue(bean: articleInstance, field: "contDate")}</g:link></td>
					
						<td>${fieldValue(bean: articleInstance, field: "contributor")}</td>
					
						<td>${fieldValue(bean: articleInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: articleInstance, field: "title")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${articleInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
