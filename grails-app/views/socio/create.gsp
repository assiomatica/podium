


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'socio.label', default: 'Socio')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${socioInstance}">
            <div class="errors">
                <g:renderErrors bean="${socioInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
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
                                    <input type="password" id="passwd" name="passwd" value=""/>
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
					<g:each in="${authorityList}">
					<tr>
						<td valign="top" class="name" align="left">${it.authority.encodeAsHTML()}</td>
						<td align="left"><g:checkBox name="${it.authority}"/></td>
					</tr>
					</g:each>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="enabled"><g:message code="socio.enabled.label" default="Enabled" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: socioInstance, field: 'enabled', 'errors')}">
                                    <g:checkBox name="enabled" value="${socioInstance?.enabled}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
