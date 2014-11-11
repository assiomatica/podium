


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'socio.label', default: 'Socio')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${socioInstance}">
            <div class="errors">
                <g:renderErrors bean="${socioInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${socioInstance?.id}" />
                <g:hiddenField name="version" value="${socioInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="username"><g:message code="socio.username.label" default="Username" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: socioInstance, field: 'username', 'errors')}">
                                    <g:textField name="username" value="${socioInstance?.username}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="passwd"><g:message code="socio.passwd.label" default="Passwd" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: socioInstance, field: 'passwd', 'errors')}">
                                     <input type="password" id="passwd" name="passwd" value="${socioInstance.passwd?.encodeAsHTML()}"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nome"><g:message code="socio.nome.label" default="Nome" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: socioInstance, field: 'nome', 'errors')}">
                                    <g:textField name="nome" value="${socioInstance?.nome}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="cognome"><g:message code="socio.cognome.label" default="Cognome" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: socioInstance, field: 'cognome', 'errors')}">
                                    <g:textField name="cognome" maxlength="25" value="${socioInstance?.cognome}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="indirizzo"><g:message code="socio.indirizzo.label" default="Indirizzo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: socioInstance, field: 'indirizzo', 'errors')}">
                                    <g:textField name="indirizzo" value="${socioInstance?.indirizzo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="civico"><g:message code="socio.civico.label" default="Civico" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: socioInstance, field: 'civico', 'errors')}">
                                    <g:textField name="civico" value="${fieldValue(bean: socioInstance, field: 'civico')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="cap"><g:message code="socio.cap.label" default="Cap" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: socioInstance, field: 'cap', 'errors')}">
                                    <g:textField name="cap" value="${socioInstance?.cap}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="citta"><g:message code="socio.citta.label" default="Citta" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: socioInstance, field: 'citta', 'errors')}">
                                    <g:textField name="citta" value="${socioInstance?.citta}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="provincia"><g:message code="socio.provincia.label" default="Provincia" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: socioInstance, field: 'provincia', 'errors')}">
                                    <g:textField name="provincia" maxlength="2" value="${socioInstance?.provincia}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dataDiNascita"><g:message code="socio.dataDiNascita.label" default="Data Di Nascita" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: socioInstance, field: 'dataDiNascita', 'errors')}">
                                    <g:datePicker name="dataDiNascita" precision="day" value="${socioInstance?.dataDiNascita}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fisso"><g:message code="socio.fisso.label" default="Fisso" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: socioInstance, field: 'fisso', 'errors')}">
                                    <g:textField name="fisso" value="${socioInstance?.fisso}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="mobile"><g:message code="socio.mobile.label" default="Mobile" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: socioInstance, field: 'mobile', 'errors')}">
                                    <g:textField name="mobile" value="${socioInstance?.mobile}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="email"><g:message code="socio.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: socioInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${socioInstance?.email}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="codiceFiscale"><g:message code="socio.codiceFiscale.label" default="Codice Fiscale" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: socioInstance, field: 'codiceFiscale', 'errors')}">
                                    <g:textField name="codiceFiscale" value="${socioInstance?.codiceFiscale}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="enabled"><g:message code="socio.enabled.label" default="Enabled" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: socioInstance, field: 'enabled', 'errors')}">
                                    <g:checkBox name="enabled" value="${socioInstance?.enabled}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="documenti"><g:message code="socio.documenti.label" default="Documenti" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: socioInstance, field: 'documenti', 'errors')}">
                                    
<ul>
<g:each in="${socioInstance?.documenti?}" var="d">
    <li><g:link controller="documento" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="documento" action="create" params="['socio.id': socioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'documento.label', default: 'Documento')])}</g:link>

                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="oggetti"><g:message code="socio.documenti.label" default="Oggetti" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: socioInstance, field: 'oggetti', 'errors')}">
                                    
<ul>
<g:each in="${socioInstance?.oggetti?}" var="d">
    <li><g:link controller="oggetto" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="oggetto" action="create" params="['socio.id': socioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'oggettio.label', default: 'Oggetto')])}</g:link>

                                </td>
                            </tr>
                        
                            <!-- tr class="prop">
                                <td valign="top" class="name">
                                  <label for="oggetti"><g:message code="socio.oggetti.label" default="Oggetti" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: socioInstance, field: 'oggetti', 'errors')}">
                                    <g:select name="oggetti" from="${Oggetto.list()}" multiple="yes" optionKey="id" size="5" value="${socioInstance?.oggetti*.id}" />
                                </td>
                            </tr -->
					<tr class="prop">
						<td valign="top" class="name"><label for="authorities">Roles:</label></td>
						<td valign="top" class="value ${hasErrors(bean:person,field:'authorities','errors')}">
							<ul>
							<g:each var="entry" in="${roleMap}">
								<li>${entry.key.authority.encodeAsHTML()}
									<g:checkBox name="${entry.key.authority}" value="${entry.value}"/>
								</li>
							</g:each>
							</ul>
						</td>
					</tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
