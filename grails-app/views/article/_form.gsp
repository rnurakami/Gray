



<div class="fieldcontain ${hasErrors(bean: articleInstance, field: 'contDate', 'error')} required">
	<label for="contDate">
		<g:message code="article.contDate.label" default="Cont Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="contDate" precision="day"  value="${articleInstance?.contDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: articleInstance, field: 'contributor', 'error')} ">
	<label for="contributor">
		<g:message code="article.contributor.label" default="Contributor" />
		
	</label>
	<g:textField name="contributor" value="${articleInstance?.contributor}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: articleInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="article.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${articleInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: articleInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="article.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${articleInstance?.title}"/>
</div>

