

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'socio.label', default: 'Socio')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="socio.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: socioInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="socio.username.label" default="Username" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: socioInstance, field: "username")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="socio.nome.label" default="Nome" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: socioInstance, field: "nome")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="socio.cognome.label" default="Cognome" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: socioInstance, field: "cognome")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="socio.indirizzo.label" default="Indirizzo" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: socioInstance, field: "indirizzo")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="socio.civico.label" default="Civico" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: socioInstance, field: "civico")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="socio.cap.label" default="Cap" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: socioInstance, field: "cap")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="socio.citta.label" default="Citta" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: socioInstance, field: "citta")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="socio.provincia.label" default="Provincia" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: socioInstance, field: "provincia")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="socio.dataDiNascita.label" default="Data Di Nascita" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${socioInstance?.dataDiNascita}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="socio.fisso.label" default="Fisso" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: socioInstance, field: "fisso")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="socio.mobile.label" default="Mobile" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: socioInstance, field: "mobile")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="socio.email.label" default="Email" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: socioInstance, field: "email")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="socio.codiceFiscale.label" default="Codice Fiscale" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: socioInstance, field: "codiceFiscale")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="socio.enabled.label" default="Enabled" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${socioInstance?.enabled}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="socio.documenti.label" default="Documenti" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${socioInstance.documenti}" var="d">
                                    <li><g:link controller="documento" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="socio.oggetti.label" default="Oggetti" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${socioInstance.oggetti}" var="o">
                                    <li><g:link controller="oggetto" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
				<tr class="prop">
					<td valign="top" class="name">Roles:</td>
					<td valign="top" class="value">
						<ul>
						<g:each in="${roleNames}" var='name'>
							<li>${name}</li>
						</g:each>
						</ul>
					</td>
				</tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${socioInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
